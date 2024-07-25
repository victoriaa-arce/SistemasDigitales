.text
.globl _start  # Declarar el punto de entrada global del programa

_start:        # Etiqueta para el punto de entrada
    la a0, s    # Cargar la dirección base del vector s en a0
    la a1, q    # Cargar la dirección base del vector q en a1
    lw a2, size # Cargar el tamaño del vector en a2
    li t0, 0    # Inicializar el iterador a 0

ciclo:
    beq t0, a2, fin # Si el iterador t0 == tamaño (a2), salta a fin
    slli t1, t0, 2  # Multiplica t0 por 4 para obtener el desplazamiento en bytes
    add t2, a1, t1  # Calcula la dirección del siguiente elemento de q
    add t3, a0, t1  # Calcula la dirección del siguiente elemento de s
    lw t4, 0(t2)    # Carga la palabra (4 bytes) del elemento actual de q en t4
    sw t4, 0(t3)    # Almacena la palabra en el espacio del elemento correspondiente en s
    addi t0, t0, 1  # Incrementa el iterador t0
    j ciclo         # Salta de vuelta al inicio del ciclo

fin:
    li a7, 10       # Código de sistema para salir
    ecall           # Llamada al sistema para finalizar el programa

.data
s: .word 0xed, 0x34, 0x21 # Definición del vector s
q: .word 0xFF, 0x12, 0xca # Definición del vector q
size: .word 3 # Tamaño de los vectores
