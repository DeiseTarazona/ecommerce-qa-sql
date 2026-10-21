# Caso de prueba SQL-001: Verificar la existencia de datos

- **Módulo:** Usuarios y pedidos.
- **Objetivo:** Comprobar que las tablas `usuarios` y `pedidos` contienen registros consultables.
- **Tipo de prueba:** Validación de datos.
- **Precondiciones:** Las tablas están creadas y los datos de prueba fueron insertados correctamente.
- **Prioridad:** Media.
- **Pasos de ejecución:**
  1. Consultar la tabla `usuarios`.
  2. Consultar la tabla `pedidos`.
  3. Verificar que ambas consultas devuelvan los registros existentes.

- **Consultas SQL ejecutadas:**

  ```sql
  SELECT * FROM usuarios;

  SELECT * FROM pedidos;
  ```

- **Resultado esperado:** Ambas consultas se ejecutan correctamente y muestran los registros existentes en cada tabla.
- **Resultado obtenido:** Las consultas se ejecutaron correctamente y mostraron los registros de las tablas usuarios y pedidos.
- **Estado:** PASS (prueba aprobada).
- **Conclusión de QA:** Se verificó que ambas tablas contienen registros consultables y que las consultas SQL se ejecutan correctamente. Esta prueba confirma la disponibilidad de los datos, pero no garantiza por sí sola su integridad o exactitud.
- **Evidencia:** Capturas de los resultados obtenidos en MySQL Workbench.

# Caso de prueba SQL-002: Detectar correos duplicados

* **Módulo:** Usuarios.
* **Objetivo:** Identificar correos electrónicos repetidos en la tabla usuarios.
* **Tipo de prueba:** Integridad de datos.
* **Regla de negocio:** Cada usuario debe tener un correo electrónico único.
* **Prioridad:** Alta.
* **Consulta SQL ejecutada:**

    SELECT correo, COUNT(*) AS cantidad
    FROM usuarios
    WHERE correo IS NOT NULL
    GROUP BY correo
    HAVING COUNT(*) > 1;

* **Resultado esperado:** La consulta no debe devolver registros.
* **Resultado obtenido:** El correo ana@gmail.com aparece 2 veces.
* **Estado:** FAIL (la validación no se cumple).
* **Conclusión de QA:** Se detectó un posible defecto de integridad de datos, debido a que dos usuarios comparten el mismo correo electrónico.
- **Evidencia:** Capturas de los resultados obtenidos en MySQL Workbench.

# Caso de prueba SQL-003: Detectar correos faltantes

* **Módulo:** Usuarios.
* **Objetivo:** Identificar usuarios que no tienen un correo electrónico registrado.
* **Tipo de prueba:** Validación de campos obligatorios.
* **Regla de negocio:** Todos los usuarios deben tener un correo electrónico registrado.
* **Prioridad:** Alta.
* **Consulta SQL ejecutada:**

    SELECT id, nombre, correo
    FROM usuarios
    WHERE correo IS NULL;

* **Resultado esperado:** La consulta no debe devolver registros.
* **Resultado obtenido:** El usuario José no tiene correo electrónico registrado.
* **Estado:** FAIL (la validación no se cumple).
* **Conclusión de QA:** Se detectó un registro incompleto que incumple la regla de negocio definida. Se recomienda revisar la validación del campo correo durante el registro de usuarios.
- **Evidencia:** Capturas de los resultados obtenidos en MySQL Workbench.

# Caso de prueba SQL-004: Detectar montos inválidos en pedidos

- **Módulo:** Pedidos.
- **Objetivo:** Identificar pedidos con montos iguales o inferiores a cero.
- **Regla de negocio:** Para este ejercicio, todo pedido debe tener un monto mayor que cero.
- **Prioridad:** Alta.
- **Consulta SQL ejecutada:**

  ```sql
SELECT id AS pedido_id,
	producto, 
	monto
FROM pedidos
WHERE monto <= 0;
  ```

- **Resultado esperado:** La consulta no debe devolver registros.
- **Resultado obtenido:** Se encontraron dos pedidos con montos inválidos: Monitor (0.00) y Audífonos (-50.00).
- **Estado:** FAIL (la validación no se cumple).
- **Conclusión de QA:** Se identificaron dos registros que incumplen la regla de negocio definida. Se recomienda investigar su origen y corregir los datos si corresponde.
- **Evidencia:** Capturas de los resultados obtenidos en MySQL Workbench.


# Caso de prueba SQL-005: Detectar pedidos sin usuario válido

* **Módulo:** Pedidos y usuarios.
* **Objetivo:** Identificar pedidos cuyo usuario_id no corresponde a ningún usuario registrado.
* **Tipo de prueba:** Integridad referencial.
* **Regla de negocio:** Todo pedido debe estar asociado a un usuario existente.
* **Prioridad:** Alta.
* **Precondiciones:** Las tablas usuarios y pedidos contienen registros de prueba.
* **Consulta SQL ejecutada:**

SELECT 
	p.id AS pedido_id,
    p.usuario_id,
    p.producto,
    p.monto
FROM pedidos AS p
LEFT JOIN usuarios AS u
	ON u.id = p.usuario_id
WHERE u.id IS NULL

* **Resultado esperado:** La consulta no debe devolver registros.
* **Resultado obtenido:** Se encontró el pedido con ID `101`, asociado al `usuario_id = 8`, sin un usuario correspondiente en la tabla `usuarios`.
* **Estado:** FAIL (la validación no se cumple).
* **Conclusión de QA:** Se detectó una inconsistencia de integridad referencial. El pedido está asociado a un usuario inexistente. Se recomienda investigar el origen del registro y verificar que la base de datos impida asociar pedidos a usuarios no registrados.
- **Evidencia:** Capturas de los resultados obtenidos en MySQL Workbench.

# Caso de prueba SQL-006: Detectar identificadores de pedidos duplicados

- **Módulo:** Pedidos.
- **Tipo de prueba:** Validación de integridad de datos.
- **Prioridad:** Alta.
- **Objetivo:** Identificar identificadores de pedidos que aparecen más de una vez.
- **Regla de negocio:** Cada pedido debe tener un identificador único.
- **Precondiciones:** La tabla `pedidos` contiene los datos de prueba.

**Pasos de ejecución:**

1. Seleccionar la base de datos `ecommerce_qa`.
2. Ejecutar la consulta de detección de identificadores duplicados.
3. Revisar los registros devueltos.

**Consulta SQL ejecutada:**

```sql
SELECT
    id AS pedido_id,
    COUNT(*) AS cantidad
FROM pedidos
GROUP BY id
HAVING COUNT(*) > 1;
```

- **Resultado esperado:** La consulta no debe devolver registros.
- **Resultado obtenido:** Se encontró el identificador `101` con una cantidad de `2`.
- **Estado:** FAIL.
- **Conclusión de QA:** Se detectó una inconsistencia en la unicidad de los identificadores de pedidos.
- **Evidencia:** Captura del resultado de SQL-006 en MySQL Workbench.

