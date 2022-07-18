:- use_module(library(clpfd)).

:- use_rendering(table).

solucao(4, Answer) :-
    
    Row1 = [X11, X12, X13, X14],
    Row2 = [X21, X22, X23, X24],
    Row3 = [X31, X32, X33, X34],
    Row4 = [X41, X42, X43, X44],
    Rows = [Row1, Row2, Row3, Row4],
    
    /* certifica-se de que Rows é uma lista de listas
    e de que Elements é a lista resultante da concatenação
    dessas listas, definindo assim o dominio {1,2,3,4} */
    
    append(Rows, Elements), Elements ins 1..4,
    maplist(all_distinct, Rows),
  
    transpose(Rows, Columns),
    maplist(all_distinct, Columns),
    
    blocks(Row1,Row2), blocks(Row3,Row4),
    
    %seção de operadores (para mudar o puzzle, mudar apenas os operadores aqui)
    X11 #< X12,              X13 #< X14,
    X21 #< X11, X22 #> X12,  X23 #> X13, X24 #< X14,
    X21 #< X22,              X23 #> X24,
    
    X31 #> X32,              X33 #< X34,
    X41 #< X31, X42 #> X32,  X43 #> X33, X44 #< X34,
    X41 #> X42,              X43 #> X44,

  	Answer = Rows.

/* verifica as regiões recursivamente,
certificando-se de que não há elementos
repetidos em cada uma delas */

blocks([], []).
blocks([A,B|Rows1], [C,D|Rows2]) :-
    all_distinct([A,B,C,D]),
    blocks(Rows1, Rows2).
