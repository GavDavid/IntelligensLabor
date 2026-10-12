%% 1. Fájlok beolvasása és előkészítése
syncData   = load('pre_stmpSync.dat');
gwyData    = load('pre_gwySampFull.dat');
sensorData = load('pre_sensorResonator.dat'); 
f_set      = load('signalFreq.dat');     

% Gateway adatok DC szintjének levonása
t_gwy = gwyData(:, 1);
y_gwy = gwyData(:, 2) - mean(gwyData(:, 2));

%% 2. Időbélyeg-transzformáció és valós frekvencia meghatározása
% Időbélyeg illesztés a szinkronpontokra: t_gwy = a * t_sens + b[cite: 6]
p_sync = polyfit(syncData(:, 2), syncData(:, 1), 1);
t_r_sync = p_sync(1) * sensorData(:, 2) + p_sync(2);

% Valós alapharmonikus frekvencia meghatározása (2.2.c alapján)[cite: 24]
t_rel = sensorData(:, 2) - sensorData(1, 2);
x1 = sensorData(:, 4) + 1i * sensorData(:, 9);
p_phase = polyfit(t_rel, unwrap(angle(x1)), 1);
f_valodi = f_set + p_phase(1) / (2 * pi);

fprintf('A vizsgált jel azonosított alapfrekvenciája: %.4f Hz\n', f_valodi);

%% 3. Szenzorcsomagok kibontása
phi1_tr = sensorData(:, 3);      % Alapharmonikus küldéskori fázisa[cite: 20]
rezConf = sensorData(1, 14);     % Harmonikus kiosztás konfigurációja[cite: 20]
harmonics = (1:5)';
if rezConf == 1
    harmonics = [1; 3; 5; 7; 9];
end
X_comp = sensorData(:, 4:8) + 1i * sensorData(:, 9:13);

% Érvényes gateway mintavételi pontok kiválasztása
valid_idx = find(t_gwy >= t_r_sync(1) & t_gwy <= t_r_sync(end));
t_eval = t_gwy(valid_idx);
y_true = y_gwy(valid_idx);
N_pts  = length(valid_idx);

%% 4. Rekonstrukció futtatása különböző frekvenciahibákra
% Vizsgált frekvenciahibák listája [Hz]
delta_f_vec = [-2.0, -1.0, -0.5, -0.2, -0.1, -0.05, 0, ...
                0.05, 0.1, 0.2, 0.5, 1.0, 2.0];

mse_results = zeros(size(delta_f_vec));
y_recons_saved = cell(size(delta_f_vec));

for f_idx = 1:length(delta_f_vec)
    df = delta_f_vec(f_idx);
    f_teszt = f_valodi + df; % A tesztelt, elhangolt frekvencia[cite: 24]
    
    y_rec = zeros(N_pts, 1);
    
    for k = 1:N_pts
        tp = t_eval(k);
        pkt_idx = find(t_r_sync <= tp, 1, 'last'); % Utolsó megelőző csomag
        
        tr = t_r_sync(pkt_idx);
        delta_T = tp - tr;
        
        % Fázis számítása az elhangolt frekvenciával[cite: 17]
        phi1_tp = phi1_tr(pkt_idx) + 2 * pi * f_teszt * delta_T;
        
        % Bázisfüggvények generálása és jelösszegzés
        c = exp(1i * harmonics * phi1_tp);
        x_k = X_comp(pkt_idx, :).';
        y_rec(k) = 2 * real(sum(c .* x_k));
    end
    
    % Hiba (MSE) számítása a valós jelhez képest[cite: 23, 24]
    mse_results(f_idx) = mean((y_true - y_rec).^2);
    y_recons_saved{f_idx} = y_rec;
end

%% 5. Eredmények grafikus megjelenítése
figure('Name', '2.5. Feladat - Rekonstrukciós hiba frekvenciaeltérés esetén', 'NumberTitle', 'off');

% 1. Alábra: Rekonstruált jelek hullámalakjai különböző hibáknál
subplot(2, 1, 1);
plot(t_eval, y_true, 'k-', 'LineWidth', 1.2, 'DisplayName', 'Mért jel (referencia)'); hold on;

% Ideális eset (Delta_f = 0)
idx_0 = find(delta_f_vec == 0);
plot(t_eval, y_recons_saved{idx_0}, 'b--', 'LineWidth', 1.1, 'DisplayName', '\Delta f = 0.0 Hz (pontos)');

% Kis hiba (pl. +0.2 Hz)
idx_small = find(delta_f_vec == 0.2);
plot(t_eval, y_recons_saved{idx_small}, 'r-.', 'DisplayName', '\Delta f = +0.2 Hz');

% Nagyobb hiba (pl. +1.0 Hz)
idx_large = find(delta_f_vec == 1.0);
plot(t_eval, y_recons_saved{idx_large}, 'm:', 'LineWidth', 1.2, 'DisplayName', '\Delta f = +1.0 Hz');

grid on;
xlabel('Idő [s]');
ylabel('Amplitúdó');
title('Rekonstruált jel alakja különböző frekvenciahibák mellett');
legend('Location', 'best');
xlim([t_eval(1), t_eval(1) + 0.12]); % Első 120 ms nagyítása a csomagugrások megfigyelésére

% 2. Alábra: Rekonstrukciós hiba (MSE) a frekvenciahiba függvényében
subplot(2, 1, 2);
plot(delta_f_vec, mse_results, 'ro-', 'LineWidth', 1.5, 'MarkerFaceColor', 'r');
grid on;
xlabel('Frekvenciabecslési hiba \Delta f [Hz]');
ylabel('Átlagos négyzetes hiba (MSE)');
title('Rekonstrukciós hiba (MSE) a frekvenciaeltérés függvényében');

%% 6. Eredmények kiértékelése
fprintf('Delta f [Hz] \t\t MSE hiba\n');
fprintf('-----------------------------------------\n');
for i = 1:length(delta_f_vec)
    fprintf('%+8.2f Hz \t\t %.6e\n', delta_f_vec(i), mse_results(i));
end