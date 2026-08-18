parent(fred,sophusw). parent(fred,lawren).
parent(fred,kenny). parent(fred,esther).
parent(inger,sophusw). parent(johnhs,fred).
parent(mads,johnhs). parent(lars,johan).
parent(johan,sophus). parent(lars,mads).
parent(sophusw,gary). parent(sophusw,john).
parent(sophusw,bruce). parent(gary,kent).
parent(gary,stephen). parent(gary,anne).
parent(john,michael). parent(john,michelle).
parent(addie,gary). parent(gerry,kent).
male(gary). male(fred).
male(sophus). male(lawrence).
male(kenny). male(esther). 
male(johnhs). male(mads).
male(lars). male(john).
male(bruce). male(johan).
male(sophusw). male(kent).
male(stephen). female(inger).
female(anne). female(michelle).
female(gerry). female(addie).
father(X,Y):-parent(X,Y), male(X).
mother(X,Y):-parent(X,Y), female(X).
hermano(X,Y):-parent(Z,Y),parent(Z,X),male(X).
sister(X,Y):-parent(Z,Y),parent(Z,X),female(X).
tio(X,Y):-hermano(X,Z),parent(Z,Y),male(X).
hijo(X,Y):-parent(Y,X),male(X).
hija(X,Y):-parent(Y,X),female(X).
abuelo(X,Y):-father(X,Z),parent(Z,Y).
esposo(X,Y):-father(X,Z),mother(Y,Z),male(X).
cunado(X,Y):-esposo(X,Z), hermano(Z,Y) ;sister(Z,Y).