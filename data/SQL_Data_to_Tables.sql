--Importaremos los datos de CSV a SQL
--Seleccionamos la DB ya creada.
USE TiendaTecnologia;
GO
-------------------------------------------------------------------------------------------------------

--Agregamos los datos a cada tabla:
-- Categoria
BULK INSERT Categoria
FROM 'C:\Users\csaav\OneDrive\Escritorio\ecommerce-analytics-portfolio\data\Categoria.csv'
WITH (
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '\n',
	CODEPAGE = '65001',
	TABLOCK
	);

CREATE TABLE Categoria_temp (
    Nombre_categoria NVARCHAR(255)
);

BULK INSERT Categoria_temp
FROM 'C:\Users\csaav\OneDrive\Escritorio\ecommerce-analytics-portfolio\data\Categoria.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    CODEPAGE = '65001',
    TABLOCK
);

INSERT INTO Categoria (Nombre_categoria)
SELECT Nombre_categoria FROM Categoria_temp;

DROP TABLE Categoria_temp;
-- Retiramos comillas de los registros
UPDATE Categoria
SET Nombre_categoria = REPLACE(Nombre_categoria, '"', '');
-- validamos que la consulta este bien.
Select * from Categoria;
----------------------------------------------------------------------------------------------------------

-- Clientes
-- Creamos una tabla temporal para incorporar los datos con el INSERT INTO
CREATE TABLE Clientes_temp (
	Nombre NVARCHAR (225),
	Email NVARCHAR (225),
	Pais NVARCHAR (225),
	Ciudad NVARCHAR (225),
	Fecha_cumpleaños NVARCHAR (225)
	);

BULK INSERT Clientes_temp
FROM 'C:\Users\csaav\OneDrive\Escritorio\ecommerce-analytics-portfolio\data\Clientes.csv'
WITH (
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '\n',
	CODEPAGE = '65001',
	TABLOCK
	);

INSERT INTO Clientes (Nombre, Email, Pais, Ciudad, Fecha_cumpleaños)
	SELECT
		REPLACE(Nombre, '"', ''),
		REPLACE(Email, '"', ''),
		REPLACE(País, '"', ''),
		REPLACE(Ciudad, '"', ''),
		TRY_CAST(REPLACE(Fecha_cumpleaños, '"', '') AS DATETIME)
FROM Clientes_temp;

	SELECT * FROM Clientes_temp;

-- en este punto la columna fecha de cunpleaños esta arrojando nulos por la estructura de los datos
-- esto se corrije apartir de este punto para tener una base más organizda y completa. 

	DROP TABLE Clientes_temp; 

DELETE FROM Clientes;
DBCC CHECKIDENT ('Clientes', RESEED, 0);

INSERT INTO Clientes (Nombre, Email, País, Ciudad, Fecha_cumpleaños)
SELECT
    Nombre,
    Email,
    País,
    Ciudad,
    CONVERT(DATETIME, Fecha_cumpleaños, 120)  -- formato: yyyy-mm-dd
FROM Clientes_temp;

SELECT * FROM Clientes;

-----------------------------------------------------------------------------------------------------------

-- Empleados
-- Cargamos los datos desde el archivo CSV creando una tabla temporal.
CREATE TABLE Empleados_temp (
	Nombre NVARCHAR (225),
	Cargo NVARCHAR (225),
	Ciudad NVARCHAR (225),
	);

-- Realiazamos el BULK INSERT en Empleados_temp.
BULK INSERT Empleados_temp
FROM 'C:\Users\csaav\OneDrive\Escritorio\ecommerce-analytics-portfolio\data\Empleados.csv'
WITH (
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '\n',
	CODEPAGE = '65001',
	TABLOCK
	);

--Borramos datos anteriores y reiniciamos contador. 
DELETE FROM Empleados;
DBCC CHECKIDENT ( 'Empleados', RESEED, 0);

-- Insertamos solo la columna validada a la tabla empleados
INSERT INTO Empleados (Nombre, Cargo, Ciudad)
	Select Nombre, Cargo, Ciudad
		From Empleados_temp;

-- Validación de tabla.
Select * From Empleados;

-- Eliminar tabla temporal.
DROP TABLE Empleados_temp;

------------------------------------------------------------------------------------------------------------

-- Metodos_pago
-- Creamos la tabla temporal para el BULK INSERT
CREATE TABLE Metodos_pago_temp (
  Id_Metodo INT,
  nombre_metodo NVARCHAR(255)
);

-- Cargamos el archivo csv a la tabla temporal 
BULK INSERT Metodos_pago_temp
FROM 'C:\Users\csaav\OneDrive\Escritorio\ecommerce-analytics-portfolio\data\Metodos_pago.csv'
WITH (
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '\n',
	CODEPAGE = '65001',
	TABLOCK
	);

-- Insertamos estos datos en la tabla Metodos_pago
INSERT INTO Metodos_pago (Nombre_metodo)
SELECT Nombre_metodo FROM Metodos_pago_temp;

-- Validamos la tabla creada
Select * From Metodos_pago;

-- Elimino la temporal 
DROP TABLE Metodos_pago_temp;

-- Para finalizar tenermos que regresar el vinculo que la tabla Metodos_pagos tenia 
ALTER TABLE Ordenes
ADD CONSTRAINT FK_Ordenes_Id_metodo
FOREIGN KEY (Id_metodo)
REFERENCES Metodos_pago(Id_metodo);

-- Validar que la conexción está creada
SELECT 
    f.name AS FK_name,
    OBJECT_NAME(f.parent_object_id) AS Tabla_hija,
    COL_NAME(fc.parent_object_id, fc.parent_column_id) AS Columna_hija,
    OBJECT_NAME(f.referenced_object_id) AS Tabla_padre,
    COL_NAME(fc.referenced_object_id, fc.referenced_column_id) AS Columna_padre
FROM 
    sys.foreign_keys AS f
INNER JOIN 
    sys.foreign_key_columns AS fc 
    ON f.object_id = fc.constraint_object_id;

--------------------------------------------------------------------------------------------------

-- Productos
-- Creamos la tabla temporal.
CREATE TABLE Productos_temp (
	Nombre_Producto NVARCHAR(225),
	Precio_unitario INT,
	Id_categoria INT,
	Stock INT
	);

-- Cargamos el csv con el BULK INSERT.
BULK INSERT Productos_temp
FROM 'C:\Users\csaav\OneDrive\Escritorio\ecommerce-analytics-portfolio\data\Productos.csv'
WITH (
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '\n',
	CODEPAGE = '65001',
	TABLOCK
	);

-- Reiniciamos el ID producto
DBCC CHECKIDENT ('Productos', RESEED, 0);

-- Isertamos en la tabla original (Productos)
INSERT INTO Productos (Nombre_producto, Precio_unitario, Id_categoria, Stock)
SELECT Nombre_producto, Precio_unitario, Id_categoria, Stock
	FROM Productos_temp;

-- Validamos que la tabla y los datos esten en orden. 
Select * From Productos;

-- eliminamos la tabla temporal 
Drop table Productos_temp;

----------------------------------------------------------------------------------------------------------------

-- Ordenes
-- Validamos que el campo fecha tenga la estructura que necesita SQL. 
-- Creamos la tabla temporal de ordenes.
CREATE TABLE Ordenes_temp (
	Id_orden INT,
	Id_cliente INT,
	Id_empleado INT,
	Fecha_orden Date,
	Id_metodo INT,
	Total DECIMAL (10,2)
	);

-- Cargamos el csv de la tabla temporal.
BULK INSERT Ordenes_temp
FROM 'C:\Users\csaav\OneDrive\Escritorio\ecommerce-analytics-portfolio\data\Ordenes.csv'
WITH (
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '\n',
	CODEPAGE = '65001',
	TABLOCK
	);

-- Insertamos la data en la tabla Ordenes
INSERT INTO Ordenes (Id_orden,Id_cliente,Id_empleado,Fecha_orden,Id_metodo,Total)
	SELECT Id_orden,Id_cliente,Id_empleado,Fecha_orden,Id_metodo,Total
		FROM Ordenes_temp;

-- validamos que la tabla Ordenes este correcta.
Select * From Ordenes;

-- Barramos la tabla temporal.
DROP TABLE Ordenes_temp;

--------------------------------------------------------------------------------------------------------------------

-- Detalles_orden
-- Creamos la tabla temporal
CREATE TABLE Detalles_orden_temp (
	Id_orden INT,
	Id_productos INT,
	Cantidad INT,
	Subtotal INT,
	Precio_unitario INT
	);

-- Cargamos los datos Del csv con el BULK INSERT
BULK INSERT Detalles_orden_temp
FROM 'C:\Users\csaav\OneDrive\Escritorio\ecommerce-analytics-portfolio\data\Detalles_orden.csv'
WITH (
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '\n',
	CODEPAGE = '65001',
	TABLOCK
	);

-- Reiniciamos el contador
DBCC CHECKIDENT ('Productos', RESEED, 0);

-- Insertamos la información el la tabla original
INSERT INTO Detalles_orden (Id_orden,Id_productos,Cantidad,Subtotal,Precio_unitario)
	SELECT Id_orden,Id_productos,Cantidad,Subtotal,Precio_unitario
		FROM Detalles_orden_temp;

-- Validamos que todo este en orden
select * from Detalles_orden;

-- Eliminamos tabla temp
DROP TABLE Detalles_orden_temp;

--------------------------------------------------------------------------------------------------------------------

-- Envios
-- Validamos que el los campos de fecha tenga la estructura correcta para SQL.
-- Creamos la tabla Envios_Clientes (reemplazo el nombre) 
CREATE TABLE Envios_Clientes (
  Id_envio INT PRIMARY KEY,
  Id_orden INT NOT NULL,
  Direccion_envio NVARCHAR(255) NOT NULL,
  Ciudad NVARCHAR(100) NOT NULL,
  Fecha_envio DATETIME NOT NULL
);

-- Realizamos la carga de los datos con el BULK INSERT 
BULK INSERT Envios_Clientes
FROM 'C:\Users\csaav\OneDrive\Escritorio\ecommerce-analytics-portfolio\data\Envios.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',', 
    ROWTERMINATOR = '\n', 
    CODEPAGE = '65001',
    TABLOCK
);

-- Validamos que la infomación este correcta 
Select * from Envios_Clientes;
