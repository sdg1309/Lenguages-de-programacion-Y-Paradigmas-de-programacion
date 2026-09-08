// ========================================
// C++ - EJEMPLOS ORIENTADOS A OBJETOS (OOP)
// ========================================
// Compila con: g++ ejemplos_oop.cpp -o oop
// Ejecuta con: ./oop

#include <iostream>
#include <vector>
#include <string>

using namespace std;

// ========================================
// EJEMPLO 1: CLASE BÁSICA - PERSONA
// ========================================

class Persona {
private:
    int edad;

public:
    string nombre;
    
    // Constructor
    Persona(string n, int e) : nombre(n), edad(e) {}
    
    // Métodos
    void saludar() {
        cout << "Hola, soy " << nombre << " y tengo " << edad << " años" << endl;
    }
    
    int obtenerEdad() {
        return edad;
    }
    
    void cumplirAños() {
        edad++;
        cout << nombre << " cumplió " << edad << " años" << endl;
    }
};

// ========================================
// EJEMPLO 2: HERENCIA - ANIMAL, PERRO, GATO
// ========================================

class Animal {
protected:
    string nombre;
    
public:
    Animal(string n) : nombre(n) {}
    
    virtual void hacer_sonido() {
        cout << "Sonido genérico de animal" << endl;
    }
    
    void presentarse() {
        cout << "Soy " << nombre << endl;
    }
    
    virtual ~Animal() {}  // Destructor virtual
};

class Perro : public Animal {
public:
    Perro(string n) : Animal(n) {}
    
    void hacer_sonido() override {
        cout << nombre << " ladra: ¡Guau guau!" << endl;
    }
    
    void traer() {
        cout << nombre << " está trayendo la pelota" << endl;
    }
};

class Gato : public Animal {
public:
    Gato(string n) : Animal(n) {}
    
    void hacer_sonido() override {
        cout << nombre << " maúlla: ¡Miau!" << endl;
    }
    
    void rasgunar() {
        cout << nombre << " está rasguñando" << endl;
    }
};

// ========================================
// EJEMPLO 3: ENCAPSULACIÓN - CUENTA BANCARIA
// ========================================

class CuentaBancaria {
private:
    double saldo;
    string titular;
    
public:
    CuentaBancaria(string t, double s) : titular(t), saldo(s) {}
    
    double obtenerSaldo() const {
        return saldo;
    }
    
    string obtenerTitular() const {
        return titular;
    }
    
    void depositar(double cantidad) {
        if (cantidad > 0) {
            saldo += cantidad;
            cout << "Depósito de " << cantidad << " completado" << endl;
        } else {
            cout << "Error: Cantidad debe ser positiva" << endl;
        }
    }
    
    void retirar(double cantidad) {
        if (cantidad > saldo) {
            cout << "Error: Saldo insuficiente" << endl;
        } else if (cantidad <= 0) {
            cout << "Error: Cantidad debe ser positiva" << endl;
        } else {
            saldo -= cantidad;
            cout << "Retiro de " << cantidad << " completado" << endl;
        }
    }
    
    void transferir(CuentaBancaria& otra, double cantidad) {
        if (cantidad > saldo) {
            cout << "Error: Saldo insuficiente" << endl;
        } else {
            this->retirar(cantidad);
            otra.depositar(cantidad);
            cout << "Transferencia de " << cantidad << " completada" << endl;
        }
    }
    
    void mostrarInfo() {
        cout << "Titular: " << titular << " | Saldo: $" << saldo << endl;
    }
};

// ========================================
// EJEMPLO 4: POLIMORFISMO
// ========================================

void presentarAnimal(Animal* animal) {
    animal->presentarse();
    animal->hacer_sonido();
}

// ========================================
// MAIN - EJECUCIÓN DE EJEMPLOS
// ========================================

int main() {
    cout << "=====================================" << endl;
    cout << "C++ - EJEMPLOS ORIENTADOS A OBJETOS" << endl;
    cout << "=====================================" << endl << endl;

    // ========================================
    // EJEMPLO 1: CLASE BÁSICA
    // ========================================
    cout << "--- EJEMPLO 1: CLASE BÁSICA ---" << endl;
    Persona p1("Juan", 25);
    Persona p2("María", 30);
    
    p1.saludar();
    p2.saludar();
    
    p1.cumplirAños();
    p1.saludar();
    cout << endl;

    // ========================================
    // EJEMPLO 2: HERENCIA SIMPLE
    // ========================================
    cout << "--- EJEMPLO 2: HERENCIA ---" << endl;
    
    Perro perro("Rex");
    Gato gato("Whiskers");
    
    perro.presentarse();
    perro.hacer_sonido();
    perro.traer();
    cout << endl;
    
    gato.presentarse();
    gato.hacer_sonido();
    gato.rasgunar();
    cout << endl;

    // ========================================
    // EJEMPLO 3: POLIMORFISMO
    // ========================================
    cout << "--- EJEMPLO 3: POLIMORFISMO ---" << endl;
    
    // Array de punteros a Animal
    Animal* animales[] = {&perro, &gato};
    
    for (int i = 0; i < 2; i++) {
        presentarAnimal(animales[i]);
        cout << endl;
    }

    // ========================================
    // EJEMPLO 4: ENCAPSULACIÓN - CUENTA BANCARIA
    // ========================================
    cout << "--- EJEMPLO 4: ENCAPSULACIÓN ---" << endl;
    
    CuentaBancaria cuenta1("Juan", 1000);
    CuentaBancaria cuenta2("María", 500);
    
    cout << "Estado inicial:" << endl;
    cuenta1.mostrarInfo();
    cuenta2.mostrarInfo();
    cout << endl;
    
    cout << "Juan deposita $200:" << endl;
    cuenta1.depositar(200);
    cuenta1.mostrarInfo();
    cout << endl;
    
    cout << "Juan retira $150:" << endl;
    cuenta1.retirar(150);
    cuenta1.mostrarInfo();
    cout << endl;
    
    cout << "Juan transfiere $300 a María:" << endl;
    cuenta1.transferir(cuenta2, 300);
    cout << "Estado final:" << endl;
    cuenta1.mostrarInfo();
    cuenta2.mostrarInfo();
    cout << endl;

    // ========================================
    // EJEMPLO 5: VECTOR DE OBJETOS
    // ========================================
    cout << "--- EJEMPLO 5: VECTOR DE OBJETOS ---" << endl;
    
    vector<Persona> personas;
    personas.push_back(Persona("Ana", 28));
    personas.push_back(Persona("Carlos", 32));
    personas.push_back(Persona("Laura", 26));
    
    cout << "Personas registradas:" << endl;
    for (auto& p : personas) {
        p.saludar();
    }
    cout << endl;

    cout << "=====================================" << endl;
    cout << "FIN DE EJEMPLOS OOP" << endl;
    cout << "=====================================" << endl;

    return 0;
}
