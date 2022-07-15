:- use_module(library(clpfd)).

:- use_rendering(table).

solucao(4, Answer) :-
    Row1 = [X11, X12, X13, X14],
    Row2 = [X21, X22, X23, X24],
    Row3 = [X31, X32, X33, X34],
    Row4 = [X41, X42, X43, X44],
    Row1 ins 1..4,
    Row2 ins 1..4,
    Row3 ins 1..4,
    Row4 ins 1..4,
    Rows = [Row1, Row2, Row3, Row4],
    maplist(all_distinct, Rows),
  
    transpose(Rows, Columns),
    maplist(all_distinct, Columns),
    
    all_distinct([X11,X12,X21,X22]),
    all_distinct([X13,X14,X23,X24]),
    all_distinct([X31,X32,X41,X42]),
    all_distinct([X33,X34,X43,X44]),
    
    %seção de operadores (para mudar o puzzle, mudar apenas os operadores aqui)
    X11 #< X12,              X13 #< X14,
    X21 #< X11, X22 #> X12,  X23 #> X13, X24 #< X14,
    X21 #< X22,              X23 #> X24,
    
    X31 #> X32,              X33 #< X34,
    X41 #< X31, X42 #> X32,  X43 #> X33, X44 #< X34,
    X41 #> X42,              X43 #> X44,

  	Answer = Rows.

solucao(6, Answer) :-
    Row1 = [X11, X12, X13, X14, X15, X16],
    Row2 = [X21, X22, X23, X24, X25, X26],
    Row3 = [X31, X32, X33, X34, X35, X36],
    Row4 = [X41, X42, X43, X44, X45, X46],
    Row5 = [X51, X52, X53, X54, X55, X56],
    Row6 = [X61, X62, X63, X64, X65, X66],
    Row1 ins 1..6,
    Row2 ins 1..6,
    Row3 ins 1..6,
    Row4 ins 1..6,
    Row5 ins 1..6,
    Row6 ins 1..6,
    Rows = [Row1, Row2, Row3, Row4, Row5, Row6],
    maplist(all_distinct, Rows),
  
    transpose(Rows, Columns),
    maplist(all_distinct, Columns),
    
    all_distinct([X11,X12,X21,X22,X31,X32]),
    all_distinct([X13,X14,X23,X24,X33,X34]),
    all_distinct([X15,X16,X25,X26,X35,X36]),
    all_distinct([X41,X42,X51,X52,X61,X62]),
    all_distinct([X43,X44,X53,X54,X63,X64]),
    all_distinct([X45,X46,X55,X56,X65,X66]),
    
    %seção de operadores (para mudar o puzzle, mudar apenas os operadores aqui)
    X11 #> X12,              X13 #< X14,              X15 #> X16,
    X21 #> X11, X22 #> X12,  X23 #< X13, X24 #< X14,  X25 #< X15, X26 #> X16,
    X21 #< X22,              X23 #< X24,              X25 #< X26,
    X21 #> X31, X22 #> X32,  X23 #< X33, X24 #< X34,  X25 #< X35, X26 #< X36,
    X31 #> X32,              X33 #> X34,              X35 #< X36,
    
    X41 #> X42,              X43 #< X44,              X45 #< X46,
    X51 #< X41, X52 #> X42,  X53 #> X43, X54 #< X44,  X55 #> X45, X56 #> X46,
    X51 #< X52,              X53 #> X54,              X55 #> X56,
    X51 #< X61, X52 #> X62,  X53 #< X63, X54 #> X64,  X55 #> X65, X56 #< X66,
    X61 #> X62,              X63 #> X64,              X65 #< X66,

  	Answer = Rows.

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
    Row1 ins 1..9,
    Row2 ins 1..9,
    Row3 ins 1..9,
    Row4 ins 1..9,
    Row5 ins 1..9,
    Row6 ins 1..9,
    Row7 ins 1..9,
    Row8 ins 1..9,
    Row9 ins 1..9,
    Rows = [Row1, Row2, Row3, Row4, Row5, Row6, Row7, Row8, Row9],
    maplist(all_distinct, Rows),
    
    transpose(Rows, Columns),
    maplist(all_distinct, Columns),
    
    all_distinct([X11,X12,X13,X21,X22,X23,X31,X32,X33]),
    all_distinct([X14,X15,X16,X24,X25,X26,X34,X35,X36]),
    all_distinct([X17,X18,X19,X27,X28,X29,X37,X38,X39]),
    all_distinct([X41,X42,X43,X51,X52,X53,X61,X62,X63]),
    all_distinct([X44,X45,X46,X54,X55,X56,X64,X65,X66]),
    all_distinct([X47,X48,X49,X57,X58,X59,X67,X68,X69]),
    all_distinct([X71,X72,X73,X81,X82,X83,X91,X92,X93]),
    all_distinct([X74,X75,X76,X84,X85,X86,X94,X95,X96]),
    all_distinct([X77,X78,X79,X87,X88,X89,X97,X98,X99]),
    
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