# E-commerce QA — Validación de datos con SQL

## Descripción del proyecto

Proyecto práctico de **Aseguramiento de la Calidad (QA)** enfocado en la validación de datos de una tienda de comercio electrónico mediante consultas SQL.

El proyecto simula actividades de testing de bases de datos para identificar inconsistencias, verificar reglas de negocio, evaluar la integridad de los datos y documentar posibles defectos.

## Objetivos

- Validar la consistencia e integridad de los datos de usuarios y pedidos.
- Identificar correos electrónicos duplicados.
- Detectar usuarios sin correo electrónico registrado.
- Identificar pedidos asociados a usuarios inexistentes.
- Detectar pedidos con montos iguales o inferiores a cero.
- Documentar los casos de prueba, resultados y posibles defectos encontrados.

## Herramientas y tecnologías

- **SQL:** consultas para la validación de datos.
- **Base de datos relacional:** tablas `usuarios` y `pedidos`.
- **Visual Studio Code:** edición y documentación del proyecto.
- **Git y GitHub:** control de versiones y publicación del portafolio.

## Estructura del proyecto

```text
ecommerce-qa-sql/
│
├── README.md
│
├── sql/
│   ├── 01_esquema_y_datos.sql
│   └── 02_pruebas_validacion.sql
│
├── casos-de-prueba/
│   └── casos_prueba.md
│
└── bugs/
    └── reporte_bugs.md
```

## Casos de prueba implementados

| ID | Caso de prueba | Objetivo |
|---|---|---|
| SQL-001 | Verificar la existencia de datos | Comprobar que las tablas contienen registros consultables. |
| SQL-002 | Detectar correos duplicados | Identificar usuarios que comparten el mismo correo electrónico. |
| SQL-003 | Detectar correos faltantes | Identificar usuarios cuyo correo electrónico es `NULL`. |
| SQL-004 | Detectar montos inválidos | Encontrar pedidos con montos iguales o inferiores a cero. |
| SQL-005 | Detectar pedidos sin usuario válido | Identificar pedidos asociados a usuarios inexistentes. |

## Hallazgos identificados

Durante las pruebas realizadas con los datos de ejemplo se identificaron las siguientes inconsistencias:

- **Correos duplicados:** el correo `ana@gmail.com` aparece asociado a dos registros.
- **Correos faltantes:** se identificó un usuario sin correo electrónico registrado.
- **Montos inválidos:** se encontraron dos pedidos con montos de `0.00` y `-50.00`.
- **Integridad referencial:** se identificó un pedido asociado al `usuario_id = 8`, sin un usuario correspondiente en la tabla `usuarios`.

Estos hallazgos corresponden a las reglas de negocio definidas para este proyecto de práctica. No implican, por sí solos, que se haya demostrado un defecto en una aplicación real.

## Metodología de pruebas

Para cada caso de prueba se documentan los siguientes elementos:

1. Identificador y nombre del caso de prueba.
2. Objetivo y regla de negocio.
3. Precondiciones y pasos de ejecución, cuando corresponda.
4. Consulta SQL utilizada.
5. Resultado esperado.
6. Resultado obtenido.
7. Estado de la prueba: `PASS`, `FAIL` o `PENDIENTE`.
8. Conclusión de QA y evidencia de ejecución.

## Resultados de las pruebas

Las pruebas se ejecutan sobre datos de ejemplo preparados para simular escenarios válidos e inválidos.

- **PASS:** la validación cumple el resultado esperado.
- **FAIL:** la validación identifica datos que incumplen la regla de negocio.
- **PENDIENTE:** la prueba todavía no ha sido ejecutada o su resultado no ha sido confirmado.

Los resultados se documentan en `casos-de-prueba/casos_prueba.md`. Los posibles defectos se registran en `bugs/reporte_bugs.md` cuando corresponda.

## Estado del proyecto

**En desarrollo.**

Se han definido y ejecutado consultas de validación para los casos SQL-002, SQL-003, SQL-004 y SQL-005. La verificación completa de SQL-001 está pendiente de documentar.

## Próximas mejoras

- Completar la verificación y documentación de SQL-001.
- Crear reportes de bugs con pasos de reproducción, evidencia, severidad y prioridad.
- Incorporar restricciones de integridad en el esquema de base de datos.
- Ampliar las pruebas con escenarios positivos y negativos.
- Publicar evidencias de ejecución y mantener actualizado el repositorio.

---

**Proyecto de portafolio QA:** práctica de testing de bases de datos con SQL.