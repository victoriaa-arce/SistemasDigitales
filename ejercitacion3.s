.text
.globl _start

_start:
    la a0, s            # Cargar la dirección base del vector s en a0
    la a1, q            # Cargar la dirección base del vector q en a1
    lw a2, size         # Cargar el tamaño del vector en a2
    li t0, 0          # Inicializar iterador a 0

ciclo: 
	beq t0, a2, fin #si son iguales entonces ya se recorrio todo el array 
	slli t2, t0, 2 # multiplica por 4 el iterador 
	add t3, a0, t2 #siguiente elemento de s
	add t4, a1, t2 #siguiente elemento de q
    andi t1, t0, 1 # Realizar una AND bit a bit con 1 y almacenar el resultado en t0
    beq t1, zero, par # si el res es 0 es porque el ultimo bit de t0 era 0 entonces es par
    sw zero, 0(t3)
    addi t0, t0, 1 
    j ciclo
par:
	lw t5, 0(t4)
	sw t5, 0(t3)
    addi t0, t0, 1
	j ciclo
fin: 	
    li a7, 10
	ecall
.data
s: .word 0xDD 0x33 0xFA
q: .word 0x23 0x78 0x57
size: .word 0x3
