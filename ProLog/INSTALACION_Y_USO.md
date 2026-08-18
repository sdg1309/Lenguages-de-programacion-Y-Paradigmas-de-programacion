# 📚 Guía de Instalación y Uso de Prolog en Codespaces

## 1. Instalación de Prolog

Ya hemos instalado **SWI-Prolog 9.0.4** en tu Codespace. SWI-Prolog es la implementación más popular y completa de Prolog.

**Comando usado:**
```bash
sudo apt update && sudo apt install -y swi-prolog
```

Para verificar que está instalado:
```bash
swipl --version
```

---

## 2. Cómo Usar Prolog

### Opción A: Modo Interactivo

Para entrar al intérprete interactivo de Prolog:

```bash
swipl
```

Una vez dentro, puedes:
- Cargar un archivo: `?- consult('archivo.pl').`
- Hacer consultas: `?- padre(juan, X).`
- Obtener más soluciones: presiona `;` (punto y coma)
- Salir: `?- halt.` o presiona `Ctrl+D`

### Opción B: Ejecutar un Archivo Directamente

Para ejecutar un archivo Prolog completo:

```bash
swipl archivo.pl
```

### Opción C: Ejecutar una Consulta Específica

```bash
swipl -f archivo.pl -t "consulta(X), write(X), nl, halt"
```

---

## 3. Estructura de Archivos Prolog

Un archivo Prolog (extensión `.pl`) tiene esta estructura:

```prolog
% HECHOS (datos)
padre(juan, maria).
madre(ana, maria).

% REGLAS (lógica)
progenitor(X, Y) :- padre(X, Y).
progenitor(X, Y) :- madre(X, Y).

% CONSULTAS (preguntas)
?- progenitor(juan, maria).
```

---

## 4. Archivos de Ejemplo en este Directorio

### 📄 `ejemplo_basico.pl`
Archivo con ejemplos de hechos y reglas sobre animales y relaciones familiares. 
**Cómo usarlo:**
```bash
swipl ejemplo_basico.pl
```

Luego en el intérprete interactivo:
```prolog
?- animal(X).
?- abuelo(juan, X).
?- hermano(maria, carlos).
```

### 📄 `demo.pl`
Archivo ejecutable que demuestra automáticamente varias consultas Prolog en acción.
**Cómo ejecutarlo:**
```bash
swipl demo.pl
```

---

## 5. Comandos Útiles en el Intérprete

| Comando | Descripción |
|---------|-------------|
| `?- consulta.` | Hacer una consulta |
| `;` | Obtener siguiente solución |
| `.` | Detener búsqueda de soluciones |
| `?- consult('archivo.pl').` | Cargar un archivo |
| `?- listing.` | Ver todos los hechos y reglas |
| `?- listing(predicado).` | Ver un predicado específico |
| `?- help(tema).` | Obtener ayuda |
| `?- halt.` | Salir de Prolog |
| `Ctrl+D` | Salir (atajo) |

---

## 6. Ejemplo Completo de Sesión

```bash
$ swipl ejemplo_basico.pl
Welcome to SWI-Prolog (threaded, 64 bits, version 9.0.4)
...

?- animal(X).
X = perro ;              % presiona ; para más soluciones
X = gato ;
X = pajaro ;
X = pez.

?- abuelo(juan, X).
X = ana.

?- hermano(maria, Y).
Y = carlos.

?- halt.
```

---

## 7. Crear tu Propio Archivo Prolog

Crea un archivo llamado `mi_programa.pl`:

```prolog
% Mi primer programa en Prolog

% Hechos: Mis comidas favoritas
me_gusta(pizza).
me_gusta(pasta).
me_gusta(helado).

% Hechos: Qué es comida
es_comida(pizza).
es_comida(pasta).
es_comida(helado).
es_comida(ensalada).

% Regla: Puedo comer lo que me gusta
puedo_comer(X) :- me_gusta(X).

% Consultas
?- me_gusta(X).
?- puedo_comer(pizza).
?- es_comida(Y).
```

Luego ejecuta:
```bash
swipl mi_programa.pl
```

---

## 8. Sintaxis Básica de Prolog

- **Variables**: Comienzan con mayúscula (X, Resultado, _)
- **Átomos**: Comienzan con minúscula (juan, maria, perro)
- **Predicados**: `predicado(arg1, arg2, ...)`
- **Comentarios**: Comienzan con `%`
- **Punto**: Todo hecho/regla/consulta termina con punto (`.`)
- **Operador condicional**: `:-` significa "si"
- **Separador de argumentos**: `,` significa "Y"
- **Alternativa**: `;` significa "O"
- **Negación**: `\+` significa "NO"

---

## 9. Recursos Útiles

- **SWI-Prolog Official**: http://www.swi-prolog.org/
- **Documentation**: http://www.swi-prolog.org/pldoc/
- **Online Playground**: https://swish.swi-prolog.org/
- **Tutorial Interactivo**: Learn Prolog Now (disponible online)

---

## 10. Próximos Pasos

1. ✅ Hemos instalado Prolog
2. ✅ Hemos creado archivos de ejemplo
3. ✅ Probamos que funciona correctamente
4. **Siguiente**: Aprende más en el archivo `prolog.md` con la introducción completa
5. **Luego**: Experimenta con tus propios programas Prolog

¡Ahora estás listo para usar Prolog en Codespaces! 🚀
