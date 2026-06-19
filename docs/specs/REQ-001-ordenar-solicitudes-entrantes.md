# REQ-001 — Ordenar "Solicitudes Entrantes" por fecha y hora (asc)

| Campo            | Valor                                             |
|------------------|---------------------------------------------------|
| **ID**           | REQ-001                                            |
| **Versión**      | v1.0.0                                             |
| **Estado**       | 🟡 Propuesta — pendiente de validación             |
| **Tipo**         | Mejora de UI / ordenamiento de lista              |
| **Componente**   | `lib/pages/solicitudes/solicitudes_widget.dart`   |
| **Backend**      | Supabase — tabla `solicitudes_servicio`           |

---

## 1. Requerimiento

Ordenar la lista de la sección **"Solicitudes Entrantes"** por **fecha y hora de la reserva**,
con `direction = asc` (la reserva más próxima/temprana primero).

## 2. Contexto actual

En `solicitudes_widget.dart` (~línea 713) la sección "Solicitudes Entrantes" se construye
filtrando el stream de `solicitudes_servicio` por estado, **sin ningún ordenamiento**:

```dart
final serviciosent = containerSolicitudesServicioRowList
    .where((e) => e.estado == 'entrantes')
    .toList();
```

La lista hereda el orden que devuelve el stream (sin garantía), por lo que las solicitudes
aparecen en orden arbitrario.

Campos relevantes en `solicitudes_servicio` (ver `tables/solicitudes_servicio.dart`):

- `fecha` → `DateTime` (fecha agendada de la reserva, no nulo).
- `hora` → `PostgresTime` (hora agendada de la reserva, no nulo).

## 3. Objetivo

Que la sección "Solicitudes Entrantes" muestre las solicitudes ordenadas **ascendentemente**:

1. Primero por `fecha` (reserva más temprana primero).
2. Como desempate dentro de la misma fecha, por `hora` ascendente.

## 4. Decisión de diseño (a validar)

**Ordenamiento en cliente**, sobre la lista ya filtrada por `estado == 'entrantes'`, siguiendo
el patrón existente de `soporte_widget.dart` (`.sortedList(keyOf: ..., desc: false)`).

Motivos:

- Mínimo cambio y aislado a la sección objetivo.
- No modifica el `stream` de Supabase en tiempo real (el `stream().order()` solo permite
  ordenar de forma confiable por **una** columna, y aquí se requieren dos: `fecha` + `hora`).
- No afecta otras listas ni la lógica de negocio.

> **Alternativa descartada (a validar):** ordenar a nivel de `stream` con `.order('fecha')`
> (patrón de `chat_widget.dart`). Se descarta porque no cubre el desempate por `hora`.

## 5. Comportamiento esperado

- La solicitud con `fecha` + `hora` más temprana aparece **primera**.
- Dos solicitudes con la misma `fecha` se ordenan por `hora` ascendente.
- El ordenamiento se re-aplica automáticamente cuando el stream emite cambios (tiempo real).
- No cambia ningún otro comportamiento de la pantalla.

## 6. Implementación propuesta (referencia para Fase 2)

Reemplazar el filtrado actual por filtrado + ordenamiento por dos campos:

```dart
final serviciosent = containerSolicitudesServicioRowList
    .where((e) => e.estado == 'entrantes')
    .toList()
  ..sort((a, b) {
    final porFecha = a.fecha.compareTo(b.fecha);
    if (porFecha != 0) return porFecha;        // asc por fecha
    return a.hora.compareTo(b.hora);           // asc por hora (desempate)
  });
```

> **Nota técnica a verificar en Fase 2:** confirmar la API de comparación de `PostgresTime`
> (si no expone `compareTo`, se normalizará `hora` a un valor comparable, p. ej. minutos del
> día, sin alterar el dato). Esto se resolverá en implementación, no cambia el spec.

## 7. Fuera de alcance

- No se modifican otras secciones (p. ej. "aceptadas", "en proceso", etc.).
- No se cambia el filtro de estado ni el `servicio_id`.
- No se modifica el esquema de la base de datos.
- No se toca la lógica de aceptación, pago ni notificaciones.

## 8. Criterios de aceptación

- [ ] En "Solicitudes Entrantes", las tarjetas se muestran de la reserva más temprana a la
      más tardía (`fecha` asc, luego `hora` asc).
- [ ] El orden se mantiene tras una actualización en tiempo real del stream.
- [ ] No hay regresiones en otras secciones de la pantalla.
- [ ] La app compila con Flutter 3.35.0 / Dart 3.9.0.

## 9. Preguntas abiertas

- ¿Confirmas el ordenamiento **en cliente** (sección 4) en lugar de a nivel de stream?
- ¿El desempate por `hora` es correcto, o basta con ordenar solo por `fecha`?

---

## Changelog

- **v1.0.0** — Creación inicial del spec para REQ-001 (ordenar "Solicitudes Entrantes" por
  `fecha` + `hora` ascendente, ordenamiento en cliente). Estado: pendiente de validación.
