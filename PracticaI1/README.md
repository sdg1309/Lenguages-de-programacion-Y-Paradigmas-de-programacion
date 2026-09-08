# Práctica I: From Pixels to the Integral

Implementación del mismo problema en Haskell y Prolog para ST0244.

## Integrantes

- `PENDIENTE: escribir aquí los nombres de todos los integrantes.`

## Estructura

```text
.
├── Haskell/Main.hs
├── Prolog/main.pl
├── curva_binaria_P4.pbm
└── README.md
```

El archivo `curva_binaria_P4.pbm` es la entrada binaria original y no se modifica ni se convierte previamente a una matriz de texto.

## Entorno y ejecución

La solución usa únicamente bibliotecas estándar: `bytestring` en Haskell y los predicados estándar de SWI-Prolog.

Desde la raíz del proyecto:

```bash
runghc Haskell/Main.hs
swipl -q -s Prolog/main.pl
```

También se puede indicar otra ruta a un PBM P4 como primer argumento:

```bash
runghc Haskell/Main.hs ruta/archivo.pbm
swipl -q -s Prolog/main.pl -- ruta/archivo.pbm
```

En el entorno de desarrollo usado para preparar esta entrega no están instalados `ghc`, `runghc` ni `swipl`; por ello la revisión local disponible fue la comprobación de errores del editor y una validación independiente de los bytes. En un entorno con ambos intérpretes, los comandos anteriores son la verificación ejecutable final.

## Formato PBM y resultado

El archivo suministrado tiene:

- formato `P4` binario;
- ancho `567` y alto `319`;
- `71` bytes por fila, calculados como `(567 + 7) div 8`;
- `22649` bytes de datos, exactamente `71 * 319`;
- área esperada: **108660 píxeles cuadrados**.

Cada byte contiene ocho píxeles en orden MSB-first. Para `(x,y)`, el byte es `y * bytesPorFila + x div 8` y el bit consultado es `7 - (x mod 8)`. En ambos programas `y = 0` es la fila superior del PBM; por eso `f(x)` consulta `alto - 1`, `alto - 2`, ..., `0`. Cuenta negros consecutivos y se detiene en el primer blanco.

La anchura de cada columna es `Delta x = 1`, así que:

```text
M = map f [0 .. ancho - 1]
area = sum M
```

El valor de `area` se expresa en píxeles cuadrados.

## Estrategia de visualización

La imagen se visualiza en una rejilla de `96 x 32`. Cada carácter representa un bloque rectangular de la imagen original y es `#` si el bloque contiene al menos un píxel negro. Se conserva la orientación vertical y se evita imprimir los `567 x 319` píxeles completos.

La función de alturas se visualiza en `96` grupos horizontales y `16` niveles verticales. Cada grupo conserva la altura máxima de sus columnas, por lo que las variaciones principales de `M` siguen siendo visibles. Además, cada programa imprime diez muestras distribuidas desde la primera hasta la última columna.

## Solución Haskell

`Haskell/Main.hs` separa la lectura del PBM, el acceso `pixel`, la relación `columnHeight`, la construcción funcional `buildHeights = map ...` y `calculateArea = sum`. La representación `PBM` conserva los bytes binarios y permite consultar un píxel sin construir una matriz textual. La visualización es una transformación adicional del mismo dato.

## Solución Prolog

`Prolog/main.pl` lee los códigos binarios directamente. `pixel/4` relaciona una imagen, una coordenada y el color; `f/3` relaciona una columna con su altura mediante `consecutive_black/4`. `heights/2` pregunta declarativamente por todas las alturas con `findall/3`, y `area/2` obtiene la suma con `sum_list/2`.

La diferencia esencial es:

```text
Haskell: dominio -> map f -> M -> sum M -> área
Prolog:  relaciones -> valores que satisfacen f(X) -> M -> sum_list(M) -> área
```

Ambos calculan la misma suma de Riemann:

```text
A = sum f(x_i) * Delta x = sum f(x_i), porque Delta x = 1
```

## Defensa / explicación

### Haskell

- Es funcional porque expresa transformaciones de datos con funciones (`map`, `takeWhile`, `sum`) y mantiene la imagen como un valor inmutable.
- `columnHeight` implementa `f(x)` contando desde la fila inferior.
- `buildHeights` construye `M` aplicando `map` a todas las columnas.
- `calculateArea` implementa explícitamente `sum M`.
- `pixel` obtiene el byte y desplaza el bit MSB correspondiente.
- La visualización agrupa regiones de píxeles y muestra también una versión reducida de `M`.

### Prolog

- `pixel/4`, `f/3` y `consecutive_black/4` describen relaciones entre datos, coordenadas, colores y alturas.
- `findall/3` genera todas las alturas que satisfacen la relación para el dominio de columnas.
- `sum_list/2` calcula el área de la lista resultante.
- La solución es declarativa porque el programa describe qué relaciones deben cumplirse; la consulta solicita los valores válidos.

### Comparación

Haskell enfatiza una secuencia de transformaciones: dominio, alturas y suma. Prolog enfatiza relaciones y búsqueda de valores que satisfacen `f(X)`. El formato de la expresión cambia, pero los dos usan los mismos bits, la misma orientación, el mismo `M` y la misma suma exacta.

## Casos límite considerados

El número de bytes por fila se calcula como `(ancho + 7) div 8`, por lo que también cubre anchos menores que ocho y anchos que no son múltiplos de ocho; los bits de padding no se consultan porque `x` siempre está dentro del ancho. Las columnas completamente blancas producen altura `0`, las completamente negras pueden alcanzar `alto`, y el acceso contempla primera y última fila y columna. El encabezado se valida como `P4`, con dimensiones positivas y longitud de datos exacta. El separador después de las dimensiones se consume por separado para no perder un primer byte binario que coincida con whitespace.

## Checklist

- [x] PBM P4 leído directamente.
- [x] Lectura binaria y validación de longitud.
- [x] Acceso individual a bits MSB-first.
- [x] `f(x)` implementada desde abajo hasta el primer blanco.
- [x] `M` construida desde todas las columnas.
- [x] Área calculada como suma de `M`.
- [x] Área expresada en píxeles cuadrados.
- [x] Visualización comprimida de la curva.
- [x] Visualización de la función de alturas.
- [x] Diez muestras distribuidas.
- [x] Haskell funcional.
- [x] Prolog declarativo.
- [x] Misma fuente PBM y misma orientación en ambos programas.
- [x] README con ejecución, decisiones y defensa.
- [ ] Ejecutar ambos programas en una máquina con GHC y SWI-Prolog y confirmar en consola `108660` en ambos.