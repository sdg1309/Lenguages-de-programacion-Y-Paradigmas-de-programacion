# Documentacion de Haskell

## Como hacer comentarios:
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

## Como comenzar un proyecto:

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
En haskell se declara una funcion de la siguiente manera:
```haskell
main :: IO ()
main = do
  let x = 5
```
Esto dice que dejar que x sea igual a 5.
Estos valores son inmutables.

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
  suma 2 3
  putStrLn $ "La suma es " ++ show result
```
Donde el primer "Int" se relaciona con el "x", el segundo "Int" con el "y" y el ultimo "Int" con el output, en este caso el resultado de "x + y"

Dandonos como resultado:

```terminal
La suma es 5
```

## Listas

Las listas son una de las estructuras más usadas en Haskell.

```haskell
numeros = [1, 2, 3, 4]
```

Algunas operaciones comunes:

```haskell
head numeros      -- primer elemento
tail numeros      -- resto de la lista
length numeros    -- longitud
```

El "tail" y "head" Sacan errores porque son acciones parciales, si la lista esta vacia, te da un error.
