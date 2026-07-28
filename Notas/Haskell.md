# Qué es Haskell

Haskell es un lenguaje de programación puramente funcional. Esto significa que las funciones son el elemento principal para construir programas y que se evita depender de cambios de estado o efectos secundarios.

## Características principales

- Es un lenguaje puramente funcional.
- Tiene un sistema de tipos fuerte y estático.
- Promueve la claridad y la expresividad del código.
- Usa evaluación perezosa, lo que permite trabajar con estructuras infinitas y optimizar el uso de memoria.
- Se enfoca en funciones matemáticas y en la composición de operaciones.

## Transparencia referencial

Una propiedad importante de Haskell es la transparencia referencial: si una expresión se evalúa varias veces, siempre produce el mismo resultado, siempre que no dependa de valores externos. Esto facilita razonar sobre el código y evitar efectos colaterales.

## Evaluación perezosa

Haskell no ejecuta funciones ni calcula resultados hasta que realmente necesita mostrarlos. Por eso, por ejemplo, se pueden definir listas infinitas y trabajar con ellas sin que el programa se quede colgado.

```haskell
-- Una lista infinita
numbers = [1,2,3,4,5,6,7,8,9,10]
```

Aunque la lista pueda parecer infinita en teoría, Haskell solo calcula lo que se necesita.

## Funciones básicas

En Haskell, las funciones se definen de forma muy directa:

```haskell
sumarUno x = x + 1
```

Y se pueden aplicar así:

```haskell
sumarUno 5
-- Resultado: 6
```

## Definiciones y expresiones

Haskell permite definir valores y funciones con una sintaxis muy simple:

```haskell
nombre = "Ana"
edad = 20
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

## Patrones y recursión

Haskell suele usar patrones para descomponer valores y definir funciones recursivamente.

```haskell
añadirUno [] = []
añadirUno (x:xs) = x + 1 : añadirUno xs
```

Este ejemplo muestra cómo una lista puede procesarse elemento por elemento.

## Ejemplo simple

```haskell
factorial 0 = 1
factorial n = n * factorial (n - 1)
```

Este tipo de funciones es muy común en Haskell porque refleja la forma matemática de expresar algoritmos.

Referencia de apoyo: https://learnyouahaskell.github.io/introduction.html