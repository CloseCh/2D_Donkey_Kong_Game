from PIL import Image
import math

def cargar_paleta():
    # Definir la paleta
    paleta = {
        0: (0, 0, 0),       # FONDO
        1: (255, 0, 0),     # ROJO
        2: (0, 0, 255),     # AZUL
        3: (255, 228, 196),  # COLOR PIEL
        4: (255, 165, 0),   # NARANJA
        5: (255, 255, 255), # BLANCO
       #6: (255, 192, 203)  # ROSA
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

def imprimir_filas_en_formato(datos):
    # Imprimir las filas en el formato especificado
    for fila in datos:
        print(" DC.B " + ",".join(map(str, fila)))

def main():
    # Cargar la paleta
    paleta = cargar_paleta()

    # Cargar la imagen BMP
    ruta_imagen = r"C:\Users\jaume\Documents\uni\any2\semestre1\Estructura de computadors II\PRACTICAFINAL\imagentrue\mrr.bmp"  # Reemplaza con la ruta de tu imagen BMP
    imagen = Image.open(ruta_imagen)

    # Generar el mapa de bits
    mapa_de_bits = generar_mapa_de_bits(imagen, paleta)

    # Imprimir el mapa de bits en el formato deseado
    imprimir_filas_en_formato(mapa_de_bits)

if __name__ == "__main__":
    main()
