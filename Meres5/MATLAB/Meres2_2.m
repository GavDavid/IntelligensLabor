%% 1. Fájlok beolvasása
% A preprocessResonatorFiles.m által generált fájlok betöltése
sensorData = load('pre_sensorResonator.dat'); % Szenzor RBO adatcsomagjai
f_set      = load('signalFreq.dat');          % GUI-ban beállított frekvencia [Hz]

%% 2. Adatok kinyerése a táblázatból
% 2. oszlop:  csomagküldés időpontja a szenzor órája szerint (t_r)
% 4. oszlop:  1. harmonikus Fourier-együttható valós része (Re{x_1})
% 9. oszlop:  1. harmonikus Fourier-együttható képzetes része (Im{x_1})
t_r   = sensorData(:, 2);
re_x1 = sensorData(:, 4);
im_x1 = sensorData(:, 9);

% 1. harmonikus komplex Fourier-együttható felépítése
x1 = re_x1 + 1i * im_x1;

%% 3. Fázisszög számítása és simítása
% Fázis meghatározása radiánban [-pi, pi] tartományban
phase_raw = angle(x1);

% Fázisugrások (2*pi szakadások) folytonossá tétele
phase_unwrapped = unwrap(phase_raw);

%% 4. Időskála normalizálása és egyenes illesztése
% A numerikus stabilitás érdekében a kezdőidőt kivonjuk (eltolás nullára)
t_rel = t_r - t_r(1);

% 1-fokú polinom (egyenes) illesztése: phase = p(1)*t + p(2)
% p(1): az egyenes meredeksége (Delta_omega [rad/s])
% p(2): kezdeti fáziseltolás (phi_0 [rad])
p = polyfit(t_rel, phase_unwrapped, 1);

delta_omega = p(1);               % Körfrekvencia-eltérés [rad/s]
delta_f     = delta_omega / (2 * pi); % Frekvenciaeltérés [Hz]
f_valodi    = f_set + delta_f;    % A jel valódi frekvenciája [Hz]

%% 5. Eredmények kiírása
fprintf('Beállított referencia frekvencia (f_set) : %10.4f Hz\n', f_set);
fprintf('Illesztett egyenes meredeksége           : %+10.4f rad/s\n', delta_omega);
fprintf('Számított frekvenciaeltérés (Delta_f)    : %+10.4f Hz\n', delta_f);
fprintf('A jel becsült VALÓDI frekvenciája (f_jel): %10.4f Hz\n', f_valodi);

%% 6. Grafikus megjelenítés
figure('Name', '2.2. Feladat - Fázis regresszió', 'NumberTitle', 'off');

% Nyers és simított fázis összehasonlítása
subplot(2, 1, 1);
plot(t_rel, phase_raw, 'k.', 'MarkerSize', 6);
grid on;
xlabel('Relatív idő [s]');
ylabel('Fázis [rad]');
title('Nyers fázisugrások a [-\pi, \pi] tartományban (angle)');

% Kisimított fázis és az illesztett regressziós egyenes
subplot(2, 1, 2);
plot(t_rel, phase_unwrapped, 'b.', 'MarkerSize', 8, 'DisplayName', 'Mért fázispontok (unwrap)'); 
hold on;
plot(t_rel, polyval(p, t_rel), 'r-', 'LineWidth', 1.8, 'DisplayName', sprintf('Illesztett egyenes (m = %+.3f rad/s)', delta_omega));
grid on;
xlabel('Relatív idő [s]');
ylabel('Fázis [rad]');
title('Kisimított fázismenet és az illesztett egyenes');
legend('Location', 'best');