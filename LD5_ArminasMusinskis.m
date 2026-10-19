% LD5_ArminasMusinskis.m
% Arminas Mušinskis, Eif-25
% Data: 2026-10-19
% -------------------------------------------------------------------------
clc;
clear;
close all;

%% ------------------------------------------------------------------------
% 1 DALIS: Celių masyvai (19 variantas)
% ------------------------------------------------------------------------
disp('=== 1 DALIS: Celių masyvai ===');

% Mano duomenys ir pažymiai (dviejų paskutinių semestrų)
mano_pazymiai = [8 9 10 9 8; 9 10 9 8 10];
mano_celiu_masyvas = cell(1, 5);
mano_celiu_masyvas{1} = 'Arminas Mušinskis';
mano_celiu_masyvas{2} = '2006-09-07';
mano_celiu_masyvas{3} = '+37063234566';
mano_celiu_masyvas{4} = mano_pazymiai;
mano_celiu_masyvas{5} = 'VILNIUS TECH';

% Draugo duomenys
draugo_pazymiai = [7 8 9 8 9; 10 9 8 9 9];
draugo_celiu_masyvas = cell(1, 5);
draugo_celiu_masyvas{1} = 'Jonas Valanciunas';
draugo_celiu_masyvas{2} = '2005-11-12';
draugo_celiu_masyvas{3} = '+37065511789';
draugo_celiu_masyvas{4} = draugo_pazymiai;
draugo_celiu_masyvas{5} = 'VILNIUS TECH';

% Celių masyvų apjungimas
bendras_masyvas = [mano_celiu_masyvas; draugo_celiu_masyvas];

% Funkcijų demonstracija
disp(['iscell(bendras_masyvas): ', num2str(iscell(bendras_masyvas))]);
disp(['isempty(bendras_masyvas): ', num2str(isempty(bendras_masyvas))]);
disp(['length(bendras_masyvas): ', num2str(length(bendras_masyvas))]);

% Grafinis pavaizdavimas
figure('Name', '1 Uždavinys - Celių masyvo struktūra', 'NumberTitle', 'off');
cellplot(bendras_masyvas);
title('Sujungtas celių masyvas (Mano ir Draugo duomenys)');
pause(1);


%% ------------------------------------------------------------------------
% 2 DALIS: Srauto valdymo konstrukcijos (19 variantas)
% ------------------------------------------------------------------------
disp(' ');
disp('=== 2 DALIS: Srauto valdymo konstrukcijos ===');

% Įvestis iš vartotojo
m = input('Įveskite skaičių m (pvz., 1): ');
if isempty(m)
m = 1; % Numatytoji reikšmė, jei nieko neįvesta
end

pasirinkimas = input('Pasirinkite funkciją (1 - sin, 2 - cos): ');
if isempty(pasirinkimas)
pasirinkimas = 1;
end

% Patikrinimas atliekamas PRIEŠ ciklą, kad nekartotų klaidų pranešimų
if pasirinkimas == 1
f_pavadinimas = 'sin(x)';
elseif pasirinkimas == 2
f_pavadinimas = 'cos(x)';
else
disp('Neteisingas pasirinkimas, automatiškai naudojama sin(x) funkcija.');
pasirinkimas = 1;
f_pavadinimas = 'sin(x)';
end

figure('Name', '2 Uždavinys - Dinaminis grafikas (stem)', 'NumberTitle', 'off');

for k = 1:15
m_dabartinis = m + (k - 1) * (pi / 8);
x = m_dabartinis : (pi / 8) : (m_dabartinis + 4*pi);

if pasirinkimas == 1
y = sin(x);
else
y = cos(x);
end

% Brėžiamas diskretaus tipo grafikas
stem(x, y, 'filled', 'LineWidth', 1.2);
title(sprintf('Diskretingas grafikas: %s (Iteracija %d/15, m = %.2f)', f_pavadinimas, k, m_dabartinis));
xlabel('x');
ylabel('y');
grid on;

drawnow;
pause(0.5); % 0.5 sekundės pauzė tarp iteracijų
end


%% ------------------------------------------------------------------------
% 3 DALIS: Papildoma užduotis (4 variantas)
% ------------------------------------------------------------------------
disp(' ');
disp('=== 3 DALIS: Papildoma užduotis (4 var.) ===');

masyvas1 = [];
masyvas2 = [];

while true
sk1 = round(rand * 3);
sk2 = round(rand * 5);

masyvas1 = [masyvas1, sk1];
masyvas2 = [masyvas2, sk2];

if sk1 == sk2
break;
end
end

disp(['Generavimas baigtas! Prireikė ', num2str(length(masyvas1)), ' iteracijų.']);
disp(['Paskutinė sutapusi reikšmė: ', num2str(masyvas1(end))]);

% Grafinis rezultatų atvaizdavimas
figure('Name', 'Papildoma užduotis - Atsitiktinių skaičių kitimas', 'NumberTitle', 'off');
plot(masyvas1, '-o', 'LineWidth', 1.5, 'DisplayName', 'round(rand*3)');
hold on;
plot(masyvas2, '-s', 'LineWidth', 1.5, 'DisplayName', 'round(rand*5)');
hold off;

title('Atsitiktinai sugeneruotų skaičių kitimas iki pirmo sutapimo');
xlabel('Žingsnis (iteracija)');
ylabel('Sugeneruota reikšmė');
legend('Location', 'best');
grid on;