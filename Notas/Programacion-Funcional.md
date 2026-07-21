# Programacion Funcional

## Calculo lambda

## Interfaz funcional
Interfaz: Metodos abstractos (Framework)

Es una interfaz de posee un unico metodo abstracto.
La interfaz funiconal define el tipo de destino de una exprecion lambda.

(n) -> 1.0/n

- (n) : Parametros para la exprecion lambda
- 1.0/n: Cuerpo (acciones de la expresion lambda)

Una interfaz funcional solo tiene un metodo abstracto.

## Interfaz funcional Generica

| Interfaz | Descripción |
|---|---|
| BinaryOperator<T> | Recibe dos argumentos del mismo tipo y devuelve un resultado del mismo tipo T. Se usa para operaciones binarias como suma o multiplicación. |
| Consumer<T> | Acepta un argumento de tipo T y no devuelve nada. Se usa para realizar acciones sobre un valor. |
| Function<T, R> | Acepta un argumento de tipo T y devuelve un resultado de tipo R. Se usa para transformar un valor en otro. |
| Predicate<T> | Acepta un argumento de tipo T y devuelve un valor booleano. Se usa para evaluar condiciones. |
| Supplier<T> | No recibe argumentos y devuelve un valor de tipo T. Se usa para generar o proporcionar datos. |
| UnaryOperator<T> | Recibe un argumento de tipo T y devuelve otro resultado del mismo tipo T. Se usa para operaciones unarias como cambiar el signo. |

### Metodo abstracto:
Es un metodo basio, sin cuerpo, declarado para ser modificado mas adelante.
Ejemplo:
```Java
suma(){
// Nada aun
}

suma();
```

## Funciones Lambda (SAM, Single Abstract Method)
Es en esencia una funcion anonima que implementa un metodo definido en una interfaz funcional.

### Exprecion Lambda

```Java
() -> 144.0
```

Si la exprecion no recibe parametros no se puede dejar vacia.

En se siguiente caso la exprecion devuelve el valor constante 144.0 y se infiere que su tipo de dato a devolver es double.
```Java
() -> 144.0
```

Esta expresion obtiene un valor pseudoaleatorio, lo multiplica por 100 y devuelve el resultado. No requiere parametros
```Java
() -> Math.random() * 100
```

Esta lambda devuelve true si el valor del parametro n es par. Es decir, que el valor de retorno de esta lambda es booleana.
```Java
(n) -> (n % 2) == 0
```