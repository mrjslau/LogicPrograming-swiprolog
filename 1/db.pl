asmuo(marijus, vyras, 21, futbolas).
asmuo(darius, vyras, 47, futbolas).
asmuo(vinifrida, moteris, 43, mada).
asmuo(aiva, moteris, 45, medicina).
asmuo(lina, moteris, 38, sunys).
asmuo(laimis, vyras, 33, futbolas).
asmuo(renatas, vyras, 34, krepsinis).
asmuo(edvardas, vyras, 70, rukymas).
asmuo(dalia, moteris, 65, alus).
asmuo(bronislava, moteris, 65, darzas).
asmuo(bronius, vyras, 100, rukymas).
asmuo(audrius, vyras, 40, automobiliai).
asmuo(linaRe, moteris, 21, vaikai).
asmuo(viktorija, moteris, 10, zaislai).
asmuo(gerda, moteris, 9, zaislai).
asmuo(greta, moteris, 8, zaislai).
asmuo(matas, vyras, 7, zaislai).

mama(vinifrida, marijus).
mama(dalia, darius).
mama(dalia, aiva).
mama(dalia, lina).
mama(dalia, laimis).
mama(dalia, renatas).
mama(bronislava, edvardas).
mama(lina, viktorija).
mama(lina, gerda).
mama(lina, greta).
mama(linaRe, matas).

pora(darius, vinifrida).
pora(edvardas, dalia).
pora(bronius, bronislava).
pora(audrius, lina).
pora(renatas, linaRe).

%  5.  vaikas(Vaikas, TevasMama) - Pirmasis asmuo (Vaikas) yra antrojo (TevasMama) vaikas;
%
tevas(Tevas, Vaikas) :- mama(Mama, Vaikas), pora(Tevas, Mama).
vienas_is_tevu(TevasMama, Vaikas) :- mama(TevasMama, Vaikas).
vienas_is_tevu(TevasMama, Vaikas) :- tevas(TevasMama, Vaikas).

vaikas(Vaikas, TevasMama) :- vienas_is_tevu(TevasMama, Vaikas).

%  9.  trys_broliai(Brolis1, Brolis2, Brolis3) - Asmenys Brolis1, Brolis2 ir Brolis3 
%      tarpusavyje yra broliai;
vyras(Vardas) :- asmuo(Vardas, vyras, _, _).
broliai(Brolis1, Brolis2) :- 
    vyras(Brolis1), vyras(Brolis2), mama(Mama, Brolis1), mama(Mama, Brolis2), \+(Brolis1 = Brolis2).

trys_broliai(Brolis1, Brolis2, Brolis3) :-
    broliai(Brolis1, Brolis2), broliai(Brolis1, Brolis3), \+(Brolis2 = Brolis3).

%  36. vidurinis(Vaikas) - Asmuo Vaikas yra ne vyriausias ir ne jauniausias iš
%      šeimoje esančių vaikų;
broliai_ir_seserys(Vaikas1, Vaikas2) :- 
    mama(Mama, Vaikas1), mama(Mama, Vaikas2), \+(Vaikas1 = Vaikas2).

ar_vyresnis(Asmuo1, Asmuo2) :- 
    asmuo(Asmuo1, _, Amzius1, _), asmuo(Asmuo2, _, Amzius2, _), Amzius1 > Amzius2.
ar_jaunesnis(Asmuo1, Asmuo2) :- 
    asmuo(Asmuo1, _, Amzius1, _), asmuo(Asmuo2, _, Amzius2, _), Amzius1 < Amzius2.

vidurinis(Vaikas) :- 
    broliai_ir_seserys(Vaikas, BrolisSese1), broliai_ir_seserys(Vaikas, BrolisSese2),
    \+(BrolisSese1 = BrolisSese2),
    ar_vyresnis(Vaikas, BrolisSese1), ar_jaunesnis(Vaikas, BrolisSese2).


%  40. klaida_duomenyse(Asmuo) - Asmens Asmuo vienas iš tėvų yra už jį jaunesnis;
klaida_duomenyse(Asmuo) :- 
    vienas_is_tevu(TevasMama, Asmuo), ar_vyresnis(Asmuo, TevasMama).