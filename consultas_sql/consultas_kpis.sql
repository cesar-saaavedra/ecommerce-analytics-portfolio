-- Total de ventas
SELECT SUM(Total) AS Ventas_totales
FROM Ordenes;

-- Número de clientes únicos
SELECT COUNT(DISTINCT Id_cliente) AS Clientes_unicos
FROM Ordenes;

-- Promedio por venta
SELECT AVG(Total) AS Promedio_venta
FROM Ordenes;

-- Número total de órdenes
SELECT COUNT(*) AS Total_ordenes
FROM Ordenes;

-- Producto más vendido (por cantidad)
SELECT TOP 1 
    P.Nombre_producto,
    SUM(DO.Cantidad) AS Total_vendido
FROM Detalles_orden DO
JOIN Productos P ON DO.Id_producto = P.Id_producto
GROUP BY P.Nombre_producto
ORDER BY Total_vendido DESC;

-- Vendedor con más ventas (por valor total)
SELECT TOP 1 
    E.Nombre AS Vendedor,
    SUM(O.Total) AS Total_ventas
FROM Ordenes O
JOIN Empleados E ON O.Id_empleado = E.Id_empleado
GROUP BY E.Nombre
ORDER BY Total_ventas DESC;

-- Ciudad con más ventas
SELECT TOP 1 
    C.Ciudad,
    SUM(O.Total) AS Total_ventas
FROM Ordenes O
JOIN Clientes C ON O.Id_cliente = C.Id_cliente
GROUP BY C.Ciudad
ORDER BY Total_ventas DESC;
