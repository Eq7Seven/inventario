-- ============================================================
--  Script de inicialización de la base de datos "inventario"
--  MySQL lo ejecuta automáticamente SOLO la primera vez,
--  cuando el volumen datos_mysql está vacío.
-- ============================================================

SET NAMES utf8mb4;
USE inventario;

CREATE TABLE IF NOT EXISTS equipos (
    id              INT AUTO_INCREMENT PRIMARY KEY,
    nombre          VARCHAR(100) NOT NULL,
    tipo            ENUM('Computadora de escritorio','Laptop','Impresora','Monitor','Router','Switch') NOT NULL,
    marca           VARCHAR(50)  NOT NULL,
    numero_serie    VARCHAR(50)  NOT NULL UNIQUE,
    ubicacion       VARCHAR(100) NOT NULL,
    estado          ENUM('Disponible','En uso','En mantenimiento','Fuera de servicio') NOT NULL DEFAULT 'Disponible',
    fecha_registro  TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Registros de ejemplo (datos ficticios)
INSERT INTO equipos (nombre, tipo, marca, numero_serie, ubicacion, estado) VALUES 
('PC escritorio 01', 'Computadora de escritorio', 'Dell',
 'PCE-0001', 'Sala de cómputo', 'Disponible'),
('Laptop 01', 'Laptop', 'Lenovo',
 'LAP-0002', 'Área de renta', 'En uso'),
('Impresora 01', 'Impresora', 'HP',
 'IMP-0003', 'Área de impresión', 'En mantenimiento'),
('Monitor 01', 'Monitor', 'Samsung',
 'MON-0004', 'Bodega', 'Disponible'),
('Router principal', 'Router', 'TP-Link',
 'ROU-0005', 'Cuarto de red', 'En uso');
