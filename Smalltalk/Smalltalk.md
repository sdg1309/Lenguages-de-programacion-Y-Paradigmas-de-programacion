# Smalltalk - Guía Completa

## ¿Qué es Smalltalk?

Smalltalk es un lenguaje de programación completamente orientado a objetos, creado en los años 70 en Xerox PARC. Es considerado uno de los pioneros en la programación orientada a objetos (POO) y fue una gran influencia para lenguajes como Java, Python, C# y muchos otros.

### Características principales de Smalltalk

- **Puramente orientado a objetos**: Todo es un objeto, incluyendo los números, caracteres y incluso las clases.
- **Dinámico**: Tipado dinámico con fuerte verificación de tipos en tiempo de ejecución.
- **Interactivo**: Posee un ambiente de desarrollo integrado (IDE) muy potente donde puedes explorar el código.
- **Reflexión y Metaprogramación**: Es posible inspeccionar y modificar el comportamiento de los objetos en tiempo de ejecución.
- **Sintaxis simple**: La sintaxis es muy legible y fácil de aprender.
- **Garbage Collection**: Recolección automática de basura.

---

## Instalación en VSCode

### Paso 1: Instalar la extensión de Smalltalk

Se recomienda usar la extensión **GNU Smalltalk** que proporciona:
- Resaltado de sintaxis
- IntelliSense (autocompletación)
- Refactorización de código
- Diagnósticos
- Ejecución de archivos

La extensión está disponible en el marketplace de VSCode bajo el nombre `Smalltalk` del autor `leocamello`.

**Pasos para instalar:**
1. Abre VSCode
2. Ve a la sección de Extensiones (Ctrl+Shift+X / Cmd+Shift+X)
3. Busca "Smalltalk"
4. Instala la extensión de `leocamello` (GNU Smalltalk language support)

### Paso 2: Instalar un intérprete de Smalltalk

Existen varias opciones. Recomendamos **Pharo** por ser moderno y bien mantenido:

#### Opción A: Instalar Pharo (Recomendado) ⭐

**Windows/macOS/Linux:**
1. Ve a [pharo.org](https://pharo.org/)
2. Descarga la versión más reciente
3. Extrae y ejecuta

**Linux (desde terminal):**
```bash
# Crear directorio para Pharo
mkdir -p ~/pharo && cd ~/pharo

# Descargar Pharo
wget https://files.pharo.org/get-pharo/latest.zip
unzip latest.zip

# Ejecutar el IDE
./pharo-ui Pharo.image
```

#### Opción B: GNU Smalltalk (CLI, sin GUI)

**macOS:**
```bash
brew install gnu-smalltalk
```

**Ubuntu/Debian (compilar desde fuente):**
```bash
cd /tmp
wget https://ftpmirror.gnu.org/gnu/smalltalk/smalltalk-3.2.5.tar.gz
tar xzf smalltalk-3.2.5.tar.gz
cd smalltalk-3.2.5
./configure
make
sudo make install
```

**Windows:**
Descarga desde [GNU Smalltalk oficial](http://smalltalk.gnu.org/)

#### Opción C: TinyImageII (Online - Sin instalar)

Usa [TinyImageII online](http://tinyimage.org/) - un intérprete Smalltalk en el navegador, perfecto para aprender sin instalar.

### Paso 3: Verificar la instalación

**Para Pharo:**
```bash
pharo --version
```

**Para GNU Smalltalk:**
```bash
gst --version
```

**Nota:** En entornos sin interfaz gráfica (dev containers), usa GNU Smalltalk en modo CLI o accede a TinyImageII online.

---

## Conceptos Básicos de Smalltalk

### 1. **Objetos y Clases**

En Smalltalk, todo es un objeto. Las clases definen la estructura y comportamiento de los objetos.

```smalltalk
" Definir una clase "
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

### 2. **Métodos**

Los métodos definen el comportamiento de los objetos. Se envían mensajes a los objetos para invocar métodos.

```smalltalk
" Crear una instancia y enviar mensajes "
persona := Persona new.
persona nombre: 'Juan'.
persona edad: 30.
persona saludar.
```

### 3. **Tipos de Datos Primitivos**

Smalltalk tiene tipos de datos comunes:

```smalltalk
" Números "
x := 42.
y := 3.14.

" Cadenas (String) "
s := 'Hola Mundo'.

" Símbolos "
sym := #hola.

" Arrays (Arreglos) "
arr := #(1 2 3 4 5).

" Booleanos "
true displayNl.
false displayNl.
```

### 4. **Control de Flujo**

Las estructuras de control en Smalltalk se hacen mediante mensajes:

```smalltalk
" If-Then-Else "
(x > 10)
    ifTrue: [ 'x es mayor que 10' displayNl ]
    ifFalse: [ 'x es menor o igual a 10' displayNl ].

" Loops "
1 to: 5 do: [ :i | i displayNl ].

" While "
[x > 0] whileTrue: [
    x := x - 1.
].
```

### 5. **Bloques (Closures)**

Los bloques son fragmentos de código que se pueden pasar como argumentos y ejecutar posteriormente.

```smalltalk
" Bloque simple "
bloque := [ 'Hola desde el bloque' displayNl ].
bloque value.

" Bloque con parámetro "
cuadrado := [ :n | n * n ].
(cuadrado value: 5) displayNl.  " Imprime 25 "

" Bloques con colecciones "
arr := #(1 2 3 4 5).
arr do: [ :x | x displayNl ].

" Map "
resultado := arr collect: [ :x | x * 2 ].
resultado displayNl.
```

### 6. **Herencia**

Smalltalk soporta herencia simple:

```smalltalk
" Clase base "
Object subclass: #Animal [
    | nombre |
    
    nombre: n [
        nombre := n.
    ]
    
    hacer_sonido [
        'Sonido genérico' displayNl.
    ]
]

" Clase derivada "
Animal subclass: #Perro [
    hacer_sonido [
        'Guau guau' displayNl.
    ]
]

" Usar la herencia "
perro := Perro new.
perro nombre: 'Rex'.
perro hacer_sonido.
```

### 7. **Colecciones**

Smalltalk proporciona colecciones poderosas con muchos métodos útiles:

```smalltalk
" Array "
arr := #(1 2 3 4 5).

" Filtrar "
pares := arr select: [ :x | (x \\ 2) = 0 ].

" Reducir "
suma := arr inject: 0 into: [ :suma :x | suma + x ].

" Ordenar "
ordenado := arr sort.

" Dictionary "
dict := Dictionary new.
dict at: #nombre put: 'Juan'.
dict at: #edad put: 30.
```

### 8. **Manejo de Excepciones**

```smalltalk
[
    1 / 0.  " Esto causará una excepción "
] on: ZeroDivide do: [ :ex |
    'Error: División por cero' displayNl.
].
```

---

## Ejemplo Práctico: Calculadora Bancaria

```smalltalk
Object subclass: #CuentaBancaria [
    | titular saldo |
    
    titular: t [
        titular := t.
    ]
    
    depositar: cantidad [
        (cantidad <= 0)
            ifTrue: [
                'Error: cantidad debe ser positiva' displayNl.
                ^ self.
            ].
        saldo := saldo + cantidad.
        ('Depósito exitoso. Nuevo saldo: ' , saldo asString) displayNl.
    ]
    
    retirar: cantidad [
        (cantidad > saldo)
            ifTrue: [
                'Error: saldo insuficiente' displayNl.
                ^ self.
            ].
        saldo := saldo - cantidad.
        ('Retiro exitoso. Nuevo saldo: ' , saldo asString) displayNl.
    ]
    
    consultarSaldo [
        ('Saldo actual: ' , saldo asString) displayNl.
    ]
    
    initialize [
        saldo := 0.
    ]
]

" Uso "
cuenta := CuentaBancaria new.
cuenta initialize.
cuenta titular: 'Juan Pérez'.
cuenta depositar: 1000.
cuenta retirar: 300.
cuenta consultarSaldo.
```

---

## Ventajas de Smalltalk

✅ Lenguaje muy puro orientado a objetos
✅ Sintaxis simple y elegante
✅ Excepcional para aprender OOP
✅ Fuerte comunidad académica
✅ Excelente ambiente de desarrollo integrado
✅ Metaprogramación poderosa

## Desventajas

❌ Menor adopción en la industria moderna
❌ Ecosistema más pequeño comparado con Java o Python
❌ Puede ser lento para aplicaciones computacionalmente intensivas

---

## Recursos Útiles

- **Documentación oficial**: [GNU Smalltalk](http://smalltalk.gnu.org/)
- **Pharo**: [Pharo.org](https://pharo.org/) - Una versión moderna de Smalltalk
- **Libros recomendados**:
  - "Smalltalk by Example" de Alec Sharp
  - "Pharo by Example" (gratuito en línea)
- **Comunidades**:
  - Stack Overflow (tag: smalltalk)
  - Reddit: r/smalltalk

---

## Ejercicios para Practicar

1. **Hola Mundo**: Escribe un programa que imprima "Hola Mundo"
2. **Factorial**: Implementa una función que calcule el factorial de un número
3. **Fibonacci**: Crea una función para generar la serie de Fibonacci
4. **Clase Estudiante**: Define una clase con propiedades y métodos
5. **Operaciones en Arrays**: Filtra, mapea y reduce arrays

---

**¡Bienvenido al mundo de Smalltalk! 🚀**
