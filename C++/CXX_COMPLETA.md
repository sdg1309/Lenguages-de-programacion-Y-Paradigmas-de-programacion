# 📚 C++ Moderno - Guía Completa

Una introducción a C++ moderno (C++17/C++20) para principiantes.

---

## 📋 Tabla de Contenidos

1. [¿Qué es C++?](#qué-es-c)
2. [Conceptos Básicos](#conceptos-básicos)
3. [Variables y Tipos](#variables-y-tipos)
4. [Operadores](#operadores)
5. [Control de Flujo](#control-de-flujo)
6. [Funciones](#funciones)
7. [POO - Clases](#poo---clases)
8. [Estructuras de Datos](#estructuras-de-datos)

---

## ¿Qué es C++?

**C++** es un lenguaje de programación compilado, multiparadigma, que combina:

- **Programación procedural** (funciones, estructuras)
- **Programación orientada a objetos** (clases, herencia)
- **Programación genérica** (templates, STL)

### Características principales

✅ **Rendimiento extremadamente alto** - Compilado directamente a máquina
✅ **Control de memoria** - Puedes gestionar exactamente qué quieres
✅ **Estándar moderno** - C++17 y C++20 hacen código más limpio
✅ **Industria** - Usado en sistemas, juegos, finanzas, IoT
✅ **Portabilidad** - Funciona en cualquier sistema operativo

---

## 📝 Estructura básica

Todo programa C++ tiene esta estructura:

```cpp
#include <iostream>    // Importar librerías

int main() {           // Función principal (punto de entrada)
    // Tu código aquí
    return 0;          // Retornar 0 = éxito
}
```

---

## Conceptos Básicos

### 1. Inclusiones (Headers)

```cpp
#include <iostream>    // Entrada/salida
#include <vector>      // Arrays dinámicos
#include <string>      // Strings
#include <cmath>       // Matemáticas
#include <algorithm>   // Algoritmos

using namespace std;   // Para no escribir std:: siempre
```

### 2. Namespaces

```cpp
// Con using namespace
using namespace std;
cout << "Hola";                    // Funciona

// Sin using namespace
std::cout << "Hola";               // Necesitas std::

// Tu propio namespace
namespace MiApp {
    void funcion() { }
}
MiApp::funcion();                  // Usar tu namespace
```

### 3. Comentarios

```cpp
// Comentario de una línea

/* Comentario
   de múltiples
   líneas */
```

---

## Variables y Tipos

### Tipos de datos primitivos

```cpp
int numero = 42;               // Entero (32 bits normalmente)
float decimal = 3.14f;         // Punto flotante (32 bits)
double precision = 3.14159;    // Doble precisión (64 bits)
bool verdad = true;            // Booleano (true/false)
char letra = 'A';              // Un carácter

// Tipos con tamaño exacto (C++11)
int8_t   byte = 127;           // 8 bits
int16_t  corto = 32767;        // 16 bits
int32_t  entero = 2147483647;  // 32 bits
int64_t  largo = 9223372036854775807LL;  // 64 bits
```

### Strings (Cadenas)

```cpp
#include <string>
using namespace std;

string mensaje = "Hola Mundo";
string concatenado = "Hola" + " " + "Mundo";

// Operaciones
mensaje.length();              // Largo
mensaje[0];                    // Primer carácter
mensaje.substr(0, 4);          // Subcadena
mensaje.find("Mundo");         // Buscar
```

### Declaración vs Inicialización

```cpp
int x;              // Declaración (valor indefinido)
int y = 10;         // Inicialización (estilo C)
int z{10};          // Inicialización uniforme (C++11, preferido)
int w = int();      // Inicialización explícita (valor = 0)
```

---

## Operadores

### Aritméticos

```cpp
10 + 5      // Suma → 15
10 - 3      // Resta → 7
4 * 7       // Multiplicación → 28
20 / 4      // División → 5
17 % 5      // Módulo → 2
2 << 3      // Shift izquierda → 16
8 >> 2      // Shift derecha → 2
```

### Comparación

```cpp
5 == 5      // Igual → true
5 != 3      // Diferente → true
5 < 10      // Menor → true
5 > 3       // Mayor → true
5 <= 5      // Menor o igual → true
5 >= 5      // Mayor o igual → true
```

### Lógicos

```cpp
true && true        // AND → true
true || false       // OR → true
!true               // NOT → false
```

### Asignación

```cpp
int x = 10;         // Asignar
x += 5;             // x = x + 5
x -= 3;             // x = x - 3
x *= 2;             // x = x * 2
x /= 4;             // x = x / 4
x++;                // x = x + 1
x--;                // x = x - 1
```

---

## Control de Flujo

### If-Else

```cpp
int edad = 20;

if (edad >= 18) {
    cout << "Eres mayor de edad" << endl;
} else if (edad >= 13) {
    cout << "Eres adolescente" << endl;
} else {
    cout << "Eres niño" << endl;
}

// Ternario
string resultado = (edad >= 18) ? "Mayor" : "Menor";
```

### Switch

```cpp
int dia = 3;

switch (dia) {
    case 1:
        cout << "Lunes" << endl;
        break;
    case 2:
        cout << "Martes" << endl;
        break;
    case 3:
        cout << "Miércoles" << endl;
        break;
    default:
        cout << "Otro día" << endl;
}
```

### Loops

**For Loop:**
```cpp
for (int i = 0; i < 5; i++) {
    cout << i << endl;
}

// Rango (C++11)
int numeros[] = {1, 2, 3, 4, 5};
for (int num : numeros) {
    cout << num << endl;
}
```

**While Loop:**
```cpp
int contador = 0;
while (contador < 5) {
    cout << contador << endl;
    contador++;
}

// Do-While
do {
    cout << "Ejecuta al menos una vez" << endl;
} while (false);
```

---

## Funciones

### Definición básica

```cpp
int sumar(int a, int b) {
    return a + b;
}

int main() {
    int resultado = sumar(3, 7);
    cout << resultado << endl;  // 10
    return 0;
}
```

### Parámetros por referencia

```cpp
void incrementar(int& numero) {
    numero++;
}

int main() {
    int x = 5;
    incrementar(x);
    cout << x << endl;  // 6
    return 0;
}
```

### Parámetros por defecto

```cpp
void saludar(string nombre = "Mundo") {
    cout << "Hola " << nombre << endl;
}

saludar();          // Hola Mundo
saludar("Juan");    // Hola Juan
```

### Funciones con vector

```cpp
double promedio(vector<int> numeros) {
    int suma = 0;
    for (int num : numeros) {
        suma += num;
    }
    return (double)suma / numeros.size();
}
```

---

## POO - Clases

### Estructura básica

```cpp
class Persona {
private:                    // Privado
    int edad;

public:                     // Público
    string nombre;
    
    Persona(string n, int e) {  // Constructor
        nombre = n;
        edad = e;
    }
    
    void saludar() {
        cout << "Hola, soy " << nombre << endl;
    }
    
    int obtenerEdad() {
        return edad;
    }
};

int main() {
    Persona p("Juan", 25);
    p.saludar();
    cout << p.obtenerEdad() << endl;
    return 0;
}
```

### Herencia

```cpp
class Animal {
public:
    string nombre;
    
    Animal(string n) : nombre(n) {}
    
    virtual void hacer_sonido() {
        cout << "Sonido genérico" << endl;
    }
};

class Perro : public Animal {
public:
    Perro(string n) : Animal(n) {}
    
    void hacer_sonido() override {
        cout << "¡Guau guau!" << endl;
    }
};

int main() {
    Perro p("Rex");
    p.hacer_sonido();       // ¡Guau guau!
    cout << p.nombre << endl;  // Rex
    return 0;
}
```

### Getters y Setters

```cpp
class Cuenta {
private:
    double saldo;
    
public:
    Cuenta() : saldo(0) {}
    
    double obtenerSaldo() const {
        return saldo;
    }
    
    void depositar(double cantidad) {
        if (cantidad > 0) {
            saldo += cantidad;
        }
    }
};
```

---

## Estructuras de Datos

### Arrays

```cpp
int numeros[5] = {1, 2, 3, 4, 5};
cout << numeros[0];         // 1
cout << numeros.size();     // Error - arrays no tienen size()

// Array dinámico
int* arr = new int[10];
delete[] arr;               // Liberar memoria
```

### Vectors (Arrays dinámicos)

```cpp
#include <vector>
using namespace std;

vector<int> numeros;
numeros.push_back(1);
numeros.push_back(2);
numeros.push_back(3);

cout << numeros.size();     // 3
cout << numeros[0];         // 1
cout << numeros.back();     // 3

numeros.pop_back();         // Eliminar último
```

### Punteros

```cpp
int x = 10;
int* ptr = &x;              // Puntero a x

cout << *ptr;               // 10 (desreferenciar)
cout << ptr;                // Dirección de memoria

*ptr = 20;                  // Cambiar x a través del puntero
cout << x;                  // 20
```

### Estructuras

```cpp
struct Punto {
    int x;
    int y;
};

Punto p;
p.x = 10;
p.y = 20;

cout << p.x << ", " << p.y;  // 10, 20
```

---

## Entrada/Salida

### Salida (Output)

```cpp
#include <iostream>
using namespace std;

cout << "Texto";                    // Sin salto de línea
cout << "Texto" << endl;            // Con salto
cout << 42 << " " << 3.14 << endl;  // Múltiples valores
```

### Entrada (Input)

```cpp
int numero;
cout << "Ingresa un número: ";
cin >> numero;

string texto;
cin >> texto;                       // Solo hasta espacio

getline(cin, texto);                // Toda la línea
```

### Formateo

```cpp
#include <iomanip>
using namespace std;

cout << fixed << setprecision(2) << 3.14159 << endl;  // 3.14
cout << setw(10) << 42 << endl;                       // Ancho 10
```

---

## Conceptos Modernos C++17

### Auto

```cpp
auto numero = 42;              // int
auto decimal = 3.14;           // double
auto texto = "Hola";           // const char*
auto v = vector<int>{1,2,3};   // vector<int>
```

### Structured Bindings

```cpp
pair<int, string> resultado = {1, "éxito"};
auto [id, mensaje] = resultado;
cout << id << " " << mensaje << endl;
```

### Optional

```cpp
#include <optional>

optional<int> buscar(vector<int>& v, int valor) {
    for (int i = 0; i < v.size(); i++) {
        if (v[i] == valor) return i;
    }
    return nullopt;
}

if (auto resultado = buscar(v, 42)) {
    cout << "Encontrado en índice " << *resultado << endl;
}
```

---

## 🎓 Siguientes Pasos

1. **Ejemplos:** Abre [ejemplos_basicos.cpp](ejemplos_basicos.cpp)
2. **OOP:** Abre [ejemplos_oop.cpp](ejemplos_oop.cpp)
3. **Referencia:** Consulta [REFERENCIA_RAPIDA.md](REFERENCIA_RAPIDA.md)
4. **Práctica:** Crea tu propio programa

---

**¡Domina estos conceptos y estarás listo para C++ profesional! 🚀**
