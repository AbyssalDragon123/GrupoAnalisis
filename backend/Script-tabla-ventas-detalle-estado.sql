
USE SistemaVentas;

-- Tabla: Ventas (referenciado a facturas)

CREATE TABLE Ventas (

    id_venta INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    id_usuario INT NOT NULL,
    fecha DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    tipo_pago VARCHAR(50),
    total DECIMAL(10,2) NOT NULL,
    estado VARCHAR(20) DEFAULT 'Emitida',

    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente),
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario)
);

-- Tabla: DetalleVenta (productos que se vendieron)
CREATE TABLE DetalleVenta (
    id_detalle INT AUTO_INCREMENT PRIMARY KEY,
    id_venta INT NOT NULL,
    id_producto INT NOT NULL,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10,2) NOT NULL,
    subtotal DECIMAL(10,2) AS (cantidad * precio_unitario) STORED,

    FOREIGN KEY (id_venta) REFERENCES Ventas(id_venta),
    FOREIGN KEY (id_producto) REFERENCES Productos(id_producto)
);

--Tabla: Estado (registrar estados)
CREATE TABLE Estado (

	id_estado INT AUTO_INCREMENT PRIMARY KEY,
	nombre_estado VARCHAR(20) NOT NULL
	);
	
--Estados: (agregar estados a la tabla)

INSERT INTO Estado (nombre_estado) VALUES
	('Emitida'),
	('Anulada'),
	('Pendiente'),
	('Pagada');