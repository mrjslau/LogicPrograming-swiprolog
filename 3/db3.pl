% 1.6; 2.4; 3.7; 4.9

% Apibrėžkite paskirtus keturis predikatus pagal nurodytas sąlygas.
% Nors kai kurių užduočių formulavimas yra procedūrinis, reikia siekti,
% kiek įmanoma, deklaratyvios programos.
% Nenaudokite Prolog darbo su sąrašais predikatų.

% 1.6 tr_suma(Sar,Sum) - teisingas, kai duotame sąraše Sar galima rasti
% tris iš eilės einančius skaičius, kurių suma lygi Sum. Pavyzdžiui:
%         ?- tr_suma([1,4,-2,13,6],15).
%         true.
list_atleast_three_items(_, 3).
list_atleast_three_items([_| T], I) :-
  I0 is I + 1,
  list_atleast_three_items(T, I0).

are_next_tr_eq(_, Sum, 3) :-
  Sum == 0.
are_next_tr_eq([H|T], Sum, Count) :-
  Count < 4,
  Sum1 is Sum - H,
  Count1 is Count + 1,
  are_next_tr_eq(T, Sum1, Count1).

tr_suma(Sar, Sum) :-
  list_atleast_three_items(Sar, 0),
  are_next_tr_eq(Sar, Sum, 0), !;
  Sar = [_|T],
  tr_suma(T, Sum).
  
% 2.4 tsuma(S,K) - skaičių sąrašo S teigiamų elementų suma yra K. Pavyzdžiui:
%         ?- tsuma([5,-1,3],K).
%         K = 8.
add_if_pos(H, Rest, Sum) :-
  H > 0 -> Sum is H + Rest;
  Sum is Rest.

tsuma([], 0).
tsuma([H|T], Sum) :-
  tsuma(T, Rest),
  add_if_pos(H, Rest, Sum).

% 3.7 sulieti(S1,S2,R) - duoti išrūšiuoti didėjimo tvarka sąrašai S1 ir S2.
% Sąrašas R gaunamas suliejus šiuos du sąrašus taip, kad jo elementai eitų didėjimo tvarka. Pavyzdžiui:
%         ?- sulieti([1,4,11],[2,5,7],R).
%         R = [1,2,4,5,7,11].
sulieti([],L,L).
sulieti(L,[],L).
sulieti([H1|T1], [H2|T2], L) :- 
    H1 < H2 -> L = [H1|R], sulieti(T1,[H2|T2],R), !;
    H1 > H2 -> L = [H2|R], sulieti([H1|T1],T2,R), !;
    L = [H1,H2|R], sulieti(T1,T2,R), !.

% 4.9 posarasis(S1,S2) - sąrašas S2 susideda iš (gal būt ne visų) sąrašo S1 elementų,
% išdėstytų ta pačia tvarka, kaip ir sąraše S1.
% Kitaip tariant, iš sąrašo S1 išmetus tam tikrus elementus, galime gauti sąrašą S2. Pavyzdžiui:
%         ?- posarasis([1,8,3,5],[1,3]).
%         true.
is_found_in([H], H, []).
is_found_in([H| T], H, T).
is_found_in([_| T], H2, T1) :-
  is_found_in(T, H2, T1).

posarasis(_, []).
posarasis(S1, [H2| T2]) :-
  is_found_in(S1, H2, NT),
  posarasis(NT, T2), !.
