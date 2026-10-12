%% 1. Fájlok beolvasása és paraméterek inicializálása
syncData   = load('pre_stmpSync.dat');        % Szinkronizációs pontok[cite: 11]
gwyData    = load('pre_gwySampFull.dat');     % Gateway nyers adatsor[cite: 12]
sensorData = load('pre_sensorResonator.dat'); % Szenzor RBO csomagjai[cite: 20]
f_jel      = load('signalFreq.dat');          % RBO frekvenciája [Hz][cite: 20]

% Mintavételi frekvencia a beágyazott rendszer órajeléből
fs = 8e6 / 4444; % ~1800.20 Hz[cite: 10]

% Gateway adatok és DC komponens levonása
t_gwy = gwyData(:, 1);
y_gwy = gwyData(:, 2) - mean(gwyData(:, 2)); %[cite: 24]
N_samples = length(y_gwy);

%% 2. Harmonikus kiosztás konfigurálása
% Ellenőrizzük a szenzor konfigurációját a fájl utolsó oszlopából
rezConf = sensorData(1, 14); % 0: 1..5, 1: 1, 3, 5, 7, 9[cite: 20]
if rezConf == 0
    harmonics = (1:5)'; %[cite: 15, 20]
else
    harmonics = [1; 3; 5; 7; 9]; %[cite: 15, 20]
end
P = length(harmonics);

% Relatív körfrekvencia
Theta = 2 * pi * (f_jel / fs); %

% Bátorsági tényező (alpha) beállítása:
% Tipikus kompromisszum a gyors beállás és a zajelnyomás között
alpha = 2 / (2 * P + 1); %

%% 3. Rezonátoros megfigyelő (RBO) szimulációja a gateway adatokon
% Állapotváltozó vektor: P elemű komplex Fourier-együttható vektor
x_hat = zeros(P, 1);

% Változók az időbeli állapotok elmentéséhez
x_history = zeros(P, N_samples);
y_prime_history = zeros(N_samples, 1);
e_history = zeros(N_samples, 1);

% Rekurzív futtatás mintáról mintára a (8)-(9)-(10) egyenletek szerint
for n = 1:N_samples
    % Bázisfüggvények vektora az n-edik időpontban: c_i,n = exp(j * Theta * i * (n-1))
    c_n = exp(1i * harmonics * Theta * (n - 1)); %[cite: 13]
    
    % (8) Becsült jel előállítása a valós rész kétszereseként
    y_prime = 2 * real(c_n.' * x_hat); %[cite: 14, 15]
    
    % (9) Becslési hiba kiszámítása
    e_n = y_gwy(n) - y_prime; %
    
    % (10) Becsült Fourier-együtthatók módosítása a konjugált bázissal
    x_hat = x_hat + alpha * e_n * conj(c_n); %[cite: 14]
    
    % Időbeli trajektória mentése
    x_history(:, n) = x_hat;
    y_prime_history(n) = y_prime;
    e_history(n) = e_n;
end

%% 4. Szenzor adatok előkészítése és időtranszformáció
% Időbélyeg illesztése: t_gwy = a * t_sens + b
p_sync = polyfit(syncData(:, 2), syncData(:, 1), 1); %[cite: 6]
t_r_sync = p_sync(1) * sensorData(:, 2) + p_sync(2); %[cite: 6, 17]

% Szenzor által küldött komplex Fourier-együtthatók (P oszlop)
X_sensor = sensorData(:, 4:8) + 1i * sensorData(:, 9:13); %[cite: 20, 21]

%% 5. Eredmények összehasonlítása és ábrázolása
figure('Name', '2.6. Feladat - RBO állapotok összehasonlítása', 'NumberTitle', 'off');

% 1. Alábra: 1. harmonikus amplitúdójának beállása és összevetése
subplot(3, 1, 1);
plot(t_gwy, abs(x_history(1, :)), 'b-', 'LineWidth', 1.2, 'DisplayName', 'Gateway-en számított |x_1|'); hold on;
plot(t_r_sync, abs(X_sensor(:, 1)), 'ro', 'MarkerSize', 5, 'DisplayName', 'Szenzor által küldött |x_1|');
grid on;
ylabel('Amplitúdó');
title('1. harmonikus együttható nagysága (|x_1|) az idő függvényében');
legend('Location', 'southeast');

% 2. Alábra: 1. harmonikus fázismenete (unwrap után)
subplot(3, 1, 2);
plot(t_gwy, unwrap(angle(x_history(1, :))), 'b-', 'LineWidth', 1.2, 'DisplayName', 'Gateway számított fázis'); hold on;
plot(t_r_sync, unwrap(angle(X_sensor(:, 1))), 'ro', 'MarkerSize', 5, 'DisplayName', 'Szenzor fázis');
grid on;
ylabel('Fázis [rad]');
title('1. harmonikus fázismenete');
legend('Location', 'southeast');

% 3. Alábra: Becslési hiba időfüggvénye a gateway-en
subplot(3, 1, 3);
plot(t_gwy, e_history, 'k-', 'DisplayName', 'Becslési hiba e_n');
grid on;
xlabel('Gateway idő [s]');
ylabel('Hiba e_n');
title('Becslési hiba lecsengése a beállási folyamat során');
legend('Location', 'northeast');

%% 6. Numerikus hibaösszehasonlítás állandósult állapotban
% Keressünk egy állandósult időablakot a mérés második felében
t_mid = t_gwy(round(end * 0.6));
valid_sens = find(t_r_sync >= t_mid);

amp_diff = zeros(length(valid_sens), 1);
for k = 1:length(valid_sens)
    sens_idx = valid_sens(k);
    t_pkt = t_r_sync(sens_idx);
    
    % Legközelebbi gateway pont megkeresése
    [~, gwy_idx] = min(abs(t_gwy - t_pkt));
    amp_diff(k) = abs(abs(x_history(1, gwy_idx)) - abs(X_sensor(sens_idx, 1)));
end

fprintf('Átlagos amplitúdó-eltérés állandósult állapotban (|x_1|): %.5f\n', mean(amp_diff));
fprintf('Maximális amplitúdó-eltérés:                             %.5f\n', max(amp_diff));