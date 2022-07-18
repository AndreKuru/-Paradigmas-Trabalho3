:- use_module(library(clpfd)).

% :- use_rendering(table).

solucao(9, Answer) :-
    Row1 = [X11, X12, X13, X14, X15, X16, X17, X18, X19],
    Row2 = [X21, X22, X23, X24, X25, X26, X27, X28, X29],
    Row3 = [X31, X32, X33, X34, X35, X36, X37, X38, X39],
    Row4 = [X41, X42, X43, X44, X45, X46, X47, X48, X49],
    Row5 = [X51, X52, X53, X54, X55, X56, X57, X58, X59],
    Row6 = [X61, X62, X63, X64, X65, X66, X67, X68, X69],
    Row7 = [X71, X72, X73, X74, X75, X76, X77, X78, X79],
    Row8 = [X81, X82, X83, X84, X85, X86, X87, X88, X89],
    Row9 = [X91, X92, X93, X94, X95, X96, X97, X98, X99],
    Rows = [Row1, Row2, Row3, Row4, Row5, Row6, Row7, Row8, Row9],
    
    /* certifica-se de que Rows é uma lista de listas
    e de que Elements é a lista resultante da concatenação
    dessas listas, definindo assim o dominio {1,2,3,4,5,6,7,8,9} */
    
    append(Rows, Elements), Elements ins 1..9,
    maplist(all_distinct, Rows),
    
    transpose(Rows, Columns),
    maplist(all_distinct, Columns),
    
    blocks(Row1,Row2,Row3), blocks(Row4,Row5,Row6), blocks(Row7,Row8,Row9),
    
    %seção de operadores (para mudar o puzzle, mudar apenas os operadores aqui)
    X11 #< X12, X12 #> X13,              X14 #< X15, X15 #< X16,              X17 #> X18, X18 #> X19,
    X21 #< X11, X22 #> X12, X23 #> X13,  X24 #< X14, X25 #< X15, X26 #< X16,  X27 #> X17, X28 #< X18, X29 #> X19,
    X21 #< X22, X22 #< X23,              X24 #< X25, X25 #> X26,              X27 #> X28, X28 #< X29,
    X21 #< X31, X22 #< X32, X23 #< X33,  X24 #< X34, X25 #> X35, X26 #> X36,  X27 #> X37, X28 #> X38, X29 #> X39,
    X31 #< X32, X32 #< X33,              X34 #< X35, X35 #> X36,              X37 #> X38, X38 #< X39,
    
    X41 #> X42, X42 #> X43,              X44 #> X45, X45 #< X46,              X47 #< X48, X48 #> X49,
    X51 #< X41, X52 #> X42, X53 #> X43,  X54 #< X44, X55 #< X45, X56 #< X46,  X57 #> X47, X58 #< X48, X59 #> X49,
    X51 #> X52, X52 #< X53,              X54 #> X55, X55 #< X56,              X57 #> X58, X58 #> X59,
    X51 #> X61, X52 #< X62, X53 #< X63,  X54 #< X64, X55 #< X65, X56 #> X66,  X57 #> X67, X58 #> X68, X59 #> X69,
    X61 #< X62, X62 #> X63,              X64 #< X65, X65 #> X66,              X67 #> X68, X68 #< X69,
    
    X71 #< X72, X72 #> X73,              X74 #> X75, X75 #> X76,              X77 #< X78, X78 #> X79,
    X81 #< X71, X82 #< X72, X83 #< X73,  X84 #> X74, X85 #< X75, X86 #< X76,  X87 #> X77, X88 #> X78, X89 #> X79,
    X81 #> X82, X82 #< X83,              X84 #> X85, X85 #< X86,              X87 #< X88, X88 #< X89,
    X81 #< X91, X82 #< X92, X83 #> X93,  X84 #> X94, X85 #> X95, X86 #< X96,  X87 #> X97, X88 #< X98, X89 #> X99,
    X91 #< X92, X92 #> X93,              X94 #< X95, X95 #< X96,              X97 #< X98, X98 #> X99,

  	Answer = Rows.
    
/* verifica as regiões recursivamente,
certificando-se de que não há elementos
repetidos em cada uma delas */

blocks([], [], []).
blocks([A,B,C|Rows1], [D,E,F|Rows2], [G,H,I|Rows3]) :-
    all_distinct([A,B,C,D,E,F,G,H,I]),
    blocks(Rows1, Rows2, Rows3).
