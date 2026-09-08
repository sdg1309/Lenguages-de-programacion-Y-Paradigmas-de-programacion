" Ejemplos básicos de Smalltalk
" Este archivo contiene ejemplos para empezar con Smalltalk

" ========================================
" 1. HOLA MUNDO
" ========================================

'Hola Mundo' displayNl.


" ========================================
" 2. VARIABLES Y TIPOS DE DATOS
" ========================================

x := 42.
y := 3.14.
nombre := 'Juan'.
verdadero := true.

x displayNl.
nombre displayNl.


" ========================================
" 3. OPERACIONES MATEMÁTICAS
" ========================================

(10 + 5) displayNl.
(20 - 8) displayNl.
(4 * 7) displayNl.
(15 / 3) displayNl.
(17 \\ 5) displayNl.  \" Módulo \"


" ========================================
" 4. STRINGS (CADENAS)
" ========================================

s1 := 'Hola'.
s2 := 'Mundo'.
resultado := s1 , ' ' , s2.  \" Concatenación \"
resultado displayNl.

'Mi número favorito es: ' displayNl.
(10 asString) displayNl.


" ========================================
" 5. ARRAYS (ARREGLOS)
" ========================================

numeros := #(1 2 3 4 5).
numeros displayNl.

\" Acceder a elementos \"
primero := numeros at: 1.
primero displayNl.

\" Largo del array \"
(numeros size) displayNl.


" ========================================
" 6. CONTROL DE FLUJO - IF/THEN/ELSE
" ========================================

edad := 20.

(edad >= 18)
    ifTrue: [ 'Eres mayor de edad' displayNl ]
    ifFalse: [ 'Eres menor de edad' displayNl ].


" ========================================
" 7. LOOPS - ITERACIÓN CON TO:DO:
" ========================================

\" Imprimir números del 1 al 5 \"
1 to: 5 do: [ :i |
    i displayNl.
].


" ========================================
" 8. LOOPS - ITERACIÓN CON COLECCIONES
" ========================================

numeros := #(10 20 30 40 50).

numeros do: [ :numero |
    (numero * 2) displayNl.
].


" ========================================
" 9. BLOQUES Y VARIABLES
" ========================================

cuadrado := [ :numero | numero * numero ].
(cuadrado value: 5) displayNl.
(cuadrado value: 7) displayNl.


" ========================================
" 10. COLECCIONES - SELECT (FILTRAR)
" ========================================

numeros := #(1 2 3 4 5 6 7 8 9 10).

\" Números pares \"
pares := numeros select: [ :x | (x \\ 2) = 0 ].
pares displayNl.

\" Números mayores que 5 \"
mayores := numeros select: [ :x | x > 5 ].
mayores displayNl.


" ========================================
" 11. COLECCIONES - COLLECT (MAP/TRANSFORMAR)
" ========================================

numeros := #(1 2 3 4 5).

\" Multiplicar por 2 \"
duplicados := numeros collect: [ :x | x * 2 ].
duplicados displayNl.

\" Elevar al cuadrado \"
cuadrados := numeros collect: [ :x | x * x ].
cuadrados displayNl.


" ========================================
" 12. COLECCIONES - INJECT (REDUCE/FOLD)
" ========================================

numeros := #(1 2 3 4 5).

\" Suma de todos los números \"
suma := numeros inject: 0 into: [ :acumulador :numero |
    acumulador + numero.
].
suma displayNl.

\" Producto de todos los números \"
producto := numeros inject: 1 into: [ :acum :num |
    acum * num.
].
producto displayNl.


" ========================================
" 13. DICCIONARIOS
" ========================================

persona := Dictionary new.
persona at: #nombre put: 'Carlos'.
persona at: #edad put: 25.
persona at: #ciudad put: 'Madrid'.

(persona at: #nombre) displayNl.
(persona at: #edad) displayNl.


" ========================================
" 14. WHILE LOOP
" ========================================

contador := 1.
[contador <= 3] whileTrue: [
    contador displayNl.
    contador := contador + 1.
].


" ========================================
" 15. MANEJO DE EXCEPCIONES
" ========================================

[
    resultado := 10 / 0.
] on: ZeroDivide do: [ :excepcion |
    'Error: No se puede dividir entre cero' displayNl.
].

'Programa continuó después del error' displayNl.
" ========================================
