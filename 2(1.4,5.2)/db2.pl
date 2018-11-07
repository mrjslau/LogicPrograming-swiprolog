kelias(vilnius, minskas, 50).
kelias(vilnius, klaipeda, 295).
kelias(vilnius, kaunas, 90).
kelias(vilnius, siauliai, 185).
kelias(panevezys, vilnius, 79).
kelias(panevezys, ryga, 111).
kelias(klaipeda, kaunas, 198).
kelias(klaipeda, palanga, 22).
kelias(klaipeda, siauliai, 58).
kelias(kaunas, siauliai, 85).
kelias(kaunas, panevezys, 72).
kelias(palanga, liepoja, 105).
kelias(palanga, ryga, 211).
kelias(siauliai, palanga, 91).
kelias(siauliai, panevezys, 65).
kelias(liepoja, ryga, 65).
kelias(ryga, siauliai, 146).
kelias(minskas, kijevas, 422).

% 1.4 galima nuvažiuoti iš miesto X į miestą Y nevažiuojant tokiu keliu, kurio ilgis viršija L kilometrų.

galima_nuvaziuoti(Miestas1, Miestas2, Salyga) :- 
    kelias(Miestas1, Miestas2, Atstumas), Salyga > Atstumas.
galima_nuvaziuoti(Miestas1, Miestas2, Salyga) :-
    kelias(Miestas1, MiestasTarp, Atstumas), Salyga > Atstumas,
    galima_nuvaziuoti(MiestasTarp, Miestas2, Salyga).

% 5.1 dalyba (div). naudojant tik sudėties ir atimties operacijas:

div(0, _Y, 0).
div(X, Y, R) :-
    X < 0,
    Y < 0,
    X0 is X - Y,
    div(X0, Y, R0),
    R is R0+1.
div(X, Y, R) :-
    X > 0,
    Y > 0,
    X0 is X - Y,
    div(X0, Y, R0),
    R is R0+1.
div(X, Y, R) :-
    X > 0,
    Y < 0,
    X0 is X + Y,
    div(X0, Y, R0),
    R is R0-1.
div(X, Y, R) :-
    X < 0,
    Y > 0,
    X0 is X + Y,
    div(X0, Y, R0),
    R is R0-1.
