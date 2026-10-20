# Reporte de Bugs — E-commerce QA

## BUG-001: Correos electrónicos duplicados

- **Caso de prueba relacionado:** SQL-002.
- **Módulo:** Usuarios.
- **Severidad:** Media.
- **Prioridad:** Alta.
- **Estado:** Abierto.
- **Descripción:** Se detectaron dos usuarios que comparten el correo electrónico `ana@gmail.com`.
- **Precondiciones:** La tabla `usuarios` contiene los datos de prueba.
- **Pasos para reproducir:**
  1. Ejecutar la consulta SQL-002.
  2. Revisar los correos electrónicos que aparecen más de una vez.
- **Resultado esperado:** Cada usuario debe tener un correo electrónico único.
- **Resultado obtenido:** El correo `ana@gmail.com` aparece dos veces.
- **Evidencia:** Resultado de SQL-002 en MySQL Workbench.
- **Conclusión de QA:** Se identificó una inconsistencia de datos. Se recomienda validar la unicidad del correo electrónico.

---

## BUG-002: Usuario sin correo electrónico

- **Caso de prueba relacionado:** SQL-003.
- **Módulo:** Usuarios.
- **Severidad:** Media.
- **Prioridad:** Media.
- **Estado:** Abierto.
- **Descripción:** Se encontró un usuario sin correo electrónico registrado.
- **Precondiciones:** La tabla `usuarios` contiene los datos de prueba.
- **Pasos para reproducir:**
  1. Ejecutar la consulta SQL-003.
  2. Revisar los usuarios cuyo correo sea `NULL`.
- **Resultado esperado:** Todos los usuarios deben tener un correo electrónico registrado.
- **Resultado obtenido:** El usuario José tiene el correo en `NULL`.
- **Evidencia:** Resultado de SQL-003 en MySQL Workbench.
- **Conclusión de QA:** Se identificó un registro incompleto que debe revisarse.

---

## BUG-003: Pedidos con montos inválidos

- **Caso de prueba relacionado:** SQL-004.
- **Módulo:** Pedidos.
- **Severidad:** Alta.
- **Prioridad:** Alta.
- **Estado:** Abierto.
- **Descripción:** Se encontraron pedidos con montos iguales o inferiores a cero.
- **Precondiciones:** La tabla `pedidos` contiene los datos de prueba.
- **Pasos para reproducir:**
  1. Ejecutar la consulta SQL-004.
  2. Revisar los pedidos cuyo monto sea menor o igual a cero.
- **Resultado esperado:** Todos los pedidos deben tener un monto mayor que cero, según la regla de negocio definida para este ejercicio.
- **Resultado obtenido:** El pedido de Monitor tiene un monto de `0.00` y el de Audifonos tiene un monto de `-50.00`.
- **Evidencia:** Resultado de SQL-004 en MySQL Workbench.
- **Conclusión de QA:** Se detectaron dos registros que incumplen la regla de negocio establecida.

---

## BUG-004: Pedido asociado a un usuario inexistente

- **Caso de prueba relacionado:** SQL-005.
- **Módulo:** Pedidos.
- **Severidad:** Alta.
- **Prioridad:** Alta.
- **Estado:** Abierto.
- **Descripción:** Se encontró un pedido asociado a un usuario que no existe en la tabla `usuarios`.
- **Precondiciones:** Las tablas `usuarios` y `pedidos` contienen los datos de prueba.
- **Pasos para reproducir:**
  1. Ejecutar la consulta SQL-005.
  2. Revisar los pedidos que no tienen un usuario correspondiente.
- **Resultado esperado:** Todos los pedidos deben estar asociados a usuarios existentes.
- **Resultado obtenido:** El pedido con ID `101` tiene `usuario_id = 8`, pero no existe un usuario con ese identificador.
- **Evidencia:** Resultado de SQL-005 en MySQL Workbench.
- **Conclusión de QA:** Se detectó una inconsistencia de integridad referencial. Se recomienda revisar la relación entre usuarios y pedidos.