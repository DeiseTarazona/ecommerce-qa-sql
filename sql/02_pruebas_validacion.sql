-- =====================================================
-- SQL-001: VERIFICAR LA EXISTENCIA DE DATOS
-- Objetivo: Consultar las tablas usuarios y pedidos.
-- Resultado esperado: Ambas consultas devuelven registros.
-- Resultado obtenido: Ambas consultas devuelven registros.
-- Estado: PASS
-- =====================================================

USE ecommerce_qa;
SELECT *
FROM pedidos;

SELECT *
FROM pedidos;

-- =====================================================
-- SQL-002: DETECTAR CORREOS DUPLICADOS
-- Objetivo: Identificar correos registrados más de una vez.
-- Resultado esperado: La consulta no devuelve registros.
-- Resultado obtenido: El correo `ana@gmail.com` aparece dos veces.
-- Estado: FAIL
-- =====================================================

SELECT correo, COUNT(*) AS cantidad
FROM usuarios
WHERE correo IS NOT NULL
GROUP BY correo
HAVING COUNT(*) > 1;

-- =====================================================
-- SQL-003: DETECTAR CORREOS FALTANTES
-- Objetivo: Identificar usuarios sin correo registrado.
-- Resultado esperado: La consulta no devuelve registros.
-- Resultado obtenido: José tiene el correo en NULL.
-- Estado: FAIL
-- =====================================================

SELECT id, nombre, correo
FROM usuarios
WHERE correo IS NULL;

-- =====================================================
-- SQL-004: DETECTAR MONTOS INVÁLIDOS
-- Objetivo: Identificar pedidos con montos iguales o inferiores a cero.
-- Resultado esperado: La consulta no devuelve registros.
-- Resultado obtenido: El pedido de Monitor tiene un monto de `0.00` y el de Audifonos tiene un monto de `-50.00`.
-- Estado: FAIL
-- =====================================================

SELECT id AS pedido_id,
	producto, 
	monto
FROM pedidos
WHERE monto <= 0;

-- =====================================================
-- SQL-005: DETECTAR PEDIDOS SIN USUARIO VÁLIDO
-- Objetivo: Identificar pedidos cuyo usuario no existe.
-- Resultado esperado: La consulta no devuelve registros.
-- Resultado obtenido: El pedido con ID `101` tiene `usuario_id = 8`, pero no existe un usuario con ese identificador.
-- Estado: FAIL
-- =====================================================

SELECT 
	p.id AS pedido_id,
    p.usuario_id,
    p.producto,
    p.monto
FROM pedidos AS p
LEFT JOIN usuarios AS u
	ON u.id = p.usuario_id
WHERE u.id IS NULL;

-- =====================================================
-- SQL-006: Detectar identificadores de pedidos duplicados
-- Objetivo: Identificar identificadores duplicados en la tabla pedidos
-- Resultado esperado: La consulta no devuelve registros.
-- Resultado obtenido: El ID 101 aparece 2 veces.
-- Estado: FAIL
-- =====================================================

SELECT 
	id AS id_pedidos, COUNT(*) AS cantidad
    FROM pedidos
    GROUP BY id
    HAVING COUNT(*) > 1;

-- =====================================================
-- FIN DE LAS PRUEBAS DE VALIDACION
-- =====================================================

