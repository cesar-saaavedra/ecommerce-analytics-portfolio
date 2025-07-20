# Spanish versión

# Modelo Estrella Power BI – Proyecto de Ventas

Este proyecto contiene el desarrollo de un modelo estrella optimizado para su uso en Power BI, basado en un conjunto de datos de ventas. Fue diseñado siguiendo buenas prácticas de modelado dimensional, con el objetivo de facilitar el análisis eficiente de los indicadores clave del negocio (KPIs).

---

## Estructura del modelo

### Tabla de hechos: `fact_ventas`
Contiene los datos transaccionales relacionados con las ventas. Es el núcleo del modelo.

**Campos principales:**
- `Id_detalle` (PK)
- `Id_orden`
- `Id_producto`
- `Id_cliente`
- `Id_empleado`
- `Fecha_orden`
- `Cantidad`
- `Precio_unitario`
- `Total` *(campo calculado = Precio_unitario * Cantidad)*

---

### Tablas de dimensiones

#### `dim_empleado`
- Información de los empleados que gestionan las órdenes.
- Relacionada con `fact_ventas` por el campo `Id_empleado`.

#### `dim_cliente`
- Información de los clientes.
- Relacionada con `fact_ventas` por el campo `Id_cliente`.

#### `dim_fecha`
- Tabla calendario completa, con niveles jerárquicos como año, trimestre, mes, día.
- Relacionada con `fact_ventas` por el campo `Fecha_orden`.

#### `dim_producto`
- Detalles de los productos vendidos, incluyendo categoría.
- Relacionada con `fact_ventas` por el campo `Id_producto`.

---

## KPIs definidos

Estos indicadores fueron definidos en base a preguntas de negocio previamente formuladas. Serán construidos usando **SQL o DAX**, según el contexto y la complejidad:

-  Total de ventas
-  Ticket promedio por orden
-  Nuevos clientes por mes
-  Categorías más vendidas
-  Producto más vendido
-  Empleado con mayores ventas
-  Ciudad con mayor ingreso

*Nota: Algunos KPIs pueden calcularse directamente en Power BI utilizando expresiones DAX.*

---

## Tecnologías utilizadas

- SQL Server
- Power BI Desktop
- Lenguaje DAX (para indicadores y visualizaciones)

---

## Archivos incluidos
modelo_estrella_powerbi/
│
├── fact_ventas.sql # Script de creación de la tabla de hechos
├── dim_cliente.sql # Script tabla de dimensión cliente
├── dim_empleado.sql # Script tabla de dimensión empleado
├── dim_producto.sql # Script tabla de dimensión producto
├── dim_fecha.sql # Script tabla calendario
├── modelo.pbix # Archivo de Power BI con el modelo final
├── README.md # Este archivo


# English version

# Star Schema Power BI Model – Sales Project

This project contains the development of a star schema model optimized for Power BI, based on a sales dataset. It follows dimensional modeling best practices to support efficient analysis of key business performance indicators (KPIs).

---

## Model Structure

### Fact Table: `fact_sales`
Stores transactional data related to sales. It is the central table of the model.

**Main fields:**
- `Id_detail` (Primary Key)
- `Id_order`
- `Id_product`
- `Id_client`
- `Id_employee`
- `Order_date`
- `Quantity`
- `Unit_price`
- `Total` *(calculated field = Unit_price * Quantity)*

---

### Dimension Tables

#### `dim_employee`
- Contains information about employees who process the orders.
- Related to `fact_sales` by `Id_employee`.

#### `dim_client`
- Contains information about clients.
- Related to `fact_sales` by `Id_client`.

#### `dim_date`
- A full calendar table with hierarchical levels such as year, quarter, month, day.
- Related to `fact_sales` by `Order_date`.

#### `dim_product`
- Product details including product category.
- Related to `fact_sales` by `Id_product`.

---

##  Defined KPIs

These indicators were created based on previously defined business questions. They can be implemented using **SQL or DAX**, depending on context and complexity:

-  Total Sales
-  Average Ticket per Order
-  New Clients per Month
-  Best-Selling Categories
-  Top-Selling Product
-  Top-Selling Employee
-  City with Highest Revenue

*Note: Some KPIs can be calculated directly in Power BI using DAX expressions.*

---

## Technologies Used

- SQL Server (or any relational database engine)
- Power BI Desktop
- DAX Language (for KPIs and visualizations)

---

## Included Files
star_schema_powerbi/
│
├── fact_sales.sql # Script to create the fact table
├── dim_client.sql # Script to create client dimension table
├── dim_employee.sql # Script to create employee dimension table
├── dim_product.sql # Script to create product dimension table
├── dim_date.sql # Script to create date dimension
├── model.pbix # Power BI file with the final model
├── README.md # This file
