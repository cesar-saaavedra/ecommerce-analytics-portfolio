-- llamamos la BD tienda tecnologia.	
USE TiendaTecnologia;
Go
--------------------------------------------------------------------------------------------------
/* Objetivo del KPI 1
Conocer la evolución de las ventas mes a mes para:

1. Identificar estacionalidades.
2. Evaluar el impacto de promociones o campañas. (si aplica)
3. Detectar caídas o crecimientos inusuales.

¿De dónde sale el dato?
Usamos las tablas:

1. Ordenes: nos da la fecha del pedido.
2. Detalles_orden: nos da los productos vendidos, sus cantidades y el precio unitario.

(REGLA DE NEGOCIO)
Un ingreso se calcula como:
Ingreso = Cantidad × Precio_unitario
*/
--------------------------------------------------------------------------------------------------
--KPI 1: Ingresos mensuales 

Select
	YEAR(O.Fecha_orden) As Año,
	MONTH(O.Fecha_orden) As Mes,
	DATENAME(MONTH, O.Fecha_orden) As Nombre_mes,
	SUM(DO.Cantidad * DO.Precio_unitario) As Ingreso_Total
FROM 
	Ordenes O
INNER JOIN
	Detalles_orden DO ON O.Id_orden = DO.Id_orden
GROUP BY
	YEAR(O.Fecha_orden), MONTH(O.Fecha_orden), DATENAME(MONTH,O.Fecha_orden)
ORDER BY
	Año, Mes;

