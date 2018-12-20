:- use_module(library(clpfd)).

case(5, C) :-
  C =  [[_,_,_,_,_,_,_,_,_],
        [_,_,_,_,_,_,_,_,_],
        [_,_,_,_,_,_,_,_,_],
        [_,_,_,_,_,_,_,_,_],
        [_,_,_,_,_,_,_,_,_],
        [_,_,_,_,_,_,_,_,_],
        [_,_,_,_,_,_,_,_,_],
        [_,_,_,_,_,_,_,_,_],
        [_,_,_,_,_,_,_,_,_]],
        sudoku(C).


case(1, C) :-
  C =  [[_,_,_,_,_,_,_,_,_],
        [_,_,_,_,_,3,_,8,5],
        [_,_,1,_,2,_,_,_,_],
        [_,_,_,5,_,7,_,_,_],
        [_,_,4,_,_,_,1,_,_],
        [_,9,_,_,_,_,_,_,_],
        [5,_,_,_,_,_,_,7,3],
        [_,_,2,_,1,_,_,_,_],
        [_,_,_,_,4,_,_,_,9]],
        sudoku(C).

case(2, C) :-
  C = [[2,_,_,_,9,_,_,_,1],
      [3,_,9,_,_,7,_,_,_],
      [_,_,1,_,4,_,_,7,_],
      [_,6,_,_,_,_,_,_,_],
      [_,_,_,_,_,3,_,_,_],
      [_,_,8,6,_,_,7,9,_],
      [6,_,_,7,_,_,8,_,_],
      [1,2,3,_,_,8,_,_,_],
      [_,8,7,_,_,4,3,_,_]],
      sudoku(C).

case(3, C) :- 
  C = [[_,_,_,3,_,8,5,6,_],
       [_,_,_,9,_,_,_,_,8],
       [_,3,_,_,4,5,_,1,2],
       [7,_,9,8,_,_,2,4,5],
       [3,8,1,_,_,4,6,9,_],
       [4,_,5,6,7,9,_,3,_],
       [5,1,2,_,_,3,_,8,9],
       [9,_,3,5,_,7,_,_,_],
       [6,7,_,_,9,2,_,5,3]],
       sudoku(C).

threeOnThree([A,B,C,D,E,F,G,H,I], Blocks) :-
    threeOnThree(A,B,C,Bl1), threeOnThree(D,E,F,Bl2), threeOnThree(G,H,I,Bl3),
    append([Bl1, Bl2, Bl3], Blocks).
    
threeOnThree([], [], [], []).
threeOnThree([A,B,C|T1],[D,E,F|T2],[G,H,I|T3], [Block|Blocks]) :-
    Block = [A,B,C,D,E,F,G,H,I],
    threeOnThree(T1, T2, T3, Blocks).      

sudoku(Case) :-
    % [1,2,3,4,5] vienmaciu masyvu generavimas
    flatten(Case, Array),   
    % Array el. gali buti tik 1,2,3,...,9
    Array ins 1..9,       
    Rows = Case,
    % Pasukame matrica
    transpose(Rows, Cols),     
    % 3x3 bloku gavimas  
    threeOnThree(Rows, Blocks),
    % Eiluciu, stulpeliu, 3x3 blokeliu unikalumas
    maplist(all_distinct, Rows),    
    maplist(all_distinct, Cols), 
    maplist(all_distinct, Blocks),       
    maplist(labeling([ff]), Rows), 
    maplist(portray_clause, Rows).



