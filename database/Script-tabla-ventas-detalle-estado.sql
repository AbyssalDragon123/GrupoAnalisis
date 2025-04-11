-- Se crea la base de datos
--Ejecutar esta linea primero
CREATE DATABASE SistemaVentas;
GO


-- Seleccionar la base de datos para crear tablas
USE SistemaVentas;
GO

-- Tabla: Productos
CREATE TABLE Productos (
    id_producto INT IDENTITY(1,1) PRIMARY KEY,
    Fecha_ingreso DATETIME,
    Nombre_producto VARCHAR(45) NOT NULL,
    Categoria VARCHAR(20) NOT NULL,
    precio_unitario DECIMAL(10,2),
    Stock INT NOT NULL,
    Descripcion VARCHAR(250),
    Activo BIT NOT NULL DEFAULT 1 --muestra el estado del producto activo o inactivo
);
GO

-- Tabla: Clientes
CREATE TABLE Clientes (
    id_cliente INT IDENTITY(1,1) PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Direccion VARCHAR(150),
    Telefono VARCHAR(20),
    Correo VARCHAR(100)
);
GO

-- Tabla: Usuarios
CREATE TABLE Usuarios (
    id_usuario INT IDENTITY(1,1) PRIMARY KEY,
    nombre_usuario VARCHAR(50) NOT NULL,
    contrasena VARCHAR(100) NOT NULL,
    id_Rol INT
);
GO

-- Tabla: Ventas
CREATE TABLE Ventas (
    id_venta INT IDENTITY(1,1) PRIMARY KEY,
    id_cliente INT NOT NULL,
    id_usuario INT NOT NULL,
    fecha DATETIME NOT NULL DEFAULT GETDATE(),
    tipo_pago VARCHAR(50),
    total DECIMAL(10,2) NOT NULL,
    estado VARCHAR(20) DEFAULT 'Emitida',

    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente),
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario)
);
GO

-- Tabla: DetalleVenta
CREATE TABLE DetalleVenta (
    id_detalle INT IDENTITY(1,1) PRIMARY KEY,
    id_venta INT NOT NULL,
    id_producto INT NOT NULL,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10,2) NOT NULL,
    subtotal AS (cantidad * precio_unitario) PERSISTED,

    FOREIGN KEY (id_venta) REFERENCES Ventas(id_venta),
    FOREIGN KEY (id_producto) REFERENCES Productos(id_producto)
);
GO

-- Tabla: Estado
CREATE TABLE Estado (
    id_estado INT IDENTITY(1,1) PRIMARY KEY,
    nombre_estado VARCHAR(20) NOT NULL
);
GO

-- Insertar estados
INSERT INTO Estado (nombre_estado) VALUES

--Se ingresan los valores del estado haciendo referencia a la facturación

    ('Emitida'),
    ('Anulada'),
    ('Pendiente'),
    ('Pagada');
GO

-- Tabla: Roles
CREATE TABLE Roles (
    id_Rol INT IDENTITY(1,1) PRIMARY KEY,
    nombre_rol VARCHAR(20)
);
GO
