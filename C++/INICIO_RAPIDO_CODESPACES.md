# ⚡ C++ en GitHub Codespaces - Inicio Rápido

Aprende C++ en Codespaces en 30 minutos. **Sin instalación requerida.**

---

## 🎯 Opción A: Hola Mundo (2 minutos)

### Paso 1: Crear archivo

```bash
cd /workspaces/Lenguages-de-programacion-Y-Paradigmas-de-programacion/C++
cat > hola.cpp << 'EOF'
#include <iostream>

int main() {
    std::cout << "¡Hola Mundo desde C++!" << std::endl;
    return 0;
}
EOF
```

### Paso 2: Compilar

```bash
g++ hola.cpp -o hola
```

### Paso 3: Ejecutar

```bash
./hola
```

**Resultado:**
```
¡Hola Mundo desde C++!
```

✅ **¡Listo! Tu primer programa C++ funciona.**

---

## 🎯 Opción B: Ejemplos Completos (10 minutos)

### Paso 1: Ver ejemplos

Abre `ejemplos_basicos.cpp` en el editor.

### Paso 2: Compilar todos los ejemplos

```bash
cd ~/C++
g++ ejemplos_basicos.cpp -o ejemplos
./ejemplos
```

**Verás:**
```
Hola Mundo
42
3.14
10 + 5 = 15
...
```

### Paso 3: Modificar y experimentar

Abre `ejemplos_basicos.cpp`, cambia algo (ej: el número 42), guarda y ejecuta:

```bash
g++ ejemplos_basicos.cpp -o ejemplos
./ejemplos
```

✅ **Experimentas con código real.**

---

## 🎯 Opción C: Entender C++ (20 minutos)

### Paso 1: Leer teoría (10 min)

Abre: [CXX_COMPLETA.md](CXX_COMPLETA.md)

Lee los primeros 5 conceptos.

### Paso 2: Ejecutar ejemplos (10 min)

```bash
g++ ejemplos_basicos.cpp -o ejemplos
./ejemplos
```

Correlaciona lo que leíste con lo que ves en la salida.

---

## 📊 Compilación en Codespaces

### Comando básico:

```bash
# Compilar un archivo
g++ archivo.cpp -o ejecutable

# Ejecutar
./ejecutable
```

### Con flags útiles:

```bash
# Con advertencias
g++ -Wall archivo.cpp -o ejecutable

# Optimizado
g++ -O2 archivo.cpp -o ejecutable

# C++17
g++ -std=c++17 archivo.cpp -o ejecutable

# Debug
g++ -g archivo.cpp -o ejecutable
```

### Compilar múltiples archivos:

```bash
g++ archivo1.cpp archivo2.cpp -o programa
```

---

## 💻 Tu primer programa personalizado

### Paso 1: Crear archivo

```bash
cat > suma.cpp << 'EOF'
#include <iostream>

int main() {
    int a = 5;
    int b = 3;
    int suma = a + b;
    
    std::cout << a << " + " << b << " = " << suma << std::endl;
    
    return 0;
}
EOF
```

### Paso 2: Compilar

```bash
g++ suma.cpp -o suma
```

### Paso 3: Ejecutar

```bash
./suma
```

**Resultado:**
```
5 + 3 = 8
```

### Paso 4: Modificar

Cambia los números, guarda, recompila y ejecuta.

---

## 🔄 Ciclo de desarrollo en Codespaces

```
1. Abre editor
   └─ Edita archivo.cpp

2. Terminal
   └─ g++ archivo.cpp -o ejecutable

3. Ejecuta
   └─ ./ejecutable

4. Ver resultado
   └─ Modifica si es necesario

5. Vuelve a paso 1
```

---

## 📚 Estructura básica de C++

Todo programa C++ necesita:

```cpp
#include <iostream>          // Librería para entrada/salida

int main() {                 // Función principal
    std::cout << "Hola";     // Salida
    return 0;                // Salida del programa
}
```

---

## 🎓 Rutas de aprendizaje

### 🟢 Ruta Rápida (30 min)
```
1. Hola Mundo (5 min) - Opción A arriba
2. Ver ejemplos (10 min) - Opción B arriba
3. Crear tu programa (15 min) - Tu primer programa arriba
```

### 🟡 Ruta Normal (2 horas)
```
1. Lee CXX_COMPLETA.md (30 min)
2. Ejecuta ejemplos_basicos.cpp (20 min)
3. Ejecuta ejemplos_oop.cpp (20 min)
4. Crea un programa (50 min)
```

### 🔴 Ruta Completa (4 horas)
```
1. Lee CXX_COMPLETA.md completo (1 h)
2. Todos los ejemplos (1.5 h)
3. Referencia rápida (30 min)
4. Proyecto (1 h)
```

---

## 🔍 Ver errores y depurar

Si tienes errores de compilación:

```bash
g++ archivo.cpp -o ejecutable 2>&1
```

Esto mostrará los errores con números de línea.

**Ejemplo:**
```
archivo.cpp:5:5: error: use of undeclared identifier 'cout'
    cout << "Hola";
    ^
```

→ Necesitas: `#include <iostream>`

---

## 🛠️ Comandos útiles en Codespaces

```bash
# Ver contenido de un archivo
cat ejemplos_basicos.cpp

# Editar en el editor integrado
code archivo.cpp

# Ver todos los archivos .cpp
ls -la *.cpp

# Compilar y ejecutar en una línea
g++ archivo.cpp -o programa && ./programa

# Ver información del compilador
g++ --version
```

---

## 📖 Próximo paso

Elige uno:

1. **Aprender más:**
   - Lee: [CXX_COMPLETA.md](CXX_COMPLETA.md)

2. **Ver ejemplos:**
   - Abre: [ejemplos_basicos.cpp](ejemplos_basicos.cpp)
   - Ejecuta: `g++ ejemplos_basicos.cpp -o ejemplos && ./ejemplos`

3. **Referencia rápida:**
   - Consulta: [REFERENCIA_RAPIDA.md](REFERENCIA_RAPIDA.md)

4. **Navegar todo:**
   - Ve a: [MAPA_CONTENIDOS.md](MAPA_CONTENIDOS.md)

---

## ✅ Checklist de inicio

- [ ] Ejecuté el comando `g++ --version`
- [ ] Compilé `hola.cpp` exitosamente
- [ ] Ejecuté un programa y vi resultado
- [ ] Entiendo la estructura básica de C++
- [ ] Modifiqué y recompilé un programa

**Si marcaste todo, ¡ya eres un C++ programmer! 🎉**

---

**¡Bienvenido a C++! La aventura comienza ahora. 🚀**
