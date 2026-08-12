// ============================================================================
// Revocacion del token de Sign in with Apple al eliminar la cuenta.
//
// Apple lo pide en la guia de eliminacion de cuentas (Guideline 5.1.1(v)):
// "Apps that support Sign in with Apple should use the Sign in with Apple REST
// API to revoke user tokens."
//
// Desplegar (pendiente, desde la raiz del repo):
//   supabase functions deploy revocar-apple --project-ref zexegravzidwloxeimxx
//
// Secrets: YA CARGADOS en el proyecto el 2026-08-12. No hay que volver a
// ponerlos. Son estos cuatro:
//   APPLE_TEAM_ID        7D2MKM79GM
//   APPLE_CLIENT_ID      com.hulp.talentohulp
//   APPLE_KEY_ID         6VY5XBUHGR
//   APPLE_PRIVATE_KEY    contenido de AuthKey_6VY5XBUHGR.p8 (con BEGIN/END)
//
// La key vive en keystores\ios-hulp\AuthKey_6VY5XBUHGR.p8. Es una key de
// "Sign in with Apple", NO confundir con AuthKey_R65HQK7Q6S.p8, que es la de
// App Store Connect API y sirve para subir builds. Ambas son .p8 de 257 bytes.
//
// SUPABASE_URL y SUPABASE_ANON_KEY los inyecta la plataforma sola.
//
// Mientras la funcion no este desplegada la app la llama, falla en silencio y
// elimina la cuenta igual: este paso es complementario, no bloquea el borrado.
// ============================================================================

import { createClient } from 'https://esm.sh/@supabase/supabase-js@2';

const CORS = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type',
};

/** Convierte el .p8 (PKCS#8, base64) en una CryptoKey para firmar ES256. */
async function importarClaveP8(p8: string): Promise<CryptoKey> {
  const cuerpo = p8
    .replace(/-----BEGIN PRIVATE KEY-----/, '')
    .replace(/-----END PRIVATE KEY-----/, '')
    .replace(/\s/g, '');
  const der = Uint8Array.from(atob(cuerpo), (c) => c.charCodeAt(0));

  return await crypto.subtle.importKey(
    'pkcs8',
    der,
    { name: 'ECDSA', namedCurve: 'P-256' },
    false,
    ['sign'],
  );
}

const b64url = (data: Uint8Array | string): string => {
  const bytes = typeof data === 'string' ? new TextEncoder().encode(data) : data;
  return btoa(String.fromCharCode(...bytes))
    .replace(/\+/g, '-')
    .replace(/\//g, '_')
    .replace(/=+$/, '');
};

/**
 * Genera el client_secret que exige Apple: un JWT firmado con ES256.
 * WebCrypto ya devuelve la firma en formato IEEE P1363 (r||s), que es
 * justo lo que Apple espera. Con librerias de Node hay que forzar
 * dsaEncoding: 'ieee-p1363' o Apple rechaza el token.
 */
async function generarClientSecret(): Promise<string> {
  const teamId = Deno.env.get('APPLE_TEAM_ID')!;
  const clientId = Deno.env.get('APPLE_CLIENT_ID')!;
  const keyId = Deno.env.get('APPLE_KEY_ID')!;
  const privateKey = Deno.env.get('APPLE_PRIVATE_KEY')!;

  const ahora = Math.floor(Date.now() / 1000);
  const header = { alg: 'ES256', kid: keyId, typ: 'JWT' };
  const payload = {
    iss: teamId,
    iat: ahora,
    exp: ahora + 300, // 5 min: se usa al instante, no hace falta mas
    aud: 'https://appleid.apple.com',
    sub: clientId,
  };

  const entrada = `${b64url(JSON.stringify(header))}.${b64url(JSON.stringify(payload))}`;
  const clave = await importarClaveP8(privateKey);
  const firma = await crypto.subtle.sign(
    { name: 'ECDSA', hash: 'SHA-256' },
    clave,
    new TextEncoder().encode(entrada),
  );

  return `${entrada}.${b64url(new Uint8Array(firma))}`;
}

Deno.serve(async (req) => {
  if (req.method === 'OPTIONS') {
    return new Response('ok', { headers: CORS });
  }

  try {
    // La sesion del usuario debe seguir viva: se llama ANTES de borrar.
    const authHeader = req.headers.get('Authorization');
    if (!authHeader) {
      return new Response(JSON.stringify({ error: 'Falta Authorization' }), {
        status: 401,
        headers: { ...CORS, 'Content-Type': 'application/json' },
      });
    }

    const supabase = createClient(
      Deno.env.get('SUPABASE_URL')!,
      Deno.env.get('SUPABASE_ANON_KEY')!,
      { global: { headers: { Authorization: authHeader } } },
    );

    const { data: { user }, error } = await supabase.auth.getUser();
    if (error || !user) {
      return new Response(JSON.stringify({ error: 'Sesion invalida' }), {
        status: 401,
        headers: { ...CORS, 'Content-Type': 'application/json' },
      });
    }

    // Si no entro por Apple no hay nada que revocar: no es un error.
    const entroPorApple = user.identities?.some((i) => i.provider === 'apple');
    if (!entroPorApple) {
      return new Response(
        JSON.stringify({ ok: true, revocado: false, motivo: 'no-apple' }),
        { headers: { ...CORS, 'Content-Type': 'application/json' } },
      );
    }

    const { refresh_token: refreshToken } = await req.json().catch(() => ({}));
    if (!refreshToken) {
      return new Response(
        JSON.stringify({ ok: true, revocado: false, motivo: 'sin-token' }),
        { headers: { ...CORS, 'Content-Type': 'application/json' } },
      );
    }

    const clientSecret = await generarClientSecret();

    const respuesta = await fetch('https://appleid.apple.com/auth/revoke', {
      method: 'POST',
      headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
      body: new URLSearchParams({
        client_id: Deno.env.get('APPLE_CLIENT_ID')!,
        client_secret: clientSecret,
        token: refreshToken,
        token_type_hint: 'refresh_token',
      }),
    });

    // Apple responde 200 con cuerpo vacio cuando la revocacion sale bien.
    if (!respuesta.ok) {
      const detalle = await respuesta.text();
      console.error('Apple rechazo la revocacion:', respuesta.status, detalle);
      return new Response(
        JSON.stringify({ ok: false, revocado: false, status: respuesta.status, detalle }),
        { status: 502, headers: { ...CORS, 'Content-Type': 'application/json' } },
      );
    }

    return new Response(JSON.stringify({ ok: true, revocado: true }), {
      headers: { ...CORS, 'Content-Type': 'application/json' },
    });
  } catch (e) {
    console.error('Error revocando token de Apple:', e);
    return new Response(JSON.stringify({ ok: false, error: String(e) }), {
      status: 500,
      headers: { ...CORS, 'Content-Type': 'application/json' },
    });
  }
});
