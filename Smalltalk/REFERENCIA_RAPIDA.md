# 🎯 Smalltalk - Referencia Rápida

Guía de consulta rápida para sintaxis y comandos de Smalltalk.

---

## 📝 Comentarios

```smalltalk
" Comentario de línea "
"
  Comentario de múltiples líneas
  en Smalltalk
"
```

---

## 📤 Salida

```smalltalk
'texto' displayNl.        " Imprime con salto de línea "
'texto' display.          " Imprime sin salto "
123 displayNl.            " Imprime número "
```

---

## 🔢 Variables y Asignación

```smalltalk
x := 10.                  " Asignar valor "
nombre := 'Juan'.         " String "
verdadero := true.        " Booleano "
falso := false.
```

---

## 🧮 Operaciones Matemáticas

```smalltalk
10 + 5          " Suma → 15 "
10 - 3          " Resta → 7 "
4 * 7           " Multiplicación → 28 "
20 / 4          " División → 5 "
17 % 5          " Módulo → 2 "
2 ** 3          " Potencia → 8 "
```

---

## 🔤 Strings (Cadenas)

```smalltalk
s1 := 'Hola'.
s2 := 'Mundo'.
s1 , ' ' , s2.          " Concatenación → 'Hola Mundo' "

'10' asNumber.          " String a número → 10 "
10 asString.            " Número a string → '10' "
'HOLA' asLowercase.     " Minúsculas → 'hola' "
'hola' asUppercase.     " Mayúsculas → 'HOLA' "
'  hola  ' trim.        " Elimina espacios "
```

---

## 📊 Arrays (Arreglos)

```smalltalk
arr := #(1 2 3 4 5).     " Array literal "
arr at: 1.               " Primer elemento → 1 "
arr at: 3.               " Tercer elemento → 3 "
arr size.                " Largo → 5 "
arr isEmpty.             " ¿Está vacío? "

arr1 := #(a b c).
arr2 := #(d e f).
arr1 , arr2.             " Concatenar arrays "

arr copyFrom: 2 to: 4.  " Substring de array "
```

---

## 🗂️ Diccionarios

```smalltalk
dict := Dictionary new.
dict at: #nombre put: 'Juan'.
dict at: #edad put: 25.

dict at: #nombre.        " Acceder → 'Juan' "
dict keys.               " Todas las claves "
dict values.             " Todos los valores "
dict size.               " Cuántas entradas "
```

---

## ✅ Comparaciones

```smalltalk
5 = 5                   " Igual → true "
5 ~= 3                  " No igual → true "
5 < 10                  " Menor que "
5 > 3                   " Mayor que "
5 <= 5                  " Menor o igual "
5 >= 5                  " Mayor o igual "

true & true             " AND lógico "
true | false            " OR lógico "
true not                " NOT lógico "
```

---

## 🔀 Control de Flujo

### If-Then-Else

```smalltalk
(x > 10)
    ifTrue: [ 'Mayor que 10' displayNl ]
    ifFalse: [ 'Menor o igual a 10' displayNl ].

(x > 10)
    ifTrue: [ 'Mayor' displayNl ].

(x > 10)
    ifFalse: [ 'No mayor' displayNl ].
```

### Case-When

```smalltalk
dia := 3.
resultado := dia caseOf: {
    [1] -> ['Lunes'].
    [2] -> ['Martes'].
    [3] -> ['Miércoles'].
    [4] -> ['Jueves'].
    [5] -> ['Viernes'].
}
otherwise: ['Fin de semana'].

resultado displayNl.
```

---

## 🔁 Loops

### To-Do (Desde-Hasta)

```smalltalk
1 to: 5 do: [ :i | i displayNl ].
1 to: 10 by: 2 do: [ :i | i displayNl ].  " De 2 en 2 "
```

### While Loop

```smalltalk
contador := 1.
[contador <= 3] whileTrue: [
    contador displayNl.
    contador := contador + 1.
].

contador := 10.
[contador > 0] whileFalse: [
    contador := contador - 1.
].
```

### Do (Para colecciones)

```smalltalk
arr := #(1 2 3 4 5).
arr do: [ :x | x displayNl ].

dict := Dictionary new.
dict at: #a put: 1.
dict at: #b put: 2.
dict do: [ :valor | valor displayNl ].
```

---

## 🧱 Bloques (Closures)

```smalltalk
bloque := [ 'Ejecutar esto' displayNl ].
bloque value.                           " Ejecutar "

cuadrado := [ :n | n * n ].
(cuadrado value: 5) displayNl.          " → 25 "

suma := [ :a :b | a + b ].
(suma value: 3 value: 7) displayNl.    " → 10 "
```

---

## 🎯 Colecciones - Métodos útiles

### Select (Filtrar)

```smalltalk
numeros := #(1 2 3 4 5 6 7 8 9 10).
pares := numeros select: [ :x | (x % 2) = 0 ].
" → #(2 4 6 8 10) "
```

### Collect (Transformar/Map)

```smalltalk
numeros := #(1 2 3 4 5).
duplicados := numeros collect: [ :x | x * 2 ].
" → #(2 4 6 8 10) "
```

### Inject (Reducir/Fold)

```smalltalk
numeros := #(1 2 3 4 5).
suma := numeros inject: 0 into: [ :acum :x | acum + x ].
" → 15 "

producto := numeros inject: 1 into: [ :acum :x | acum * x ].
" → 120 "
```

### Detect (Encontrar)

```smalltalk
numeros := #(1 2 3 4 5).
primer_par := numeros detect: [ :x | (x % 2) = 0 ].
" → 2 "
```

### Reject (Lo opuesto de Select)

```smalltalk
numeros := #(1 2 3 4 5 6).
impares := numeros reject: [ :x | (x % 2) = 0 ].
" → #(1 3 5) "
```

### Count (Contar)

```smalltalk
numeros := #(1 2 3 4 5 6).
cantidad := (numeros count: [ :x | x > 3 ]).
" → 3 "
```

### Sort (Ordenar)

```smalltalk
numeros := #(5 2 8 1 9).
ordenado := numeros sort.
" → #(1 2 5 8 9) "

descendente := numeros sort: [ :a :b | a > b ].
```

---

## 📚 Clases y OOP

### Definir una clase

```smalltalk
Object subclass: #Persona [
    | nombre edad |
    
    nombre: n [
        nombre := n.
    ]
    
    edad: a [
        edad := a.
    ]
    
    saludar [
        ('Hola, soy ' , nombre) displayNl.
    ]
]
```

### Usar la clase

```smalltalk
p := Persona new.
p nombre: 'Juan'.
p edad: 25.
p saludar.
```

### Herencia

```smalltalk
Persona subclass: #Empleado [
    | salario |
    
    salario: s [
        salario := s.
    ]
    
    info [
        ('Empleado: ' , nombre , ' - Salario: ' , salario asString) displayNl.
    ]
]
```

### Métodos especiales

```smalltalk
initialize           " Se ejecuta al hacer .new "
class                " Obtener la clase del objeto "
superclass           " Clase padre "
allInstances         " Todas las instancias de la clase "
```

---

## 🛡️ Manejo de Excepciones

```smalltalk
[
    1 / 0.  " Causa error "
] on: ZeroDivide do: [ :ex |
    'Error: División por cero' displayNl.
].

[
    array at: 100.
] on: SubscriptOutOfBounds do: [ :ex |
    'Índice fuera de rango' displayNl.
].
```

---

## 🔍 Inspección de objetos

```smalltalk
obj := 'Hola'.
obj class.              " Clase del objeto "
obj class superclass.   " Clase padre "
obj size.               " Tamaño si aplica "
obj isNil.              " ¿Es nil? "
obj notNil.             " ¿No es nil? "
```

---

## 🎲 Números útiles

```smalltalk
5 abs.                  " Valor absoluto → 5 "
-5 abs.                 " → 5 "
5.5 floor.              " Piso → 5 "
5.5 ceiling.            " Techo → 6 "
5.5 round.              " Redondeo → 6 "
5 gcd: 10.              " MCD → 5 "
(Random new next) * 10. " Número aleatorio 0-10 "
```

---

## 📋 Órdenes de ejecución

```smalltalk
" Los puntos (.) separan sentencias "
x := 5.
y := 10.
z := x + y.

" Los punto-coma (!) termina el programa en modo interactivo "
'Fin del programa' displayNl. !
quit
```

---

## 💾 Archivos

```smalltalk
" Leer archivo "
stream := FileStream open: 'archivo.txt' mode: FileStream read.
contenido := stream contents.
stream close.

" Escribir archivo "
stream := FileStream open: 'archivo.txt' mode: FileStream write.
stream nextPutAll: 'Contenido'.
stream close.
```

---

## ⚙️ Conversiones de tipos

```smalltalk
'123' asNumber          " String → Número "
123 asString            " Número → String "
123.45 asInteger        " Decimal → Entero "
#(1 2 3) asOrderedCollection
#(1 2 3) asSortedCollection
```

---

## 🎓 Símbolos vs Strings

```smalltalk
'Hola' = 'Hola'         " true (compara contenido) "
'Hola' == 'Hola'        " false (referencia diferente) "

#hola = #hola           " true "
#hola == #hola          " true (símbolos internados) "
```

---

## 📌 Notas importantes

1. **Variables de instancia** empiezan con `|` dentro de clases
2. **Parámetro de bloque** se define con `:` ej: `[ :x | x + 1 ]`
3. **Todo es un mensaje** - `5 + 3` es `5.+(3)`
4. **Nil** es la ausencia de valor
5. **True/False** son objetos booleanos
6. **^ retorna** un valor de un método

---

**¡Guarda este archivo como referencia rápida! 📖**
