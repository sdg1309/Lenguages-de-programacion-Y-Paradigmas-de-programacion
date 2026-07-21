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