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

% Natūralieji skaičiai yra modeliuojami termais nul, s(nul), s(s(nul)),… Apibrėžkite predikatus:
% 6.1 „skaičius yra dviejų laipsnis.“

% s(nul) = 1
% s(s(nul)) = 2
% s(s(s(s(nul)))) = 4
% s(s(s(s(s(s(s(s(nul)))))))) = 8
% s(s(s(s(s(s(s(s(s(s(nul)))))))))) = 10
% s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(nul)))))))))))))))) = 16

skDviejuLaipsnis(nul) :- false.
skDviejuLaipsnis(s(nul)).
skDviejuLaipsnis(X) :-
    issidalinaIkiDvieju(X, s(s(nul)), Ats),
    skDviejuLaipsnis(Ats).

suma(nul,X,X).
suma(s(X),Y,s(Z)):- suma(X,Y,Z).

issidalinaIkiDvieju(s(s(nul)), s(s(nul)), s(nul)).
issidalinaIkiDvieju(X, s(s(nul)), s(Ats)):- 
    suma(T, s(s(nul)), X),
    issidalinaIkiDvieju(T, s(s(nul)), Ats).
