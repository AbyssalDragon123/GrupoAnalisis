CREATE DATABASE Ventas;
GO

USE Ventas;
GO

CREATE TABLE PRODUCTOS (
    IdProducto INT PRIMARY KEY IDENTITY(1,1),
    Codigo VARCHAR(50),
    Nombre VARCHAR(50),
    Descripcion VARCHAR(50),
    IdCategoria INT,  -- No hay FOREIGN KEY, solo se guarda el número
    Stock INT NOT NULL DEFAULT 0,
    PrecioCompra DECIMAL(10,2) DEFAULT 0,
    PrecioVenta DECIMAL(10,2) DEFAULT 0,
    Estado BIT,
    FechaRegistro DATETIME DEFAULT GETDATE()
);