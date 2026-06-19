# Instrucciones Generales — Especificaciones (SDD)

> **Ubicación:** `docs/specs/CLAUDE.md`
> **Propósito:** Reglas generales que toda IA y todo colaborador deben seguir al trabajar
> con requerimientos y especificaciones en este repositorio.

## 1. Enfoque de trabajo: Spec Driven Development (SDD)

El desarrollo sigue **SDD (Spec Driven Development)**. El flujo es estricto y en dos fases:

1. **Fase 1 — Especificación:** primero se escribe y se lee el requerimiento en un archivo
   `spec.md` (uno por requerimiento, ver sección 6). No se escribe ni una línea de código
   hasta que la especificación esté **cerrada y validada** por el responsable.
2. **Fase 2 — Implementación:** una vez validado el spec, se implementa el código basándose
   **única y exclusivamente** en lo definido en dicho spec.

## 2. Patrón de código y diseño

- **Sigue el mismo patrón de código** existente en el proyecto. No introduzcas arquitecturas
  nuevas ni redundantes.
- **Sigue el mismo patrón de diseño** (UI/UX) ya presente en la app.
- El proyecto usa **Flutter**, pero fue **exportado desde FlutterFlow**; por eso tiene esa
  estructura (Custom Actions, Custom Functions, Custom Widgets, App State, components, pages,
  `backend/supabase/...`). Respeta esa estructura y consistencia.
- **Código limpio y entendible:** nombres claros, mínima complejidad, sin sobreingeniería.

## 3. Cero suposiciones

- **PROHIBIDO SUPONER.** Si un requerimiento es ambiguo o falta contexto sobre una variable,
  API, tabla o comportamiento, **detente y pregunta** antes de continuar.
- Es preferible una pregunta precisa a un cambio que rompa el entorno o la lógica de negocio.

## 4. Stack técnico

- **Flutter:** 3.35.0
- **Dart:** 3.9.0
- **Backend:** Supabase
- **Origen del proyecto:** exportado de FlutterFlow.

## 5. Preservación de la lógica de negocio

Ningún cambio o refactorización puede alterar o romper la lógica de negocio existente.
La aplicación debe compilar y mantener su comportamiento actual, sin regresiones.

## 6. Reglas para los archivos `spec.md`

- **Siempre se crea un archivo spec** cuando se pida un requerimiento distinto a implementar
  en la aplicación. **Antes de crearlo, primero se pregunta** lo que sea ambiguo.
- Los specs viven en `docs/specs/`, **uno por requerimiento**, nombrados por su ID
  (ej.: `docs/specs/REQ-001-ordenar-solicitudes-entrantes.md`).
- Cada spec lleva **control de versiones** (ej.: v1.0.0 → v1.0.1) con un changelog que detalle
  qué cambió y por qué.
- El spec debe estar **validado** antes de pasar a la Fase 2 (implementación).

## 7. Entregas y control de versiones (Git)

- Al final de cada cambio (spec o implementación) se sugiere un **mensaje de commit limpio**
  siguiendo Conventional Commits (ej.: `feat(spec): add REQ-001 ordering spec v1.0.0`).
- El push lo realiza el responsable manualmente.
