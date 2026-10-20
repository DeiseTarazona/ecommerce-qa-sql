-- =====================================================
-- PROYECTO: E-COMMERCE QA
-- ARCHIVO: 01_esquema_y_datos.sql
-- OBJETIVO: Crear tablas e insertar datos de prueba
-- =====================================================

-- Tabla de usuarios
CREATE TABLE usuarios (
    id INT PRIMARY KEY,
    nombre VARCHAR(100),
    correo VARCHAR(150)
);

-- Tabla de pedidos
CREATE TABLE pedidos (
    id INT,
    usuario_id INT,
    producto VARCHAR(100),
    monto DECIMAL(10,2)
);

-- Datos de prueba: usuarios
INSERT INTO usuarios (id, nombre, correo) VALUES
(1, 'Ana', 'ana@gmail.com'),
(2, 'Carlos', 'carlos@gmail.com'),
(3, 'Maria', 'ana@gmail.com'),
(4, 'Jose', NULL);

-- Datos de prueba: pedidos
INSERT INTO pedidos (id, usuario_id, producto, monto) VALUES
(101, 1, 'Laptop', 2500),
(102, 2, 'Mouse', 80),
(103, 3, 'Teclado', 150),
(104, 4, 'Monitor', 0),
(101, 8, 'Audifonos', -50);

-- =====================================================
-- FIN DEL ESQUEMA Y LOS DATOS DE PRUEBA
-- =====================================================