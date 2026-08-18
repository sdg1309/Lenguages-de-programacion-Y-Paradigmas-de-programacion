% ========================================
% EJEMPLO BÁSICO DE PROLOG
% ========================================

% HECHOS - Base de datos sobre animales
animal(perro).
animal(gato).
animal(pajaro).
animal(pez).

% Propiedades de animales
volador(pajaro).
nadador(pez).
domestico(perro).
domestico(gato).

% HECHOS - Relaciones familiares
padre(juan, maria).
padre(juan, carlos).
padre(maria, ana).
madre(sofia, maria).
madre(sofia, carlos).
madre(rosa, ana).

% REGLAS
% Un abuelo es padre del padre
abuelo(X, Z) :- padre(X, Y), padre(Y, Z).

% Hermano - comparten padre
hermano(X, Y) :- 
    padre(P, X), 
    padre(P, Y), 
    X \= Y.

% Progenitor puede ser padre o madre
progenitor(X, Y) :- padre(X, Y).
progenitor(X, Y) :- madre(X, Y).

% Un nieto es hijo de un hijo
nieto(X, Y) :- padre(Y, Z), padre(Z, X).
nieto(X, Y) :- padre(Y, Z), madre(Z, X).

% Los animales voladores y nadadores son acuáticos o aéreos
tipo_animal(X, acuatico) :- nadador(X).
tipo_animal(X, aereo) :- volador(X).

% ========================================
% Ejemplos de consultas para probar:
% ========================================
% ?- animal(X).
% ?- volador(X).
% ?- padre(juan, X).
% ?- abuelo(juan, X).
% ?- hermano(maria, carlos).
% ?- progenitor(X, ana).
% ?- nieto(ana, juan).
% ?- tipo_animal(pajaro, X).
