-- Crear base de datos
CREATE DATABASE IF NOT EXISTS sistema_ventas;
USE sistema_ventas;

-- Tabla: productos
CREATE TABLE IF NOT EXISTS productos (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    fecha_ingreso DATETIME,
    nombre_producto VARCHAR(45) NOT NULL,
    categoria VARCHAR(20) NOT NULL,
    precio_unitario DECIMAL(10,2),
    stock INT NOT NULL,
    descripcion VARCHAR(250),
    activo TINYINT(1) NOT NULL DEFAULT 1 
) ENGINE=InnoDB;

-- Tabla: clientes
CREATE TABLE IF NOT EXISTS clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50),
    direccion VARCHAR(150),
    telefono VARCHAR(20),
    correo VARCHAR(100)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS roles (
    id_rol INT AUTO_INCREMENT PRIMARY KEY,
    nombre_rol VARCHAR(20)
) ENGINE=InnoDB;

-- Tabla: usuarios
CREATE TABLE  IF NOT EXISTS usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre_usuario VARCHAR(50) NOT NULL,
    contrasena VARCHAR(100) NOT NULL,
    id_rol INT,
    FOREIGN KEY (id_rol) REFERENCES roles(id_rol)
) ENGINE=InnoDB;

-- Tabla: ventas
CREATE TABLE IF NOT EXISTS ventas (
    id_venta INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    id_usuario INT NOT NULL,
    fecha DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    tipo_pago VARCHAR(50),
    total DECIMAL(10,2) NOT NULL,
    estado VARCHAR(20) DEFAULT 'Emitida',
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
) ENGINE=InnoDB;

-- Tabla: detalle_venta
CREATE TABLE IF NOT EXISTS detalle_venta (
    id_detalle INT AUTO_INCREMENT PRIMARY KEY,
    id_venta INT NOT NULL,
    id_producto INT NOT NULL,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10,2) NOT NULL,
    subtotal DECIMAL(10,2) GENERATED ALWAYS AS (cantidad * precio_unitario) STORED,
    FOREIGN KEY (id_venta) REFERENCES ventas(id_venta),
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
) ENGINE=InnoDB;

-- Tabla: estado
CREATE TABLE IF NOT EXISTS estado (
    id_estado INT AUTO_INCREMENT PRIMARY KEY,
    nombre_estado VARCHAR(20) NOT NULL
) ENGINE=InnoDB;

-- Insertar estados
INSERT INTO estado (nombre_estado) VALUES
    ('Emitida'),
    ('Anulada'),
    ('Pendiente'),
    ('Pagada');
