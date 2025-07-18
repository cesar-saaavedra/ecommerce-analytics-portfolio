-- llamamos la BD tienda tecnologia.	
USE TiendaTecnologia;
Go
--------------------------------------------------------------------------------------------------
/* Objetivo del KPI 2
Ayuda a identificar cuánto está gastando en promedio los cliente por orden.

Medir cuánto gasta en promedio un cliente cada vez que realiza una orden. Este valor refleja 
el comportamiento típico de compra y sirve como línea base para análisis comparativos.

¿De dónde sale el dato?
Usamos las tablas:

1. Ordenes: nos da el id de la orden.
2. Detalles_orden: nos da cantidad y el precio unitario.

(REGLA DE NEGOCIO)
Se calcula dividiendo:
El total de ingresos (suma de cantidad por precio unitario en cada ítem) entre el número total de órdenes únicas.
*/
--------------------------------------------------------------------------------------------------
-- KPI 2: Ticket promedio por orden
Select
	ROUND(SUM(CAST(DO.Cantidad As FLOAT) * DO.Precio_unitario) / COUNT(DISTINCT O.Id_orden), 2) As Ticket_promedio
FROM
	Ordenes O
INNER JOIN
	Detalles_orden DO ON O.Id_orden = DO.Id_orden;