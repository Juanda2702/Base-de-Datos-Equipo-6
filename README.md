# Proyecto Data Warehouse: TechGlobal Retail

## Descripción del Proyecto
Este repositorio contiene los entregables prácticos para el diseño, modelado y preprocesamiento de un Data Warehouse orientado a la inteligencia de negocios para la empresa ficticia "TechGlobal Retail". 

## Estructura del Repositorio
* **/etl_scripts:** Contiene el script `limpieza_datos.py` desarrollado en Python (Pandas) para la extracción, transformación y limpieza de los datos crudos simulados.
* **/datos_limpios:** Almacena el archivo `hechos_ventas_limpio.csv`, el cual representa el conjunto de datos final estandarizado e imputado, listo para su ingesta en la base de datos.
* **Archivos raíz:** * `esquema_dw.sql`: Script DDL generado a través de MySQL Workbench para la creación del esquema en estrella (Star Schema).
  * `esquema_estrella.png`: Diagrama EER físico del modelo.

## Tecnologías Utilizadas
* **Base de Datos:** MySQL (Motor InnoDB optimizado para cargas OLAP).
* **Modelado:** MySQL Workbench 8.0.
* **Preprocesamiento ETL:** Python 3.x, Pandas, NumPy.

## Instrucciones de Ejecución
1. Ejecutar el script `limpieza_datos.py` para generar el archivo preprocesado en la carpeta `/datos`.
2. Importar el archivo `esquema_dw.sql` en una instancia de MySQL para generar las tablas de dimensiones y hechos.
