# Spanish version
# Dashboard de Reporte de Ingresos

En esta carpeta encontrará el **dashboard del reporte de ingresos**, desarrollado en Power BI.  
El objetivo de este trabajo es demostrar conocimientos y habilidades en el diseño de un dashboard interactivo, aplicando buenas prácticas de visualización y modelado de datos.

## Tecnologías utilizadas

- **SQL Server**: consultas para extraer, transformar y preparar los datos.
- **Power BI Desktop**: visualización, modelado y diseño del dashboard.

## Modelo de datos

Para esta versión final:

- Se conectó Power BI directamente con el modelo resultante de las consultas realizadas en **SQL Server**.
- Se organizó el modelo de datos utilizando una estructura **tipo estrella**, con:
  - Una tabla principal de **hechos** (fact table)
  - Varias **tablas de dimensiones** (dimension tables)
- Se crearon medidas **DAX** para dar respuesta a los principales **indicadores KPI del negocio**, respetando las **reglas del negocio** definidas para este caso.

## Visualiza el Dashboard en Power BI

Este proyecto incluye un dashboard interactivo desarrollado en Power BI
[🔗 Haz clic aquí para ver el Dashboard completo en Power BI](https://app.powerbi.com/view?r=eyJrIjoiOTdlMDFmMzgtZjg0MC00OTgzLWI0MGMtMmNjZjUyZjMzZTM4IiwidCI6IjdmMThjZDE2LTgyZWYtNGVjMC04M2ZlLTJmMDBkYTUyNjAxOSIsImMiOjR9)

*Nota: El dashboard está alojado en Power BI Service. Asegúrate de tener conexión a internet para visualizarlo correctamente.*

El archivo `index.html` embebe el dashboard publicado en Power BI para facilitar su consulta y navegación desde el navegador.

---

> 💡 Si estás viendo este repositorio desde GitHub Pages, puedes acceder al reporte directamente desde la URL pública correspondiente.

---

# English version
# Income Report Dashboard

This folder contains the **Income Report Dashboard**, developed in Power BI.  
The goal of this project is to demonstrate knowledge and skills in designing an interactive dashboard, applying best practices in data modeling and visualization.

## Technologies Used

- **SQL Server**: for extracting, transforming, and preparing the data.
- **Power BI Desktop**: for visualization, modeling, and dashboard design.

## Data Model

For this final version:

- Power BI is connected directly to the data model built from queries executed in **SQL Server**.
- The data model follows a **star schema** structure, including:
  - A main **fact table**
  - Several **dimension tables**
- Custom **DAX measures** were created to respond to the business's main **KPI indicators**, following defined **business rules**.

## View the Dashboard in Power BI

This project includes an interactive dashboard developed in Power BI, showcasing key performance metrics for a fictional ecommerce business.
[🔗 Haz clic aquí para ver el Dashboard completo en Power BI](https://app.powerbi.com/view?r=eyJrIjoiOTdlMDFmMzgtZjg0MC00OTgzLWI0MGMtMmNjZjUyZjMzZTM4IiwidCI6IjdmMThjZDE2LTgyZWYtNGVjMC04M2ZlLTJmMDBkYTUyNjAxOSIsImMiOjR9)

> *Note: The dashboard is hosted on Power BI Service. Please make sure you have an internet connection to view it properly.*

---

> 💡 If you are viewing this repository through GitHub Pages, you can access the dashboard directly from the corresponding public URL.
