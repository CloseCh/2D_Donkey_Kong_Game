from PIL import Image
import os
import math

def cargar_paleta():
    # Definir la paleta
    paleta = {
        0: (0, 0, 0),       # FONDO
        1: (255, 0, 0),     # ROJO
        2: (0, 0, 255),     # AZUL
        3: (255, 228, 196),  # COLOR PIEL
        4: (255, 165, 0),   # NARANJA
        5: (240, 240, 240), # BLANCO
        6: (255, 192, 203)  # ROSA
    }
    return paleta

def encontrar_color_mas_cercano(color_pixel, paleta):
    # Encontrar el índice del color más cercano en la paleta
    distancia_minima = float('inf')
    indice_color_mas_cercano = 0

    for indice, color_paleta in paleta.items():
        distancia = math.dist(color_pixel, color_paleta)
        if distancia < distancia_minima:
            distancia_minima = distancia
            indice_color_mas_cercano = indice

    return indice_color_mas_cercano

def generar_mapa_de_bits(imagen, paleta):
    # Obtener las dimensiones de la imagen
    ancho, alto = imagen.size

    # Crear una lista para el mapa de bits
    mapa_de_bits = []

    # Convertir la imagen a modo de color RGBA
    imagen_rgba = imagen.convert("RGBA")

    # Iterar sobre los píxeles de la imagen
    for y in range(alto):
        fila = []
        for x in range(ancho):
            # Obtener el color del píxel
            color_pixel = imagen_rgba.getpixel((x, y))

            # Encontrar el índice del color más cercano en la paleta
            indice_color = encontrar_color_mas_cercano(color_pixel[:3], paleta)

            # Agregar el índice al mapa de bits
            fila.append(indice_color)
        mapa_de_bits.append(fila)

    return mapa_de_bits

def imprimir_filas_en_formato(datos, archivo):
    # Imprimir las filas en el formato especificado
    for fila in datos:
        archivo.write(" DC.B " + ",".join(map(str, fila)) + "\n")

def procesar_imagenes_y_guardar_txt(ruta_imagenes, carpeta_destino):
    # Cargar la paleta
    paleta = cargar_paleta()

    # Crear la carpeta de destino si no existe
    if not os.path.exists(carpeta_destino):
        os.makedirs(carpeta_destino)

    # Obtener la lista de archivos BMP en la carpeta de imágenes
    archivos_bmp = [archivo for archivo in os.listdir(ruta_imagenes) if archivo.lower().endswith('.bmp')]

    # Crear el archivo TXT de salida
    with open(os.path.join(carpeta_destino, "output.txt"), 'w') as archivo_output:
        # Procesar cada archivo BMP
        for archivo_bmp in archivos_bmp:
            # Cargar la imagen BMP
            ruta_imagen = os.path.join(ruta_imagenes, archivo_bmp)
            imagen = Image.open(ruta_imagen)

            # Generar el mapa de bits
            mapa_de_bits = generar_mapa_de_bits(imagen, paleta)

            # Escribir el nombre del archivo en mayúsculas y sin la extensión .bmp en el archivo de salida
            nombre_archivo = os.path.splitext(archivo_bmp)[0].upper()
            archivo_output.write("\n{}\n".format(nombre_archivo))

            # Guardar el mapa de bits en el archivo de salida
            imprimir_filas_en_formato(mapa_de_bits, archivo_output)

if __name__ == "__main__":
    # Ruta de la carpeta que contiene las imágenes BMP
    ruta_imagenes = "IMAGES\imagenes"

    # Carpeta de destino para el archivo TXT
    carpeta_destino = "IMAGESTEXT"

    # Procesar imágenes y guardar archivo TXT
    procesar_imagenes_y_guardar_txt(ruta_imagenes, carpeta_destino)
