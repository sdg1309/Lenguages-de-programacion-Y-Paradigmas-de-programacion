# Documentacion de Haskell

## Informacion General
***IMPORTANTE***

1. ***Todas las funciones deben tomar un argumento***
2. ***Todas las funciones deben volver un valor***
3. ***Cada vez que una función es llamada con el mismo argumento, debe devolver el mismo valor***

### Como instalar haskell en CodeSpaces (Linux)

Usamos los comandos para linux:

```linx
sudo apt update
```
Para actualizar todos los paquetes del sistema operativo

```linx
sudo apt install ghc cabal-install
```
Para instalar el interpretador `ghc` y el motor `cabal-install`

## Como hacer comentarios en Haskell

Comentario de una línea:

```haskell
-- Este es un comentario
```

Comentario de varias líneas:

```haskell
{-
Este es un comentario
de varias líneas.
-}
```

## Como comenzar un proyecto

```haskell
main :: IO ()
main = do

-- Tu codigo aqui
```

Esto se puede leer como:

Se declara la funcion principal "main" de tipo "::" IO (Input Output), lo que inidica que devuelve una accion de este tipo.

```haskell
main :: IO ()
```

Esta se usa para ejecutar acciones dentro del IO

```haskell
main = do
```

## Variables

### Declaracion de variables

Las variables se definen con `let` dentro de un bloque `do`.
En haskell se declara una variable de la siguiente manera:

```haskell
main :: IO ()
main = do
  let x = 5
```

Esto dice que dejar que x sea igual a 5.
Una vez asignadas, las variables no cambian durante la ejecución; esto es una ventaja para evitar efectos secundarios.

### Como Se pueden imprimir estas variables

En haskell se usa la funcion "putStrLn" para imprimir una string de texto enen la sigiente linea por la terminal.

```haskell
main :: IO ()
main = do
  putStrLn "hello world"
```

El codigo anterior nos da como resultado en la temrinal lo siguiente:

```terminal
hello world
```

Para imprimir numeros, arrays y demas cosas que no son una string, tenemos que acompañar esta funcion de un $ para eliminar parentecis y de show para mostrarlo como string, a continuacion se puede ver un ejemplo:

```haskell
main :: IO ()
main = do
  let x = 5
  putStrLn $ show x
```

Con el resultado siendo:

```terminal
5
```

## Funciones



Para declarar una funcion, se tiene que declarar antes de la funcion "main", y con el siguiente formato:

```haskell
Nombre :: Input (-> Input2 -> ...) -> Output
Nombre (Inputs) = accion (Output)
```

Un ejemplo puede ser:

```haskell
suma :: Int -> Int -> Int
suma x y = x + y

main :: IO ()
main = do
  let result = suma 2 3
  putStrLn $ "La suma es " ++ show result
```

Donde el primer "Int" se relaciona con el "x", el segundo "Int" con el "y" y el último "Int" con el output, en este caso el resultado de "x + y".

Dándonos como resultado:

```terminal
La suma es 5
```

Haskell usa currying, lo que significa que una función de varios argumentos puede interpretarse como una serie de funciones que reciben un argumento cada una.

## Listas

Las listas son una de las estructuras más usadas en Haskell. Se representan con corchetes y solo pueden contener elementos del mismo tipo.

### Tipos de listas

En Haskell se pueden encontrar varios tipos de listas:
- listas de números
- listas de tuplas
- listas de caracteres (`String`)

```haskell
numeros = [1, 2, 3, 4]          -- Lista de Int
tuplas = [(1, 2), (3, 4), (5, 6)] -- Lista de tuplas
string = "puppies"              -- String = lista de Char
```

### Concatenación

En haskell hay 2 tipos de concatenaciones:
Para agregar un elemento al inicio de una lista se usa `:`.
Para unir dos listas se usa `++`.

```haskell
numeros = [1, 2, 3, 4]
agregando = 0 : numeros -- Agregamos el numero 0 al inicio de numeros

lista1 = [1, 2, 3]
lista2 = [4, 5, 6]
resultado = lista1 ++ lista2 -- Concatenamos las 2 listas en una
```

### Generar listas infinitas, acotadas y en patrones

#### Listas infinitas
Para generar una lista infinita se usa la siguiente notacion:

```haskell
naturales = [1..]
```
Esta notación genera una lista infinita que comienza en 1 hasta ∞. El valor completo no se construye hasta que se necesita. La sintaxis se lee como:  `[inicio..]`

#### Listas acotadas
Para generar una lista acotada, se usa la siguiente notacion:

```haskell
naturales10 = [1..10]
```

Esto define una lista finita que va del 1 al 10. Esta syntaxis se puede leer como `[inicio .. fin]`

#### Listas con patrón

```haskell
pares = [2, 4..10]
```

Esto define una lista que va de 2 en 2 hasta el 10. Si se omite el valor final, el patrón sigue hasta el infinito.

### Funciones y operaciones

```haskell
head numeros      -- primer elemento

tail numeros      -- resto de la lista

length numeros    -- longitud de la lista

minimum numeros   -- mínimo en la lista

maximum numeros   -- máximo en la lista

elem n numeros    -- verifica si el elemento n existe en la lista

take n numeros    -- tomar los primeros n elementos de la lista

drop n numeros    -- omitir los primeros n elementos de la lista

numeros !! n      -- elemento en el índice n de la lista
```

- `head` devuelve el primer elemento de la lista.
- `tail` devuelve el resto de la lista.
- `length` devuelve la longitud.
- `minimum` y `maximum` devuelven el menor y el mayor valor.
- `elem` comprueba si un elemento pertenece a la lista.
- `take` toma los primeros 2 elementos de la lista
- `drop` omite los primeros n elementos de la lista
- `!!` accede a un elemento por índice (el primer índice es 0).

> `head`, `tail` y `!!` son funciones parciales, por lo que pueden generar errores si la lista está vacía o el índice es inválido.

