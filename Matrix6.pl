:- use_module(library(clpfd)).

:- use_rendering(table).

solucao(6, Answer) :-
    Row1 = [X11, X12, X13, X14, X15, X16],
    Row2 = [X21, X22, X23, X24, X25, X26],
    Row3 = [X31, X32, X33, X34, X35, X36],
    Row4 = [X41, X42, X43, X44, X45, X46],
    Row5 = [X51, X52, X53, X54, X55, X56],
    Row6 = [X61, X62, X63, X64, X65, X66],
    Rows = [Row1, Row2, Row3, Row4, Row5, Row6],
    
    /* certifica-se de que Rows é uma lista de listas
    e de que Elements é a lista resultante da concatenação
    dessas listas, definindo assim o dominio {1,2,3,4,5,6} */
    
    append(Rows, Elements), Elements ins 1..6,
    maplist(all_distinct, Rows),
  
    transpose(Rows, Columns),
    maplist(all_distinct, Columns),
    
    blocks(Row1,Row2,Row3), blocks(Row4,Row5,Row6),
    
    %seção de operadores (para mudar o puzzle, mudar apenas os operadores aqui)
    X11 #< X12,              X13 #> X14,              X15 #> X16,
    X21 #> X11, X22 #< X12,  X23 #> X13, X24 #> X14,  X25 #> X15, X26 #< X16,
    X21 #> X22,              X23 #> X24,              X25 #> X26,
    X21 #> X31, X22 #> X32,  X23 #> X33, X24 #< X34,  X25 #< X35, X26 #< X36,
    X31 #< X32,              X33 #< X34,              X35 #< X36,
    
    X41 #< X42,              X43 #< X44,              X45 #< X46,
    X51 #> X41, X52 #> X42,  X53 #< X43, X54 #< X44,  X55 #> X45, X56 #< X46,
    X51 #> X52,              X53 #< X54,              X55 #< X56,
    X51 #> X61, X52 #> X62,  X53 #< X63, X54 #< X64,  X55 #< X65, X56 #> X66,
    X61 #> X62,              X63 #< X64,              X65 #> X66,

  	Answer = Rows.

/* verifica as regiões recursivamente,
certificando-se de que não há elementos
repetidos em cada uma delas */

blocks([], [], []).
blocks([A,B|Rows1], [C,D|Rows2], [E,F|Rows3]) :-
    all_distinct([A,B,C,D,E,F]),
    blocks(Rows1, Rows2, Rows3).
