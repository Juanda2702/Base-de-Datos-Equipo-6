import pandas as pd
import numpy as np
import os

def procesar_datos_ventas():
    print("Iniciando proceso ETL para TechGlobal Retail...")
    
    # 1. Simulación de los datos crudos
    datos_crudos = {
        'id_venta': [101, 102, 103, 104, 104, 105], # Nota el 104 duplicado
        'fecha': ['12/05/2026', '2026-05-13', '14-05-2026', '05/15/2026', '05/15/2026', '2026/05/16'], # Formatos inconsistentes
        'ciudad': ['CIUDAD DE MEXICO', 'monterrey', 'Guadalajara', 'MONTERREY', 'MONTERREY', 'cancún'], # Texto inconsistente
        'monto_total': ['$1500.50', '2300.00', '$350.75', '4500.00', '4500.00', '$120.00'], # Texto con signos $
        'descuento': [150.00, np.nan, 0.00, np.nan, np.nan, 10.00] # Valores nulos (NaN)
    }
    
    df = pd.DataFrame(datos_crudos)
    print("\n--- Datos Crudos Extraídos ---")
    print(df)
    
    # --- APLICACIÓN DE TÉCNICAS DE LIMPIEZA ---
    
    # Técnica 1: Deduplicación
    df = df.drop_duplicates(subset=['id_venta'], keep='first')
    
    # Técnica 2: Estandarización de Fechas (A ISO 8601: YYYY-MM-DD)
    # Se unifica el formato sin importar cómo venga escrito
    df['fecha'] = pd.to_datetime(df['fecha'], format='mixed').dt.strftime('%Y-%m-%d')
    
    # Técnica 3: Normalización de texto (Capitalización de ciudades)
    df['ciudad'] = df['ciudad'].str.title()
    
    # Técnica 4: Limpieza de caracteres y Casting a numérico (Monto)
    df['monto_total'] = df['monto_total'].replace({r'\$': ''}, regex=True).astype(float)
    
    # Técnica 5: Imputación de nulos (Llenar NaN con 0.00 en descuentos)
    df['descuento'] = df['descuento'].fillna(0.00)
    
    print("\n--- Datos Limpios y Estandarizados ---")
    print(df)
    
    # --- EXPORTACIÓN DE DATOS PREPROCESADOS ---
    # Crear carpeta si no existe
    if not os.path.exists('datos_limpios'):
        os.makedirs('datos_limpios')
        
    # Guardar el CSV limpio para importarlo a MySQL
    ruta_salida = 'datos_limpios/hechos_ventas_limpio.csv'
    df.to_csv(ruta_salida, index=False, encoding='utf-8')
    print(f"\nProceso finalizado. Archivo preprocesado guardado en: {ruta_salida}")

if __name__ == "__main__":
    procesar_datos_ventas()