-- Inserciones para la tabla Tipo_Producto
INSERT INTO Tipo_Producto (Nombre) 
VALUES 
('Pan'),
('Bollería'),
('Tartas'),
('Galletas'),
('Pasteles');

-- Inserciones para la tabla Estados
INSERT INTO Estados (Nombre) 
VALUES 
('Disponible'),
('Agotado'),
('Inactivo'),
('En producción'),
('Pendiente de envío'),
('Saldado');

-- Inserciones para la tabla Descuentos
INSERT INTO Descuentos (Valor) 
VALUES
(0),
(10),
(15),
(20),
(25),
(30);

-- Inserciones para la tabla Unidades_Medida
INSERT INTO Unidades_Medida (Unidad) 
VALUES 
('g'),
('ml'),
('kg'),
('l'),
('Pieza'),
('Unidad');

-- Inserciones para la tabla Productos
INSERT INTO Productos (Nombre, Stock, Lote, Valor, Costo, ID_Descuento, ID_Estado, ID_Tipo_Producto) 
VALUES 
('Pan Integral', 50, 'L001', 15.50, 10.00, 1, 1, 1),
('Croissant', 100, 'L002', 7.00, 3.50, 2, 1, 2),
('Tarta de Queso', 20, 'L003', 30.00, 20.00, 3, 1, 3),
('Galletas de Avena', 80, 'L004', 5.00, 2.00, 4, 1, 4),
('Pastel de Chocolate', 15, 'L005', 25.00, 18.00, 5, 1, 5);

-- Inserciones para la tabla Clientes
INSERT INTO Clientes (Nombre, Apellido, Fecha_Nacimiento, ID_Descuento, ID_Estado) 
VALUES 
('Laura', 'Gómez', '1985-06-15', 1, 1),
('Carlos', 'Pérez', '1990-04-22', 2, 1),
('María', 'López', '1978-12-10', 3, 1),
('José', 'Martínez', '2000-03-05', 4, 1),
('Ana', 'Sánchez', '1988-09-30', 5, 1);

-- Inserciones para la tabla Empleados
INSERT INTO Empleados (Nombre, Apellido, Salario, ID_Estado) 
VALUES 
('Luis', 'García', 1200.00, 1),
('Marta', 'Hernández', 1500.00, 1),
('Pedro', 'Ramírez', 1000.00, 1),
('Lucía', 'Fernández', 1300.00, 1),
('Javier', 'Santos', 1400.00, 1);

-- Inserciones para la tabla Ventas
INSERT INTO Ventas (Fecha, Total, ID_Cliente, ID_Empleado) 
VALUES 
('2024-10-15', 75.00, 1, 1),
('2024-10-16', 50.00, 2, 2),
('2024-10-17', 100.00, 3, 3),
('2024-10-17', 25.00, 4, 4),
('2024-10-18', 150.00, 5, 5);

-- Inserciones para la tabla Detalles_Ventas
INSERT INTO Detalles_Ventas (ID_Venta, ID_Producto, Cantidad, Subtotal) 
VALUES 
(1, 1, 2, 31.00),
(1, 2, 3, 21.00),
(2, 3, 1, 30.00),
(3, 4, 10, 50.00),
(4, 5, 2, 50.00);

-- Inserciones para la tabla Ingredientes
INSERT INTO Ingredientes (Nombre, Stock, Costo, ID_Estado, ID_Unidad_Medida)
VALUES 
('Harina', 1000, 1.50, 1, 3),  
('Azúcar', 500, 0.80, 1, 3),   
('Leche', 300, 0.90, 1, 4),    
('Huevos', 200, 1.20, 1, 5),   
('Chocolate', 100, 2.00, 1, 3);

-- Inserciones para la tabla Productos_Ingredientes
INSERT INTO Productos_Ingredientes (ID_Producto, ID_Ingrediente, Cantidad)
VALUES 
(1, 1, 500),  
(1, 2, 50),   
(2, 4, 10),   
(3, 5, 200),  
(4, 2, 100);  


-- Inserciones para la tabla Proveedores
INSERT INTO Proveedores (Nombre, ID_Estado) 
VALUES 
('Proveedor A', 1),
('Proveedor B', 1),
('Proveedor C', 1),
('Proveedor D', 1),
('Proveedor E', 1);

-- Inserciones para la tabla Compras
INSERT INTO Compras (Fecha, Total, ID_Proveedor, ID_Estado) 
VALUES 
('2024-10-15', 200.00, 1, 5),
('2024-10-16', 300.00, 2, 6),
('2024-10-17', 150.00, 3, 5),
('2024-10-18', 400.00, 4, 6),
('2024-10-19', 250.00, 5, 5);


-- Inserciones para la tabla Detalles_Compras
INSERT INTO Detalles_Compras (ID_Compra, ID_Ingrediente, Cantidad, Subtotal) 
VALUES 
(1, 1, 200, 100.00),
(2, 2, 100, 80.00),
(3, 3, 50, 45.00),
(4, 4, 100, 120.00),
(5, 5, 30, 60.00);
