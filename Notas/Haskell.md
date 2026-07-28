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

Referencia de apoyo: https://learnyouahaskell.github.io/introduction.html