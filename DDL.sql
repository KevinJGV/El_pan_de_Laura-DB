DROP DATABASE IF EXISTS El_Pan_De_Laura;

CREATE DATABASE IF NOT EXISTS El_Pan_De_Laura;

USE El_Pan_De_Laura;

CREATE TABLE Tipo_Producto (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE Estados (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE Descuentos (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Valor INT NOT NULL UNIQUE
);

CREATE TABLE Unidades_Medida (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Unidad VARCHAR(20) NOT NULL UNIQUE
);

CREATE TABLE Productos (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(50) NOT NULL UNIQUE,
    Stock INT NOT NULL,
    Lote VARCHAR(50) NOT NULL,
    Valor DECIMAL(7,2) NOT NULL,
    Costo DECIMAL(7,2),
    ID_Descuento INT,
    ID_Estado INT,
    ID_Tipo_Producto INT,
    FOREIGN KEY (ID_Descuento) REFERENCES Descuentos (ID),
    FOREIGN KEY (ID_Estado) REFERENCES Estados (ID),
    FOREIGN KEY (ID_Tipo_Producto) REFERENCES Tipo_Producto (ID)
);

CREATE TABLE Clientes (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(50) NOT NULL,
    Apellido VARCHAR(50) NOT NULL,
    Fecha_Nacimiento DATE NOT NULL,
    ID_Descuento INT,
    ID_Estado INT,
    FOREIGN KEY (ID_Descuento) REFERENCES Descuentos (ID),
    FOREIGN KEY (ID_Estado) REFERENCES Estados (ID)
);

CREATE TABLE Empleados (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(50) NOT NULL,
    Apellido VARCHAR(50) NOT NULL,
    Salario DECIMAL(7,2) NOT NULL,
    ID_Estado INT,
    FOREIGN KEY (ID_Estado) REFERENCES Estados (ID)
);

CREATE TABLE Ventas (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Fecha DATE NOT NULL,
    Total DECIMAL(7,2) NOT NULL,
    ID_Cliente INT,
    ID_Empleado INT,
    FOREIGN KEY (ID_Cliente) REFERENCES Clientes (ID),
    FOREIGN KEY (ID_Empleado) REFERENCES Empleados (ID)
);

CREATE TABLE Detalles_Ventas (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    ID_Venta INT,
    ID_Producto INT,
    Cantidad INT NOT NULL,
    Subtotal DECIMAL(7,2) NOT NULL,
    FOREIGN KEY (ID_Venta) REFERENCES Ventas (ID),
    FOREIGN KEY (ID_Producto) REFERENCES Productos (ID)
);

CREATE TABLE Ingredientes (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(50) NOT NULL UNIQUE,
    Stock INT NOT NULL,
    Costo DECIMAL(7,2),
    ID_Estado INT,
    ID_Unidad_Medida INT,
    FOREIGN KEY (ID_Estado) REFERENCES Estados (ID),
    FOREIGN KEY (ID_Unidad_Medida) REFERENCES Unidades_Medida (ID)
);

CREATE TABLE Productos_Ingredientes (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    ID_Producto INT,
    ID_Ingrediente INT,
    Cantidad INT NOT NULL,
    FOREIGN KEY (ID_Producto) REFERENCES Productos (ID),
    FOREIGN KEY (ID_Ingrediente) REFERENCES Ingredientes (ID)
);

CREATE TABLE Proveedores (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(50) NOT NULL UNIQUE,
    ID_Estado INT,
    FOREIGN KEY (ID_Estado) REFERENCES Estados (ID)
);

CREATE TABLE Compras (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Fecha DATE NOT NULL,
    Total DECIMAL(7,2) NOT NULL,
    ID_Proveedor INT,
    ID_Estado INT,
    FOREIGN KEY (ID_Proveedor) REFERENCES Proveedores (ID),
    FOREIGN KEY (ID_Estado) REFERENCES Estados (ID)
);

CREATE TABLE Detalles_Compras (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    ID_Compra INT,
    ID_Ingrediente INT,
    Cantidad INT NOT NULL,
    Subtotal DECIMAL(7,2) NOT NULL,
    FOREIGN KEY (ID_Compra) REFERENCES Compras (ID),
    FOREIGN KEY (ID_Ingrediente) REFERENCES Ingredientes (ID)
);