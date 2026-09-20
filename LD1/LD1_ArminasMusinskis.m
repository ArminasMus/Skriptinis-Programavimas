% LD1_ArminasMusinskis.m
% Arminas Mušinskis, Eif-25
% Data: 2026-09-20
% -------------------------------------------------------------------------
%% PRIVALOMA UŽDUOTIS
% 7 punktas: Skriptas pagal 1 pav. pavyzdį

% Paprastas skriptas

x = 1:32;
y = x.^2;

% Braižome grafiką
plot(x, y, 'o-r', x, y/3, 'xb')
title('Dvi funkcijos')
xlabel('X-ai')
ylabel('F_1 [-o-]   |   F_2 [-x-]')

% 8 ir 9 punktai: Pagalbos komandos (užkomentuotos, kad nestabdytų kodo)
% Norėdami pamatyti dokumentaciją komandų lange, nutrinkite '%' ženklą:
% help sin
% help plot
% help title
% help linspace
% help size
% help max

% -------------------------------------------------------------------------
%% PAPILDOMA UŽDUOTIS

% 1. Apibrėžiame kintamąjį N. 
% Priskirtas paskutinis studento ID skaitmuo.
N = 6; 

% 2. Sukuriame vektorių: pirmas elementas N+1, paskutinis N+4, žingsnis 0.5
vektorius = (N + 1) : 0.5 : (N + 4);

% 3. Sukuriame 3x3 matricą A, kurios elementai didėja vienetu
A = [N,   N+1, N+2;
    N+3, N+4, N+5;
    N+6, N+7, N+8];

% 4. Iš matricos A atrenkame elementus pagal pateiktas schemas:
% a) Apatinis vidurinis langelis (3 eilutė, 2 stulpelis)
schema_a = A(3, 2);

% b) Kairysis apatinis 2x2 kvadratas (2 ir 3 eilutės, 1 ir 2 stulpeliai)
schema_b = A(2:3, 1:2);

% c) Visi keturi kampiniai elementai (1 ir 3 eilutės, 1 ir 3 stulpeliai)
schema_c = A([1, 3], [1, 3]);

% 5. Vektoriaus prijungimas prie matricos A.
% Kadangi pradinio vektoriaus ilgis yra 7, o A matrica turi 3 eilutes ir 3 stulpelius, 
% vektorių modifikuojame: paimame tik pirmuosius 3 jo elementus, transponuojame 
% (paverčiame stulpeliu) ir prijungiame prie A matricos kaip 4-ąjį stulpelį.
modifikuotas_vektorius = vektorius(1:3)';
A_nauja = [A, modifikuotas_vektorius];

% Išvedame rezultatus į komandų langą pasitikrinimui
disp('Pradinis vektorius:');
disp(vektorius);
disp('Matrica A:');
disp(A);
disp('Iškarpa a):');
disp(schema_a);
disp('Iškarpa b):');
disp(schema_b);
disp('Iškarpa c):');
disp(schema_c);
disp('Matrica A su prijungtu modifikuotu vektoriumi:');
disp(A_nauja);