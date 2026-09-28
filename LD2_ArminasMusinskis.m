% LD1_ArminasMusinskis.m
% Arminas Mušinskis, Eif-25
% Data: 2026-09-28
% -------------------------------------------------------------------------
clc; clear; close all;

%% ================= Pagrindine užduotis =================

%% 1. Vienmačiai masyvai
a = 5:2:34; % a) eilutė: 5, 7, ..., 33
b = exp(a); % b) narių eksponentės
c = a ./ b; % c) a dalijamas iš b (elementas po elemento)
c = c(:); % d) atsakymas - stulpelis
disp('1 d) Atsakymas (stulpelis):');
disp(c);

%% 2. Dvimačiai masyvai
A = [pi/2, 3i; % a) matrica A
    log(2), 2*pi];

v = [exp(A(1,1)), exp(A(1,2))]; % b) vektorių-eilutė
B = [A; v]; % prijungiama prie A
disp('2 b) Matrica B:');
disp(B);

eilSuma = sum(B, 2); % c) kiekvienos eilutės suma
disp('2 c) Eilučių sumos:');
disp(eilSuma);

%% 3. Praktinis veiksmų su masyvais taikymas
Aamp = 6; f = 2; sigma = 1.5; % A [V], f [Hz], sigma [V]
U1 = 4; U2 = 2; % ribos [V]

t = 0:0.005:2;
s = Aamp * cos(2*pi*f*t); % signalas
n = sigma * randn(size(t)); % triukšmas
x = s + n; % triukšmo paveiktas signalas

% a) reikšmės, viršijančios U1
xa = x(x > U1);

% b) filtravimas: |x| < U2 keičiama nuliais
xf = x;
xf(abs(xf) < U2) = 0;

% c) nefiltruoto signalo dydis
dydis_x = length(x);

% d) a) dalyje atrinktų reikšmių dydis
dydis_xa = length(xa);

% e) filtruoto signalo max ir min
xmax = max(xf);
xmin = min(xf);

fprintf('3 c) Nefiltruoto signalo dydis: %d\n', dydis_x);
fprintf('3 d) Atrinktų reikšmių (> U1) skaičius: %d\n', dydis_xa);
fprintf('3 e) Filtruoto signalo max: %.3f V, min: %.3f V\n', xmax, xmin);

figure;
plot(t, x, t, xf); grid on;
legend('Nefiltruotas', 'Filtruotas');
xlabel('t, s'); ylabel('U, V');

%% ================= Papildoma Užduotis=================

%% P1. Masyvo elementų indeksavimas
A1 = input('Įveskite vektorių A (10 narių), pvz. [1 2 3 4 5 6 7 8 9 10]: ');

% B = [a10, a9, ..., a6, a1, ..., a5]
B1 = A1([end:-1:6, 1:5]);

disp('vektorius B yra:');
disp(B1);

