# 2D_Donkey_Kong_Game
Proyecto final de la asignatura Estructura de computadores II. Cursado en Escuela Politécnica Superior, Universidad de las Islas Baleares.

## FICHEROS
Los siguientes subapartados va a explicar la funcionalidad de cada fichero X68 en el cual se documenta todas las funcionalidades de cada subrutina creada, sus constantes y variables.

## MAIN.X68
Donde se situa el bucle principal del juego, llama a las subrutinas de inicialización y en un bucle se va ejecutando cada subrutina de update y plot.

## CONST.X68
Donde se guarda las constantes utilizada en el juego.

## SYSCONST.X68
En este fichero se guarda los constantes del sistema.

Constantes:
- SCRWIDTH: Ancho de la ventana.
- SCRHEIGH: altura de la ventana.

## SYSVARS.X68
Es guardado en ente fichero las variables del sistema.

## VARS.X68
Donde se guarda las variables usadas en el juego.

## SYSTEM.X68
El control del systema del juego.

Subrutinas:
- SYSINIT: inicialización del sistema

## MAP.X68
Se guarda el mapa de cada nivel del juego en varios matrices de bits.

Variables:
- MAPDATA: matriz de bits que guarda lo que se va a imprimir en cada recuadro de la ventana.(Con números naturales)

## MARIO.X68
Este fichero contiene la inicialización, update y plot del personaje mario, el cual va a ser controlado por el jugador.

Subrutinas:
- MAINIT: Inicialización del personaje mario.
- MAUPD: Realiza los cálculos necesarios para saber la siguiente posición del personaje.
- MAPLOT: Pinta en la ventana el personaje.

## DONKEY_KONG.X68
Este fichero contiene la inicialización, update y plot del personaje Donkey-kong, será el enemigo a derrotar por el jugador.

Subrutinas:
- KONGINIT: Inicialización del personaje Donkey Kong.
- KONGUPD: Realiza los cálculos necesarios para saber la siguiente posición del personaje.
- KONGPLOT: Pinta en la ventana el personaje.

## FIRE_BALL.X68
Este fichero contiene la inicialización, update y plot de las bolas lanzadas por Donkey-kong.

Subrutinas:
- FBALINIT: Inicialización de la bola de fuego.
- FBALUPD: Realiza los cálculos de la bola que va rodando y rebotando mientras baja.
- FBALPLOT: Pinta la bola en la ventana.

## PEACH.X68
Este fichero contiene la inicialización, update y plot de la princesa peach

Subrutinas:
- PEAINIT: Inicialización de la princesa Peach
- PEAUPD: Realiza los cálculos necesarios para saber la siguiente posición del personaje.
- PEAPLOT: Pinta en la ventana el personaje.
