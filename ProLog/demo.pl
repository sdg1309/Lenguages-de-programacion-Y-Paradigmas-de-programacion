% Archivo de demostración con consultas
:- initialization(main).

main :-
    write('=========================================='), nl,
    write('  PRUEBAS DE PROLOG'), nl,
    write('=========================================='), nl, nl,
    
    write('1. ¿Cuáles son los animales?'), nl,
    forall(animal(X), (write('   - '), write(X), nl)),
    nl,
    
    write('2. ¿Qué animales vuelan?'), nl,
    forall(volador(X), (write('   - '), write(X), nl)),
    nl,
    
    write('3. ¿De quién es hijo maria?'), nl,
    forall(padre(X, maria), (write('   - Padre de maria: '), write(X), nl)),
    nl,
    
    write('4. ¿Quiénes son abuelos de ana?'), nl,
    forall(abuelo(X, ana), (write('   - Abuelo de ana: '), write(X), nl)),
    nl,
    
    write('5. ¿Hermanos de maria?'), nl,
    forall(hermano(maria, X), (write('   - Hermano de maria: '), write(X), nl)),
    nl,
    
    write('=========================================='), nl,
    write('  ✅ PROLOG FUNCIONA CORRECTAMENTE'), nl,
    write('=========================================='), nl,
    
    halt.

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
