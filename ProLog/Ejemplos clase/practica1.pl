
padre(abraham, isaac).
padre(isaac, jacob).
padre(jacob, judas).
padre(judas, perez).
padre(perez, hezron).
padre(hezron, aram).
padre(aram, aminadab).
padre(aminadab, naason).
padre(naason, salmon).
padre(salmon, booz).
padre(booz, obed).
padre(obed, isa).
padre(isa, david).

% De David a José (continuación Mateo 1)
padre(david, salomon).
padre(salomon, roboam).
padre(roboam, abiam).
padre(abiam, asa).
padre(asa, josafat).
padre(josafat, joram).
padre(joram, ozias).
padre(ozias, joatan).
padre(joatan, acaz).
padre(acaz, ezequias).
padre(ezequias, manases).
padre(manases, amon).
padre(amon, josias).
padre(josias, jeconias).
padre(jeconias, salatiel).
padre(salatiel, zorobabel).
padre(zorobabel, abiud).
padre(abiud, eliacim).
padre(eliacim, azor).
padre(azor, sadoc).
padre(sadoc, aquim).
padre(aquim, eliud).
padre(eliud, eleazar).
padre(eleazar, matan).
padre(matan, jacob).
padre(jacob, jose).

% María y Joaquín (Ana es madre de María - Lucas 1:39)
padre(joaquin, maria).
madre(ana, maria).

% Jesús
padre(jose, jesus).
madre(maria, jesus).

% Hermanos de Jesús (Marcos 6:3)
padre(jose, jacobo).
padre(jose, jose_menor).
padre(jose, simon).
padre(jose, judas_menor).
madre(maria, jacobo).
madre(maria, jose_menor).
madre(maria, simon).
madre(maria, judas_menor).

% Hermanas de Jesús (no especificadas por nombre en Marcos 6:3)
padre(jose, hermana_1).
padre(jose, hermana_2).
madre(maria, hermana_1).
madre(maria, hermana_2).

% ========================================
% HECHOS: RELACIONES ESPOSOS
% ========================================
esposo(jose, maria).
esposo(maria, jose).

% Isabel es prima de María (Lucas 1:39)
% Zacarías es esposo de Isabel
esposo(zacarias, isabel).
esposo(isabel, zacarias).

% ========================================
% REGLAS: RELACIONES DERIVADAS
% ========================================

% ABUELOS
abuelo(X, Z) :- padre(X, Y), padre(Y, Z).

% ABUELAS
abuela(X, Z) :- madre(X, Y), padre(Y, Z).
abuela(X, Z) :- madre(X, Y), madre(Y, Z).

% BISABUELOS (padre del abuelo)
bisabuelo(X, Z) :- padre(X, Y), abuelo(Y, Z).

% BISABUELAS
bisabuela(X, Z) :- madre(X, Y), abuelo(Y, Z).
bisabuela(X, Z) :- madre(X, Y), abuela(Y, Z).

% TATARABUELOS
tatarabuelo(X, Z) :- padre(X, Y), bisabuelo(Y, Z).

% TATARABUELAS
tatarabuela(X, Z) :- madre(X, Y), bisabuelo(Y, Z).
tatarabuela(X, Z) :- madre(X, Y), bisabuela(Y, Z).

% HERMANOS
hermano(X, Y) :- padre(P, X), padre(P, Y), X \= Y.
hermano(X, Y) :- madre(M, X), madre(M, Y), X \= Y.

% HERMANAS
hermana(X, Y) :- padre(P, X), padre(P, Y), X \= Y.
hermana(X, Y) :- madre(M, X), madre(M, Y), X \= Y.

% TÍOS (hermanos del padre)
tio(X, Z) :- hermano(X, Y), padre(Y, Z).

% TÍAS (hermanas del padre o esposas de tíos)
tia(X, Z) :- hermana(X, Y), padre(Y, Z).
tia(X, Z) :- esposo(Y, X), tio(Y, Z).

% PROGENITOR (padre o madre)
progenitor(X, Y) :- padre(X, Y).
progenitor(X, Y) :- madre(X, Y).

% PAREJA
pareja(X, Y) :- esposo(X, Y).

% PRIMA (hermana del padre)
prima(X, Z) :- hermana(X, Y), padre(Y, Z).