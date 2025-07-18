-- llamamos la BD tienda tecnologia.	
USE TiendaTecnologia;
Go
--------------------------------------------------------------------------------------------------
/* Objetivo del KPI 2
Ayuda a identificar cu�nto est� gastando en promedio los cliente por orden.

Medir cu�nto gasta en promedio un cliente cada vez que realiza una orden. Este valor refleja 
el comportamiento t�pico de compra y sirve como l�nea base para an�lisis comparativos.

�De d�nde sale el dato?
Usamos las tablas:

1. Ordenes: nos da el id de la orden.
2. Detalles_orden: nos da cantidad y el precio unitario.

(REGLA DE NEGOCIO)
Se calcula dividiendo:
El total de ingresos (suma de cantidad por precio unitario en cada �tem) entre el n�mero total de �rdenes �nicas.
*/
--------------------------------------------------------------------------------------------------
-- KPI 2: Ticket promedio por orden
Select
	ROUND(SUM(CAST(DO.Cantidad As FLOAT) * DO.Precio_unitario) / COUNT(DISTINCT O.Id_orden), 2) As Ticket_promedio
FROM
	Ordenes O
INNER JOIN
	Detalles_orden DO ON O.Id_orden = DO.Id_orden;