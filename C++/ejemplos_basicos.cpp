// ========================================
// C++ - 15 EJEMPLOS BÁSICOS
// ========================================
// Compila con: g++ ejemplos_basicos.cpp -o ejemplos
// Ejecuta con: ./ejemplos

#include <iostream>
#include <string>
#include <vector>
#include <cmath>

using namespace std;

int main() {
    cout << "================================" << endl;
    cout << "C++ - 15 EJEMPLOS BÁSICOS" << endl;
    cout << "================================" << endl << endl;

    // ========================================
    // 1. HOLA MUNDO
    // ========================================
    cout << "1. HOLA MUNDO" << endl;
    cout << "Hola Mundo desde C++" << endl << endl;

    // ========================================
    // 2. VARIABLES Y TIPOS
    // ========================================
    cout << "2. VARIABLES Y TIPOS" << endl;
    int numero = 42;
    double decimal = 3.14;
    string texto = "Smalltalk";
    bool verdadero = true;
    
    cout << "Entero: " << numero << endl;
    cout << "Decimal: " << decimal << endl;
    cout << "Texto: " << texto << endl;
    cout << "Booleano: " << (verdadero ? "true" : "false") << endl << endl;

    // ========================================
    // 3. OPERACIONES MATEMÁTICAS
    // ========================================
    cout << "3. OPERACIONES MATEMÁTICAS" << endl;
    cout << "10 + 5 = " << (10 + 5) << endl;
    cout << "10 - 3 = " << (10 - 3) << endl;
    cout << "4 * 7 = " << (4 * 7) << endl;
    cout << "20 / 4 = " << (20 / 4) << endl;
    cout << "17 % 5 = " << (17 % 5) << endl;
    cout << "2^3 = " << pow(2, 3) << endl << endl;

    // ========================================
    // 4. STRINGS (CADENAS)
    // ========================================
    cout << "4. STRINGS (CADENAS)" << endl;
    string s1 = "Hola";
    string s2 = "Mundo";
    string concatenado = s1 + " " + s2;
    cout << "Concatenación: " << concatenado << endl;
    cout << "Largo: " << concatenado.length() << endl;
    cout << "Primera letra: " << concatenado[0] << endl << endl;

    // ========================================
    // 5. ENTRADA/SALIDA
    // ========================================
    cout << "5. ENTRADA/SALIDA" << endl;
    cout << "Ingresa un número: ";
    int entrada;
    cin >> entrada;
    cout << "Ingresaste: " << entrada << endl << endl;

    // ========================================
    // 6. IF-ELSE
    // ========================================
    cout << "6. IF-ELSE" << endl;
    int edad = 25;
    if (edad >= 18) {
        cout << "Eres mayor de edad" << endl;
    } else {
        cout << "Eres menor de edad" << endl;
    }
    cout << endl;

    // ========================================
    // 7. SWITCH
    // ========================================
    cout << "7. SWITCH" << endl;
    int dia = 3;
    switch (dia) {
        case 1: cout << "Lunes"; break;
        case 2: cout << "Martes"; break;
        case 3: cout << "Miércoles"; break;
        default: cout << "Otro día";
    }
    cout << endl << endl;

    // ========================================
    // 8. FOR LOOP
    // ========================================
    cout << "8. FOR LOOP (Imprime 1-5)" << endl;
    for (int i = 1; i <= 5; i++) {
        cout << i << " ";
    }
    cout << endl << endl;

    // ========================================
    // 9. WHILE LOOP
    // ========================================
    cout << "9. WHILE LOOP (Imprime 1-5)" << endl;
    int contador = 1;
    while (contador <= 5) {
        cout << contador << " ";
        contador++;
    }
    cout << endl << endl;

    // ========================================
    // 10. ARRAYS
    // ========================================
    cout << "10. ARRAYS" << endl;
    int arr[] = {10, 20, 30, 40, 50};
    cout << "Array: ";
    for (int i = 0; i < 5; i++) {
        cout << arr[i] << " ";
    }
    cout << "\nPrimer elemento: " << arr[0] << endl;
    cout << "Tercer elemento: " << arr[2] << endl << endl;

    // ========================================
    // 11. VECTORS
    // ========================================
    cout << "11. VECTORS (Arrays dinámicos)" << endl;
    vector<int> numeros;
    numeros.push_back(1);
    numeros.push_back(2);
    numeros.push_back(3);
    numeros.push_back(4);
    numeros.push_back(5);
    
    cout << "Vector: ";
    for (int num : numeros) {
        cout << num << " ";
    }
    cout << "\nTamaño: " << numeros.size() << endl;
    cout << "Último elemento: " << numeros.back() << endl << endl;

    // ========================================
    // 12. FUNCIONES
    // ========================================
    cout << "12. FUNCIONES" << endl;
    
    auto sumar = [](int a, int b) { return a + b; };
    auto multiplicar = [](int a, int b) { return a * b; };
    
    cout << "5 + 3 = " << sumar(5, 3) << endl;
    cout << "5 * 3 = " << multiplicar(5, 3) << endl << endl;

    // ========================================
    // 13. COMPARACIONES
    // ========================================
    cout << "13. COMPARACIONES" << endl;
    int x = 10;
    int y = 5;
    
    cout << (x > y ? "10 > 5: true" : "10 > 5: false") << endl;
    cout << (x < y ? "10 < 5: true" : "10 < 5: false") << endl;
    cout << (x == y ? "10 == 5: true" : "10 == 5: false") << endl << endl;

    // ========================================
    // 14. PUNTEROS
    // ========================================
    cout << "14. PUNTEROS" << endl;
    int valor = 42;
    int* puntero = &valor;
    
    cout << "Valor: " << valor << endl;
    cout << "Dirección: " << puntero << endl;
    cout << "Desreferenciado: " << *puntero << endl;
    *puntero = 100;
    cout << "Valor después de cambiar: " << valor << endl << endl;

    // ========================================
    // 15. RANGO FOR (C++11)
    // ========================================
    cout << "15. RANGO FOR (Itera sobre vector)" << endl;
    vector<string> lenguajes = {"C++", "Java", "Python", "Rust"};
    for (const auto& lang : lenguajes) {
        cout << lang << " ";
    }
    cout << endl << endl;

    cout << "================================" << endl;
    cout << "FIN DE EJEMPLOS" << endl;
    cout << "================================" << endl;

    return 0;
}
