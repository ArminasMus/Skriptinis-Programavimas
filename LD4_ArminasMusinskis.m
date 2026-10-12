% =========================================================================
% VILNIUS TECH EF - Skriptinis programavimas - 2026
% 4 laboratorinis darbas: Rezultatų grafinis 3D atvaizdavimas
% Privaloma užduotis (22 variantas) ir Papildoma užduotis (23 variantas)
% =========================================================================

clear; close all; clc;

% Sukuriamas vienas bendras langas visiems grafikams atvaizduoti
figure('Name', '4 Laboratorinis darbas - 3D Grafika', 'Position', [100, 100, 1300, 900]);

%% 1. PRIVALOMA UŽDUOTIS (22 variantas)

% --- a) Trimatis tūrio grafikas (slice plot) ---
subplot(2, 2, 1);

x = linspace(-2, 2, 20);
y = linspace(-2, 2, 20);
z = linspace(-1, 1, 20);
[X, Y, Z] = meshgrid(x, y, z);

% Tūrio funkcija
V = sin((X.^2 + Y.^2 + Z.^2) / 20) .* exp(-(X.^2 + Y.^2 + Z.^2));

slice(X, Y, Z, V, 0, 0, 0);
shading interp;
colormap(jet);
colorbar;
view(90, 30);

title('1a užduotis: Trimatė tūrio diagrama');
xlabel('X ašis');
ylabel('Y ašis');
zlabel('Z ašis');
grid on;

% --- b) Trimatis paviršiaus grafikas ---
subplot(2, 2, 2);

x2 = linspace(-2, 2, 40);
y2 = linspace(-2, 2, 40);
[X2, Y2] = meshgrid(x2, y2);

% Paviršiaus funkcija su moduliais
Z2 = sin(abs(X2 + Y2) / 20) .* exp(-abs(X2 + Y2));

surf(X2, Y2, Z2);
shading interp;
camlight; lighting gouraud;
colormap(turbo);
colorbar;
view(60, 30);

title('1b užduotis: Trimatis paviršius');
xlabel('X ašis');
ylabel('Y ašis');
zlabel('Z ašis');
grid on;


%% 2. PAPILDOMA UŽDUOTIS (23 variantas)
subplot(2, 2, [3, 4]);

x3 = linspace(-2, 2, 40);
y3 = linspace(-2, 2, 40);
[X3, Y3] = meshgrid(x3, y3);

% Papildomos užduoties funkcija
Z3 = 1 - (X3.^2 + Y3.^2);

% Mėlynas ir permatomas paviršius naudojant surf ir alpha
surf(X3, Y3, Z3, 'FaceColor', 'blue', 'EdgeColor', 'none');
alpha(0.5);
camlight; lighting gouraud;
view(45, 30);

title('Papildoma užduotis: Permatomas mėlynas paviršius');
xlabel('X ašis');
ylabel('Y ašis');
zlabel('Z ašis');
grid on;
