# Introducción a Prolog

## ¿Qué es Prolog?

Prolog es un **lenguaje de programación lógica** basado en la lógica matemática y el cálculo de predicados de primer orden. Su nombre proviene de "PROgramming in LOGic" (Programación en Lógica).

A diferencia de lenguajes imperativos que especifican **cómo** resolver un problema, Prolog te permite especificar **qué** es un problema mediante hechos y reglas lógicas. El sistema de inferencia automático de Prolog es responsable de encontrar las soluciones.

---

## Características Principales

- **Declarativo**: Describes hechos y reglas en lugar de instrucciones
- **Orientado a búsqueda**: Utiliza backtracking para explorar soluciones
- **Unificación**: Compara patrones de manera automática
- **Adecuado para IA**: Ideal para sistemas expertos, procesamiento de lenguaje natural, planificación
- **Interpretado**: Se ejecuta sin compilación previa

---

## Conceptos Fundamentales

### 1. Hechos
Un hecho es una afirmación verdadera sobre el mundo. Se termina con un punto.

```prolog
padre(juan, maria).
padre(juan, carlos).
madre(ana, maria).
madre(ana, carlos).
gato(michi).
```

### 2. Reglas
Una regla es una afirmación condicional que define relaciones lógicas.

```prolog
abuelo(X, Z) :- padre(X, Y), padre(Y, Z).
progenitor(X, Y) :- padre(X, Y).
progenitor(X, Y) :- madre(X, Y).
hermano(X, Y) :- padre(P, X), padre(P, Y), X \= Y.
```

La notación es: `cabeza :- cuerpo.`
- **Cabeza**: Lo que se quiere probar
- `:-` : Significa "si"
- **Cuerpo**: Condiciones que deben cumplirse

### 3. Consultas
Una consulta es una pregunta que hacemos al sistema Prolog.

```prolog
?- padre(juan, maria).      % ¿Es juan padre de maria?
?- padre(juan, X).          % ¿De quién es padre juan?
?- padre(X, Y).             % ¿Quiénes son padres?
```

### 4. Variables
Las variables comienzan con mayúscula o guión bajo (`_`). El guión bajo representa una variable anónima.

```prolog
?- padre(juan, X).          % X es una variable
?- padre(_, Y).             % _ es una variable anónima
```

---

## Unificación y Backtracking

### Unificación
Es el proceso de hacer que dos términos sean idénticos sustituyendo variables. Prolog busca automaticamente las sustituciones necesarias.

```prolog
% Consultamos: ?- padre(juan, X).
% Prolog unifica con padre(juan, maria).
% Resultado: X = maria
```

### Backtracking
Es el mecanismo de búsqueda de Prolog. Cuando una solución no funciona, Prolog retrocede e intenta otras opciones.

```prolog
hechos:
    padre(juan, maria).
    padre(juan, carlos).

consulta: ?- padre(juan, X).
respuesta:
    X = maria ;  (presionar ; para más soluciones)
    X = carlos ;
    false.       (no hay más soluciones)
```

---

## Estructura de un Programa Prolog

Un programa típico tiene tres secciones:

```prolog
% 1. HECHOS (Base de datos)
padre(juan, maria).
padre(juan, carlos).
madre(ana, maria).

% 2. REGLAS (Inferencias)
abuelo(X, Z) :- padre(X, Y), padre(Y, Z).
hermano(X, Y) :- padre(P, X), padre(P, Y), X \= Y.

% 3. CONSULTAS (Preguntas)
?- abuelo(juan, X).
```

---

## Operadores Lógicos

| Operador | Significado | Ejemplo |
|----------|-------------|---------|
| `,` | Y (AND) | `padre(X,Y), madre(Y,Z)` |
| `;` | O (OR) | `padre(X,Y); madre(X,Y)` |
| `\+` | NO (negación por fallo) | `\+ padre(X, Y)` |
| `=` | Unificación | `X = maria` |
| `\=` | No unificable | `X \= Y` |
| `==` | Idéntico | `X == Y` |
| `\==` | No idéntico | `X \== Y` |

---

## Ejemplo Práctico Completo

```prolog
% Base de datos: Información de familia
padre(tomás, ana).
padre(tomás, luis).
padre(juan, pedro).
padre(juan, mariana).

madre(maría, ana).
madre(maría, luis).
madre(rosa, pedro).
madre(rosa, mariana).

% Reglas
progenitor(X, Y) :- padre(X, Y).
progenitor(X, Y) :- madre(X, Y).

hermano(X, Y) :- 
    padre(P, X), 
    padre(P, Y), 
    X \= Y.

hermano(X, Y) :- 
    madre(M, X), 
    madre(M, Y), 
    X \= Y.

abuelo(X, Z) :- padre(X, Y), progenitor(Y, Z).
abuela(X, Z) :- madre(X, Y), progenitor(Y, Z).

% Consultas ejemplo:
% ?- padre(tomás, X).
% ?- hermano(ana, luis).
% ?- abuelo(X, luis).
```

---

## Listas en Prolog

Prolog tiene soporte nativo para listas usando la notación `[H|T]` donde:
- `H` es la cabeza (head) - primer elemento
- `T` es la cola (tail) - resto de elementos

```prolog
% Listas
lista([1, 2, 3, 4, 5]).

% Primer elemento
?- [H|T] = [1,2,3].
% H = 1, T = [2,3]

% Predicados útiles
append([1,2], [3,4], X).     % X = [1,2,3,4]
member(X, [a,b,c]).          % X = a ; X = b ; X = c

% Recursión con listas
suma([], 0).
suma([H|T], Suma) :- 
    suma(T, SumaResta),
    Suma is H + SumaResta.

% ?- suma([1,2,3,4], X). → X = 10
```

---

## Aritmética en Prolog

Prolog proporciona operadores aritméticos. Se evalúan con `is`:

```prolog
?- X is 2 + 3.           % X = 5
?- X is 10 - 4.          % X = 6
?- X is 3 * 4.           % X = 12
?- X is 15 / 3.          % X = 5
?- X is 15 // 3.         % X = 5 (división entera)
?- X is 17 mod 5.        % X = 2
?- X is 2 ** 3.          % X = 8 (exponenciación)

% Comparación aritmética
?- 5 > 3.                % true
?- X is 5, Y is 3, X > Y. % true
```

---

## Aplicaciones de Prolog

1. **Sistemas Expertos**: Representación de conocimiento médico, legal, etc.
2. **Procesamiento de Lenguaje Natural**: Análisis sintáctico y semántico
3. **Planificación Automática**: Problemas de búsqueda y optimización
4. **Resolución de Restricciones**: Problemas con condiciones complejas
5. **Bases de Datos Lógicas**: Consultas complejas
6. **Demostración Automática de Teoremas**: Verificación de propiedades lógicas

---

## Ventajas y Desventajas

### Ventajas ✓
- Código conciso y declarativo
- Excelente para problemas lógicos y simbólicos
- Backtracking automático
- Fácil de entender para lógicos y matemáticos

### Desventajas ✗
- Rendimiento inferior a lenguajes imperativos
- Curva de aprendizaje empinada
- Menos adecuado para aplicaciones de interfaz gráfica
- Comunidad más pequeña que otros lenguajes

---

## Implementaciones Populares

- **SWI-Prolog**: La más popular y de código abierto
- **GNU Prolog**: Compilador rápido
- **YAP**: Eficiente y con muchas extensiones
- **Ciao**: Moderno con buena documentación

---

## Recursos Útiles

- **SWI-Prolog Documentation**: http://www.swi-prolog.org/
- **Learn Prolog Now**: Tutorial online interactivo
- **The Art of Prolog**: Libro clásico sobre el tema

---

## Conclusión

Prolog es un lenguaje fascinante que permite pensar en términos de lógica pura. Aunque no es tan popular como lenguajes imperativos, sigue siendo invaluable para campos específicos como IA, sistemas expertos y procesamiento de conocimiento. Su enfoque declarativo ofrece una perspectiva completamente diferente sobre cómo resolver problemas en programación.
