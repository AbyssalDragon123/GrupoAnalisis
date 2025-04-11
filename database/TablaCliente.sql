CREATE DATABASE Ventas;

use Ventas;
-- Base de datos: Ventas
-- --------------------------------------------------------
--Ventas
-- --------------------------------------------------------
Create table cliente(
    id_cliente INT IDENTITY(1,1) PRIMARY KEY,
    nombre varchar(50) not null,
    apellido varchar(50) not null,
    telefono varchar(15) not null,
    email varchar(50) not null,
    direccion varchar(100) not null,

);


