-- llamamos la BD tienda tecnologia.	
USE TiendaTecnologia;
Go
--------------------------------------------------------------------------------------------------
/* Objetivo del KPI 3
Ayuda a medir el crecimiento del negocio.

¿Cómo se calcula?

Debemos:
1. Identificar la primera orden de cada cliente.
2. Contar cuántos clientes tuvieron su primera orden en cada mes.

(REGLA DE NEGOCIO):
Un cliente se considera “nuevo” en el mes en que realiza su primera compra registrada en la base de datos.
*/
--------------------------------------------------------------------------------------------------

-- KPI 3: Clientes nuevos por mes
WITH Primera_compra As (
	Select
		Id_cliente,
		MIN(Fecha_orden) As Fecha_Primera_Compra
		FROM Ordenes
		GROUP BY Id_cliente
)
Select
	YEAR(Fecha_Primera_Compra) As Año,
	MONTH(Fecha_Primera_Compra) As Mes_numero,
	DATENAME(MONTH, Fecha_Primera_Compra) As Mes,
	COUNT(*) As Clientes_Nuevos
FROM Primera_compra
GROUP By YEAR (Fecha_Primera_Compra),MONTH(Fecha_Primera_Compra),DATENAME(MONTH,Fecha_Primera_Compra)
ORDER BY Año, Mes_numero;