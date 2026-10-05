% LD1_ArminasMusinskis.m
% Arminas Mušinskis, Eif-25
% Data: 2026-10-05
% =========================================================================

clear; clc; close all;

%% 1. DVIMATIS GRAFIKŲ VAIZDAVIMAS
% a) f(x) = x^3 + tan(x) atvaizdavimas
x_1a = 0:0.1:2*pi;
y_1a = x_1a.^3 + tan(x_1a);

figure('Name', '1 Užduotis (a)');
% Mėlyna spalva, "o" tipo markeris
plot(x_1a, y_1a, 'bo');
title('Funkcijos f(x) = x^3 + tan(x) grafikas');
xlabel('x ašis');
ylabel('y ašis');
% Nustatomos ašių ribos pagal mažiausias ir didžiausias reikšmes
axis([min(x_1a) max(x_1a) min(y_1a) max(y_1a)]);
legend('f(x) = x^3 + tan(x)', 'Location', 'best');
grid on;

% b) Eksponentinių funkcijų atvaizdavimas
x_1b = 0:0.1:3; % Pasirenkame intervalą
y1_1b = exp(x_1b);
y2_1b = exp(2*x_1b);
y3_1b = exp(3*x_1b);

figure('Name', '1 Užduotis (b)');
% Kiekviena funkcija atvaizduojama skirtinga spalva
plot(x_1b, y1_1b, 'r', x_1b, y2_1b, 'g', x_1b, y3_1b, 'b');
title('Eksponentinės funkcijos');
xlabel('x ašis');
ylabel('y ašis');
% Ribos nustatomos apskaičiavus visų y bendrą min ir max
axis([min(x_1b) max(x_1b) min([y1_1b, y2_1b, y3_1b]) max([y1_1b, y2_1b, y3_1b])]);
legend('f(x) = e^x', 'f(x) = e^{2x}', 'f(x) = e^{3x}', 'Location', 'best');
grid on;


%% 2. SPECIALIZUOTŲ GRAFIKŲ KŪRIMAS
% Sugeneruojame duomenis: 6 studentai, 4 egzaminai (matrica 6x4)
pazymiai = randi([4, 10], 6, 4); % Atsitiktiniai pažymiai nuo 4 iki 10
studentu_vardai = {'Jonas', 'Petras', 'Ona', 'Rasa', 'Lukas', 'Mantas'};
egzaminu_legend = {'1 egz', '2 egz', '3 egz', '4 egz'};

figure('Name', '2 Užduotis (a ir b) - Stulpelinės diagramos');

% a) Vertikalių stulpelių tipo diagrama (grupuota)
subplot(2,1,1);
bar(pazymiai, 'grouped');
title('Studentų egzaminų rezultatai (grupuoti stulpeliai)');
xlabel('Studentas');
ylabel('Pažymys');
ylim([0 10]); % Pažymių ašies ribos nuo 0 iki 10
set(gca, 'XTickLabel', studentu_vardai); % Paaiškinimai su studentų vardais
legend(egzaminu_legend, 'Location', 'bestoutside');
grid on;

% b) Diskretus duomenų formatas (sukrauti/stacked stulpeliai pagal pavyzdį nuotraukoje)
subplot(2,1,2);
bar(pazymiai, 'stacked');
title('Studentų egzaminų rezultatai (sukrauti stulpeliai)');
xlabel('Studentas');
ylabel('Bendra suma');
ylim([0 40]); % 4 egzaminai po max 10 balų
set(gca, 'XTickLabel', studentu_vardai);
legend(egzaminu_legend, 'Location', 'bestoutside');
grid on;


%% 3. PAPILDOMA UŽDUOTIS (Signalų grafinis atvaizdavimas)
% Imituojame duomenis (kadangi neturime 2-ojo laboratorinio failų)
t = 0:0.05:10; % Laiko vektorius
pradinis_signalas = 5*sin(2*pi*0.2*t) + 1.5*randn(size(t)); % Sinusoidė su triukšmu
filtruotas_signalas = smoothdata(pradinis_signalas, 'gaussian', 10); % Išlygintas signalas
U1 = 4; % Viršutinė filtravimo riba
U2 = -4; % Apatinė filtravimo riba

% Sukuriame vertikalų grafikų išdėstymą
figure('Name', 'Papildoma užduotis - Signalai');

% a) Pirmas grafikas: Pradinis ir filtruotas signalai
subplot(2,1,1);
hold on;
% Pradinis signalas - žydra spalva ('c' - cyan)
plot(t, pradinis_signalas, 'c');
% Filtruotas signalas - violetinė (naudojamas RGB kodas violetinei)
plot(t, filtruotas_signalas, 'Color', [0.54, 0.17, 0.89], 'LineWidth', 1.5);
% Ribos U1 (taškinis, storis 1) ir U2 (ištisinis)
plot([min(t) max(t)], [U1 U1], 'k--', 'LineWidth', 1);
plot([min(t) max(t)], [U2 U2], 'k-');
hold off;

title('Pradinis ir filtruotas signalai');
xlabel('Laikas (t)');
ylabel('Amplitudė');
axis([min(t) max(t) min(pradinis_signalas)-2 max(pradinis_signalas)+2]);
legend('Pradinis signalas', 'Filtruotas signalas', 'Riba U_1', 'Riba U_2', 'Location', 'southeast');
grid on;

% b) Antras grafikas: Reikšmės viršijančios U1 bei ekstremumai
subplot(2,1,2);
hold on;

% Randame reikšmes viršijančias U1
idx_virs_U1 = pradinis_signalas > U1;
t_virs = t(idx_virs_U1);
sig_virs = pradinis_signalas(idx_virs_U1);

% Diskrečiu formatu (stem) atvaizduojame reikšmes > U1
stem(t_virs, sig_virs, 'b', 'filled');

% Randame minimalią ir maksimalią įtampos reikšmes
[min_val, min_idx] = min(pradinis_signalas);
[max_val, max_idx] = max(pradinis_signalas);

% Minimalios įtampos žymeklis - raudonas kvadratas, dydis 11
plot(t(min_idx), min_val, 'rs', 'MarkerSize', 11, 'MarkerFaceColor', 'r');
% Maksimalios įtampos žymeklis (naudojame tokį patį stilių)
plot(t(max_idx), max_val, 'rs', 'MarkerSize', 11, 'MarkerFaceColor', 'r');
hold off;

title('Signalo reikšmės viršijančios U_1 bei ekstremumai');
xlabel('Laikas (t)');
ylabel('Amplitudė');
axis([min(t) max(t) min_val-2 max_val+2]);
legend('Reikšmės > U_1', 'Min/Max įtampos', 'Location', 'southeast');
grid on;