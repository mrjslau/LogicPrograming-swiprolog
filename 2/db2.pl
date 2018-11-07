studentas(marijus, 4).
studentas(teodoras, 4).
studentas(augustinas, 4).
studentas(lukas, 4).
studentas(egle, 4).
studentas(laura, 4).
studentas(mykolas, 3).
studentas(migle, 3).
studentas(laurynas, 3).
studentas(adomas, 2).
studentas(kristupas, 2).
% 4k.
yraVyresnis(marijus, teodoras).
yraVyresnis(teodoras, augustinas).
yraVyresnis(lukas, marijus).
yraVyresnis(egle, marijus).
yraVyresnis(laura, egle).
% 3k.
yraVyresnis(mykolas, migle).
yraVyresnis(migle, laurynas).
% 2k.
yraVyresnis(adomas, kristupas).
% mix
yraVyresnis(marijus, mykolas).
yraVyresnis(laurynas, adomas).

% 2.2 studentas A yra jaunesnis už to paties kurso studentą B

yraJaunesnis(StudA, StudB) :-
    yraVyresnis(StudB, StudA).
yraJaunesnis(StudA, StudB) :-
    yraVyresnis(StudB, StudZ),
    yraJaunesnis(StudA, StudZ).
yraJaunesnisToPacioKurso(StudA, StudB) :-
    studentas(StudA, K1),
    studentas(StudB, K2),
    K1 = K2,
    yraJaunesnis(StudA, StudB).
% 5.1 dalyba (div). naudojant tik sudėties ir atimties operacijas:

%div(0, _Y, 0).
%div(X, Y, R) :-
%    X < 0,
%    Y < 0,
%    X0 is X - Y,
%    div(X0, Y, R0),
%    R is R0+1.
%div(X, Y, R) :-
%    X > 0,
%    X0 is X - Y,
%    div(X0, Y, R0),
%    R is R0+1.
%div(X, Y, R) :-
%    X < 0,
%    X0 is X + Y,
%    div(X0, Y, R0),
%    R is R0-1.
