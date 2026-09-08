:- initialization(main, main).

default_file('curva_binaria_P4.pbm').

% skip_header/2 removes whitespace and comments without touching binary data.
skip_header([C|Cs], Rest) :-
    memberchk(C, [9,10,13,32]), !,
    skip_header(Cs, Rest).
skip_header([35|Cs], Rest) :- !,
    skip_comment(Cs, AfterComment),
    skip_header(AfterComment, Rest).
skip_header(Bytes, Bytes).

drop_data_separator([C|Cs], Cs) :- memberchk(C, [9,10,13,32]), !.
drop_data_separator(Bytes, Bytes).

skip_comment([], []).
skip_comment([10|Cs], Cs) :- !.
skip_comment([_|Cs], Rest) :- skip_comment(Cs, Rest).

token(Bytes, Token, Rest) :-
    skip_header(Bytes, Content),
    take_token(Content, Token, Rest).

take_token([], [], []).
take_token([C|Cs], [], [C|Cs]) :- memberchk(C, [9,10,13,32,35]), !.
take_token([C|Cs], [C|Token], Rest) :- take_token(Cs, Token, Rest).

decimal(Codes, Number) :- number_codes(Number, Codes).

read_pbm(File, image(Width, Height, RowBytes, Data)) :-
    read_file_to_codes(File, Bytes, []),
    token(Bytes, [80,52], AfterMagic),
    token(AfterMagic, WidthCodes, AfterWidth),
    token(AfterWidth, HeightCodes, AfterHeight),
    drop_data_separator(AfterHeight, Data),
    decimal(WidthCodes, Width),
    decimal(HeightCodes, Height),
    RowBytes is (Width + 7) // 8,
    Expected is RowBytes * Height,
    length(Data, Expected).

pixel(image(Width, Height, RowBytes, Data), X, Y, black) :-
    MaxX is Width - 1,
    MaxY is Height - 1,
    between(0, MaxX, X),
    between(0, MaxY, Y),
    ByteIndex is Y * RowBytes + X // 8,
    nth0(ByteIndex, Data, Byte),
    Shift is 7 - X mod 8,
    Bit is (Byte >> Shift) /\ 1,
    Bit =:= 1, !.
pixel(image(Width, Height, _, _), X, Y, white) :-
    MaxX is Width - 1,
    MaxY is Height - 1,
    between(0, MaxX, X),
    between(0, MaxY, Y).

% f/3 is the central relation: Height is the consecutive black run from below.
f(X, image(Width, Height, RowBytes, Data), Value) :-
    image(Width, Height, RowBytes, Data) = image(_, _, _, _),
    Bottom is Height - 1,
    consecutive_black(X, Bottom, image(Width, Height, RowBytes, Data), Value).

consecutive_black(_, Y, _, 0) :- Y < 0, !.
consecutive_black(X, Y, Image, 0) :- pixel(Image, X, Y, white), !.
consecutive_black(X, Y, Image, Height) :-
    pixel(Image, X, Y, black),
    Previous is Y - 1,
    consecutive_black(X, Previous, Image, Rest),
    Height is Rest + 1.

heights(Image, Values) :-
    Image = image(Width, _, _, _),
    MaxX is Width - 1,
    findall(Value, (between(0, MaxX, X), f(X, Image, Value)), Values).

area(Heights, Area) :- sum_list(Heights, Area).

range(Size, Index, Count, Start, End) :-
    Start is Index * Size // Count,
    End is ((Index + 1) * Size // Count) - 1.

block_has_black(Image, X0, X1, Y0, Y1) :-
    between(X0, X1, X),
    between(Y0, Y1, Y),
    pixel(Image, X, Y, black), !.

render_image(Image) :-
    Image = image(Width, Height, _, _),
    format('Curva PBM (muestreo por bloques: 96 x 32):~n', []),
    between(0, 31, OutputY),
    range(Height, OutputY, 32, Y0, Y1),
    forall(between(0, 95, OutputX),
           (range(Width, OutputX, 96, X0, X1),
            (block_has_black(Image, X0, X1, Y0, Y1) -> write('#') ; write(' '))),
    nl.

group_maximum(Heights, Index, Maximum) :-
    length(Heights, Size),
    range(Size, Index, 96, Start, End),
    Count is End - Start + 1,
    drop(Start, Heights, Tail),
    take(Count, Tail, Group),
    max_list(Group, Maximum).

drop(0, List, List) :- !.
drop(N, [_|Rest], Result) :- N > 0, Next is N - 1, drop(Next, Rest, Result).

take(0, _, []) :- !.
take(N, [X|Xs], [X|Ys]) :- N > 0, Next is N - 1, take(Next, Xs, Ys).

render_heights(Heights) :-
    findall(Maximum, (between(0, 95, Index), group_maximum(Heights, Index, Maximum)), Reduced),
    max_list(Heights, GlobalMaximum),
    format('Funcion de alturas M (96 grupos, 16 niveles):~n', []),
    forall(between(1, 16, ReverseLevel),
           (Level is 17 - ReverseLevel,
            forall(member(Height, Reduced),
                   (Height * 16 // max(1, GlobalMaximum) >= Level -> write('#') ; write(' '))),
            nl)).

sample_positions(Heights, Positions) :-
    length(Heights, Size), Last is Size - 1,
    findall(X, (between(0, 9, I), X is I * Last // 9), Positions).

show_samples(_, []).
show_samples(Heights, [X|Xs]) :-
    nth0(X, Heights, Value),
    format('x_~d -> f(~d) = ~d pixels~n', [X, X, Value]),
    show_samples(Heights, Xs).

main(Argv) :-
    ( Argv = [File] -> true ; default_file(File) ),
    read_pbm(File, Image),
    Image = image(Width, Height, RowBytes, _),
    heights(Image, Heights),
    area(Heights, Area),
    format('PBM P4: ~d x ~d; bytes per row: ~d~n', [Width, Height, RowBytes]),
    render_image(Image),
    render_heights(Heights),
    sample_positions(Heights, Positions),
    format('Muestras distribuidas:~n', []),
    show_samples(Heights, Positions),
    length(Heights, Size),
    format('M tiene ~d alturas.~n', [Size]),
    format('Area = sum_list(M) = ~d square pixels (Delta x = 1).~n', [Area]).