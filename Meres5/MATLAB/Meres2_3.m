clear; close all; clc;

%% 1. Fájlok beolvasása és előkészítése
syncData   = load('pre_stmpSync.dat');        % 1. oszlop: gateway idő, 2. oszlop: szenzor idő
gwyData    = load('pre_gwySampFull.dat');     % 1. oszlop: gateway idő, 2. oszlop: mért ADC minták
sensorData = load('pre_sensorResonator.dat'); % Szenzor RBO adatcsomagjai
f_jel      = load('signalFreq.dat');          % RBO beállított frekvenciája [Hz]

% Gateway adatok szétbontása és a DC komponens (átlag) levonása
t_gwy = gwyData(:, 1);
y_gwy = gwyData(:, 2) - mean(gwyData(:, 2));

%% 2. Időbélyeg-transzformáció meghatározása (lineáris regresszió)
% A rádiós időbélyeg-párokból meghatározzuk a modellt: t_gwy = a * t_sens + b
p_sync = polyfit(syncData(:, 2), syncData(:, 1), 1);
a = p_sync(1);
b = p_sync(2);

% Szenzor küldési időbélyegeinek átszámítása a gateway időskálájára
t_r_sens = sensorData(:, 2);
t_r_sync = a * t_r_sens + b;

%% 3. Szenzor adatsor kibontása
phi1_tr = sensorData(:, 3);      % Alapharmonikus fázisa a küldés pillanatában [rad]
rezConf = sensorData(1, 14);     % Konfiguráció: 0 -> [1..5], 1 -> [1, 3, 5, 7, 9]

if rezConf == 0
    harmonics = (1:5)';
else
    harmonics = [1; 3; 5; 7; 9];
end

% 5 db komplex Fourier-együttható felépítése (Re + j*Im)
X_comp = sensorData(:, 4:8) + 1i * sensorData(:, 9:13);

%% 4. Jel rekonstrukciója a gateway mintavételi időpontjaiban
% Csak azokat a gateway időpontokat dolgozzuk fel, amelyekre létezik megelőző szenzorcsomag
valid_mask = (t_gwy >= t_r_sync(1)) & (t_gwy <= t_r_sync(end));
valid_indices = find(valid_mask);

N_eval  = length(valid_indices);
y_recon = zeros(N_eval, 1);
c_save  = zeros(length(harmonics), N_eval); % Bázisfüggvények mentése ábrázoláshoz

for k = 1:N_eval
    idx_p = valid_indices(k);
    tp = t_gwy(idx_p);
    
    % Legutolsó csomag keresése közvetlenül tp előtt (t_r <= tp)
    pkt_idx = find(t_r_sync <= tp, 1, 'last');
    
    tr = t_r_sync(pkt_idx);
    delta_T = tp - tr;
    
    % Alapharmonikus fázis kiszámítása a tp időpontban
    phi1_tp = phi1_tr(pkt_idx) + 2 * pi * f_jel * delta_T;
    
    % i-edik harmonikusok bázisfüggvényeinek előállítása: c_i(tp) = exp(j * i * phi1(tp))
    c = exp(1i * harmonics * phi1_tp);
    c_save(:, k) = c;
    
    % Adott csomaghoz tartozó együtthatók kinyerése
    x_k = X_comp(pkt_idx, :).';
    
    % Rekonstruált érték: y'(tp) = 2 * Re{ sum( c_i * x_i ) }
    y_recon(k) = 2 * real(sum(c .* x_k));
end

%% 5. Kiértékelés és eredmények ábrázolása
t_eval = t_gwy(valid_indices);
y_eval_gwy = y_gwy(valid_indices);

% Átlagos négyzetes hiba (MSE)
mse = mean((y_eval_gwy - y_recon).^2);
fprintf('Transzformációs paraméterek : a = %.8f, b = %.4f s\n', a, b);
fprintf('Alkalmazott harmonikusok    : %s\n', mat2str(harmonics'));
fprintf('Átlagos négyzetes hiba (MSE): %.6e\n', mse);

% 1. Ábra: Időtartománybeli összehasonlítás
figure('Name', '2.3. Feladat - Időtartománybeli rekonstrukció', 'NumberTitle', 'off');

subplot(2, 1, 1);
plot(t_eval, y_eval_gwy, 'b-', 'LineWidth', 1.0, 'DisplayName', 'Mért gateway jel (DC mentes)'); hold on;
plot(t_eval, y_recon, 'r--', 'LineWidth', 1.2, 'DisplayName', 'Rekonstruált jel (RBO)');
grid on;
xlabel('Gateway idő [s]');
ylabel('Amplitúdó');
title('Mért és Fourier-együtthatókból rekonstruált jel');
legend('Location', 'northeast');
xlim([t_eval(1), t_eval(1) + 0.1]); % Első 100 ms részlet

subplot(2, 1, 2);
plot(t_eval, y_eval_gwy - y_recon, 'k-', 'DisplayName', 'Rekonstrukciós hiba e(t)');
grid on;
xlabel('Gateway idő [s]');
ylabel('Hiba amplitúdó');
title('A mért és rekonstruált jel különbsége');
legend('Location', 'northeast');
xlim([t_eval(1), t_eval(1) + 0.1]);

% 2. Ábra: Az 1. harmonikus bázisfüggvény trajektóriája (plot3)
figure('Name', '2.3. Feladat - Bázisfüggvény trajektória', 'NumberTitle', 'off');
plot3(t_eval(1:500), real(c_save(1, 1:500)), imag(c_save(1, 1:500)), 'b-', 'LineWidth', 1.5);
grid on;
xlabel('Idő [s]');
ylabel('Re\{c_1(t)\}');
zlabel('Im\{c_1(t)\}');
title('Az 1. harmonikus bázisfüggvény trajektóriája a komplex térben');
view(45, 30);