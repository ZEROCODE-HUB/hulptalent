-- ============================================================================
-- Eliminacion de cuenta de talento  (App Store Review Guideline 5.1.1(v))
--
-- Ejecutado en produccion (zexegravzidwloxeimxx) el 2026-08-12.
-- Repetir en el proyecto de test si se va a probar alli.
--
-- ----------------------------------------------------------------------------
-- POR QUE ESTA FUNCION NO ES UN SIMPLE "DELETE FROM usuarios"
-- ----------------------------------------------------------------------------
-- El esquema real (FKs verificadas contra la base, no supuestas) tiene esta
-- cadena de cascadas:
--
--   usuarios  <--(profesional_id, ON DELETE CASCADE)--  solicitudes_servicio
--   solicitudes_servicio  --CASCADE-->  transacciones
--                         --CASCADE-->  recibos  --CASCADE--> recibo_items
--                         --CASCADE-->  chats_solicitud --CASCADE--> mensajes_chat
--                         --CASCADE-->  resenas, calificaciones, cleanup_programado
--
-- Es decir: borrar un talento a secas arrastraria TODAS las solicitudes en las
-- que trabajo, y con ellas los PAGOS, RECIBOS y CHATS DE LOS CLIENTES. Datos
-- que no son suyos y que ademas son registro contable.
--
-- Por eso el primer paso es soltar el vinculo (profesional_id = null) ANTES de
-- borrar nada. La columna ya es nullable y la app ya la trata como opcional
-- (una solicitud sin profesional asignado es un estado normal), asi que no
-- rompe ninguna pantalla.
--
-- ----------------------------------------------------------------------------
-- CRITERIO
-- ----------------------------------------------------------------------------
--   BORRAR     datos personales del talento sin obligacion de retencion:
--              perfil, certificaciones, referencias, servicios, cuentas
--              bancarias, metodos de pago, tarjetas, favoritos, conversaciones,
--              notificaciones y la cuenta de auth.
--
--   ANONIMIZAR soporte: guarda nombre/telefono/email desnormalizados en texto
--              plano, sin FK. La fila sobrevive para el historial del ticket.
--
--   PRESERVAR  solicitudes_servicio, transacciones, recibos, recibo_items y
--              chats de los CLIENTES: se les quita el vinculo al talento, no se
--              borran. Es su historial y su registro de pago.
--
--   SE PIERDE  (por cascada de FKs que no se pueden evitar sin cambiar el
--              esquema, ver nota al final):
--                - resenas y calificaciones recibidas por el talento
--                - sus propios mensajes de chat (los del cliente sobreviven)
--                - sus propios recibos como proveedor
--                - sus propias transacciones (ver nota)
-- ============================================================================

create or replace function public.eliminar_mi_cuenta()
returns json
language plpgsql
security definer
set search_path = public, auth
as $$
declare
  v_uid              uuid := auth.uid();
  v_rol              text;
  v_solicitudes      int  := 0;
  v_transacciones    int  := 0;
  v_perfil           int  := 0;
begin
  -- Sin parametros a proposito: el usuario sale de auth.uid(), asi que es
  -- imposible que un cliente pida borrar la cuenta de otra persona.
  if v_uid is null then
    raise exception 'No hay sesion activa' using errcode = '28000';
  end if;

  select rol into v_rol from public.usuarios where id = v_uid;

  -- ------------------------------------------------------------------------
  -- 1. CORTAR LA CASCADA  (obligatorio, va primero)
  --    Sin esto se destruyen las solicitudes, pagos y recibos de los clientes.
  -- ------------------------------------------------------------------------
  update public.solicitudes_servicio
     set profesional_id = null
   where profesional_id = v_uid;
  get diagnostics v_solicitudes = row_count;

  -- ------------------------------------------------------------------------
  -- 2. ANONIMIZAR
  -- ------------------------------------------------------------------------
  -- soporte.id_proveedor es TEXT y no tiene FK: hay que castear y limpiarlo a
  -- mano o los datos personales quedarian vivos tras el borrado.
  update public.soporte
     set nombre_proveedor   = 'Cuenta eliminada',
         telefono_proveedor = null,
         email_proveedor    = null
   where id_proveedor = v_uid::text;

  -- ------------------------------------------------------------------------
  -- 3. TRANSACCIONES PROPIAS
  --    transacciones.usuario_id -> usuarios es NO ACTION y NOT NULL: si queda
  --    una sola fila apuntando al usuario, el DELETE final aborta entero.
  --    No se puede poner a null (la columna es NOT NULL y el getter de Dart es
  --    no-nulable: `getField<String>('usuario_id')!`), asi que se borran.
  --    Hoy son 0 filas: ningun proveedor tiene transacciones propias, todas
  --    pertenecen a clientes y quedan protegidas por el paso 1.
  -- ------------------------------------------------------------------------
  delete from public.transacciones where usuario_id = v_uid;
  get diagnostics v_transacciones = row_count;

  -- ------------------------------------------------------------------------
  -- 4. BORRAR datos personales
  --    Casi todas estas tablas ya tienen ON DELETE CASCADE, pero se listan
  --    explicitamente para que el borrado no dependa de que nadie afloje una
  --    FK en el futuro. conversaciones NO tiene FK: aqui es imprescindible.
  -- ------------------------------------------------------------------------
  delete from public.tarjetas_guardadas    where usuario_id = v_uid;
  delete from public.metodos_pago          where usuario_id = v_uid;
  delete from public.cuentas_bancarias     where usuario_id = v_uid;
  delete from public.certificaciones       where usuario_id = v_uid;
  delete from public.referencias_laborales where usuario_id = v_uid;
  delete from public.profesional_servicios where usuario_id = v_uid;
  delete from public.favoritos             where usuario_id = v_uid;
  delete from public.conversaciones        where usuario_id = v_uid;
  delete from public.cleanup_programado    where usuario_id = v_uid;
  delete from public.user_notifications    where user_id    = v_uid;

  delete from public.notificaciones
   where usuario_id = v_uid or proveedor_id = v_uid;

  -- usuarios_externos.id es el uuid de auth; id_usuario es un bigint de
  -- secuencia, NO comparar contra un uuid.
  delete from public.usuarios_externos where id = v_uid;

  delete from public.usuarios where id = v_uid;
  get diagnostics v_perfil = row_count;

  -- ------------------------------------------------------------------------
  -- 5. Cuenta de autenticacion, al final: una vez borrada, auth.uid() deja de
  --    resolver dentro de esta misma transaccion.
  -- ------------------------------------------------------------------------
  delete from auth.users where id = v_uid;

  return json_build_object(
    'ok', true,
    'uid', v_uid,
    'rol', v_rol,
    'perfil_borrado', v_perfil > 0,
    'solicitudes_liberadas', v_solicitudes,
    'transacciones_borradas', v_transacciones
  );
end;
$$;

-- Solo usuarios autenticados. Nunca anon.
revoke all on function public.eliminar_mi_cuenta() from public, anon;
grant execute on function public.eliminar_mi_cuenta() to authenticated;

comment on function public.eliminar_mi_cuenta() is
  'Elimina la cuenta del usuario autenticado y sus datos personales. Libera '
  'solicitudes_servicio.profesional_id antes de borrar para no arrastrar pagos '
  'y recibos de los clientes por cascada. Anonimiza soporte. '
  'Requerido por App Store Review Guideline 5.1.1(v).';

-- ============================================================================
-- NOTA PARA MAS ADELANTE (no aplicado: cambia el esquema)
--
-- Si el negocio quiere conservar tambien los recibos y transacciones propias
-- del talento en vez de perderlos, hay que:
--   alter table public.recibos       alter column proveedor_id drop not null;
--   alter table public.transacciones alter column usuario_id   drop not null;
--   ...y recrear ambas FK con ON DELETE SET NULL.
--
-- NO se hizo porque el codigo generado de FlutterFlow las lee como no-nulables
--   recibos.dart:23        String get proveedorId => getField<String>('proveedor_id')!;
--   transacciones.dart:24  String get usuarioId   => getField<String>('usuario_id')!;
-- y un null ahi reventaria la pantalla de recibos del cliente en runtime.
-- Primero habria que volver nulables esos getters en las 3 apps.
-- ============================================================================
