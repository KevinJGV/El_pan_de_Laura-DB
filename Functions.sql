DELIMITER //
-- 1. Calcular el costo total de los ingredientes utilizados en un producto.
CREATE FUNCTION CalculateCostProduct(input_id_product INT)
RETURNS DECIMAL(7,2)
READS SQL DATA
BEGIN
    DECLARE TotalCost DECIMAL(7,2);
    SELECT SUM(I.Costo * PI.Cantidad) INTO TotalCost
    FROM
        Ingredientes I
        JOIN Productos_Ingredientes PI ON I.ID = PI.ID_Ingrediente
        JOIN Productos P ON PI.ID_Producto = P.ID
    WHERE
        P.ID = input_id_product;
    RETURN TotalCost;
END //

-- 2. Devolver el precio promedio de los productos vendidos.
CREATE FUNCTION AvgSelledPrice()
RETURNS DECIMAL(7,2)
READS SQL DATA
BEGIN
    DECLARE Retrunable DECIMAL(7,2);
    SELECT AVG(P.Valor) INTO Returnable
    FROM
        Detalles_Ventas DV
        JOIN Productos P ON DV.ID_Producto = P.ID;
    RETURN Retrunable;
END //

-- 3. Calcular el descuento aplicable a una venta según el cliente.
CREATE FUNCTION CalculateOff(input_id_customer INT, input_id_sell INT)
RETURNS DECIMAL(7,2)
READS SQL DATA
BEGIN
    DECLARE OffDiscount DECIMAL(7,2);
    SELECT (V.Total * D.Valor) / 100 INTO OffDiscount
    FROM 
        Clientes C
        JOIN Ventas V ON C.ID = V.ID_Cliente
        JOIN Descuentos D ON D.ID = C.ID_Descuento
    WHERE
        C.ID = input_id_customer AND V.ID = input_id_sell;
    RETURN OffDiscount;
END //

-- 4. Calcular el costo total de una venta.
-- 5. Devolver la cantidad de productos vendidos en un día específico.
-- 6. Calcular el total de ventas en un mes.
-- 7. Devolver el costo de los ingredientes de un producto específico.
-- 8. Calcular el número total de clientes que han realizado una compra en el último mes.
-- 9. Devolver el promedio de ventas por empleado.
-- 10. Calcular el total de ingredientes necesarios para producir un lote de productos.
-- 11. Devolver la cantidad de productos en inventario.
-- 12. Calcular la ganancia neta de una venta.
-- 13. Devolver la cantidad de órdenes de compra pendientes.
-- 14. Calcular el precio de venta promedio de un producto en un periodo determinado.
-- 15. Calcular el valor de los ingredientes comprados a un proveedor específico.
-- 16. Calcular la cantidad total de productos vendidos en una categoría específica.
-- 17. Calcular la cantidad de ventas superiores a un valor determinado.
-- 18. Devolver el nombre del empleado con más ventas en un mes.
-- 19. Calcular la cantidad de productos vendidos con descuento.
-- 20. Devolver el total de ventas realizadas a un cliente específico.

DELIMITER ;