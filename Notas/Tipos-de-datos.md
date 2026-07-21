# Tipos de datos en Java

## Tabla general de tipos de datos

| Tipo | Tamaño | Rango / valores | Valor por defecto | Uso común |
|---|---:|---|---|---|
| byte | 1 byte | -128 a 127 | 0 | Números pequeños |
| short | 2 bytes | -32,768 a 32,767 | 0 | Enteros cortos |
| int | 4 bytes | -2,147,483,648 a 2,147,483,647 | 0 | Enteros normales |
| long | 8 bytes | -9.22e18 a 9.22e18 | 0L | Enteros grandes |
| float | 4 bytes | Aproximado, hasta 7 decimales | 0.0f | Números decimales |
| double | 8 bytes | Aproximado, hasta 15 decimales | 0.0d | Números decimales grandes |
| boolean | 1 bit | true o false | false | Condiciones lógicas |
| char | 2 bytes | 0 a 65,535 (Unicode) | '\u0000' | Caracteres |

## Información general

- Java tiene tipos primitivos y tipos de referencia.
- Los tipos primitivos son: byte, short, int, long, float, double, boolean y char.
- Los tipos de referencia incluyen clases, arreglos e interfaces.
- En Java, los tipos primitivos no son objetos.
- El tipo `int` es el más utilizado para números enteros.
- El tipo `double` se usa con frecuencia para valores decimales.
- `char` almacena un único carácter y puede representar letras, números y símbolos.

## Ejemplo básico

```java
int edad = 20;
double precio = 15.75;
boolean activo = true;
char inicial = 'A';
```
