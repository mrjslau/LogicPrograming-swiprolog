:- use_module(library(clpfd)).

problem(1, P) :-
  P =  [[_,_,_,_,_,_,_,_,_],
        [_,_,_,_,_,3,_,8,5],
        [_,_,1,_,2,_,_,_,_],
        [_,_,_,5,_,7,_,_,_],
        [_,_,4,_,_,_,1,_,_],
        [_,9,_,_,_,_,_,_,_],
        [5,_,_,_,_,_,_,7,3],
        [_,_,2,_,1,_,_,_,_],
        [_,_,_,_,4,_,_,_,9]],
        sudoku(P).

problem(2, P) :- 
  P = [[1,_,_,8,_,4,_,_,_],
       [_,2,_,_,_,_,4,5,6],
       [_,_,3,2,_,5,_,_,_],
       [_,_,_,4,_,_,8,_,5],
       [7,8,9,_,5,_,_,_,_],
       [_,_,_,_,_,6,2,_,3],
       [8,_,1,_,_,_,7,_,_],
       [_,_,_,1,2,3,_,8,_],
       [2,_,5,_,_,_,_,_,9]],
  sudoku(P).

problem(3, P) :- 
  P = [[_,_,_,3,_,8,5,6,_],
       [_,_,_,9,_,_,_,_,8],
       [_,3,_,_,4,5,_,1,2],
       [7,_,9,8,_,_,2,4,5],
       [3,8,1,_,_,4,6,9,_],
       [4,_,5,6,7,9,_,3,_],
       [5,1,2,_,_,3,_,8,9],
       [9,_,3,5,_,7,_,_,_],
       [6,7,_,_,9,2,_,5,3]],
       sudoku(P).

sudoku(Puzzle) :-
    % [1,2,3,4,5] vienmaciu masyvu generavimas
    flatten(Puzzle, Array),   
    % Array el. gali buti tik 1,2,3,...,9
    Array ins 1..9,       
    Rows = Puzzle,
    % Pasukame matrica
    transpose(Rows, Columns),     
    % 3x3 bloku gavimas  
    threeOnThree(Rows, Blocks),
    % Eiluciu, stulpeliu, 3x3 blokeliu unikalumas
    maplist(all_distinct, Rows),    
    maplist(all_distinct, Columns), 
    maplist(all_distinct, Blocks),       
    maplist(labeling([ff]), Rows), 
    maplist(portray_clause, Rows).

threeOnThree([A,B,C,D,E,F,G,H,I], Blocks) :-
    threeOnThree(A,B,C,Block1), threeOnThree(D,E,F,Block2), threeOnThree(G,H,I,Block3),
    append([Block1, Block2, Block3], Blocks).

threeOnThree([], [], [], []).
threeOnThree([A,B,C|Bs1],[D,E,F|Bs2],[G,H,I|Bs3], [Block|Blocks]) :-
    Block = [A,B,C,D,E,F,G,H,I],
    threeOnThree(Bs1, Bs2, Bs3, Blocks).


