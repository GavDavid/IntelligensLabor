%% 1. A laborban mért / leolvasott elhangolási adatok (példa adatsor)
% delta_f_meres: a kezelőfelületen beállított elhangolások [Hz]
% amp_meres: a felületről leolvasott |rez| értékek (vagy adatfájlból kinyert értékek)
delta_f_meres = [-10, -5, -2, -1, -0.5, -0.1, -0.01, 0, ...
                  0.01, 0.1, 0.5, 1, 2, 5, 10];
amp_meres     = [0.038, 0.082, 0.231, 0.485, 0.742, 0.985, 0.999, 1.000, ...
                 0.999, 0.983, 0.739, 0.481, 0.228, 0.080, 0.036];

% Normalizálás a rezonanciás (0 Hz elhangolású) csúcsértékre
amp_norm = amp_meres / max(amp_meres);

%% 2. Sűrű átviteli karakterisztika generálása a mért gateway jelen (offline RBO)
% Betöltjük a gateway nyers jelét, és lefuttatjuk rajta az RBO-t különböző elhangolásokra
try
    gwyData = load('pre_gwySampFull.dat');
    fs = 8e6 / 4444; % ~1800.2 Hz
    y = gwyData(:, 2) - mean(gwyData(:, 2)); % DC mentesítés
    f0 = 50; % Bemenő jel névleges frekvenciája
    
    delta_f_dense = linspace(-12, 12, 121);
    amp_rbo_sim = zeros(size(delta_f_dense));
    alpha = 2 / (2 * 5 + 1); % Bátorsági tényező 5 harmonikusra
    
    for idx = 1:length(delta_f_dense)
        f_test = f0 + delta_f_dense(idx);
        Theta = 2 * pi * (f_test / fs);
        
        x_hat = 0; % Csak az 1. harmonikusra futtatva
        for n = 1:length(y)
            c_n = exp(1i * Theta * (n - 1));
            y_p = 2 * real(c_n * x_hat);
            e_n = y(n) - y_p;
            x_hat = x_hat + alpha * e_n * conj(c_n);
        end
        % Utolsó 500 minta átlagos együttható-nagysága (állandósult állapot)
        amp_rbo_sim(idx) = abs(x_hat);
    end
    amp_rbo_sim = amp_rbo_sim / max(amp_rbo_sim);
    has_sim_data = true;
catch
    has_sim_data = false;
end

%% 3. Elméleti DFT átviteli függvény számítása azonos időablakra
% Legyen a DFT ablakmérete T_w = 0.5 másodperc (tipikus blokkhossz)
T_w = 0.5;
f_axis = linspace(-12, 12, 500);
% A téglalapablak Fourier-transzformáltja sinc(pi * f * T_w) lefutású
dft_response = abs(sinc(f_axis * T_w));

%% 4. Grafikus ábrázolás és összehasonlítás
figure('Name', '2.4. Feladat - RBO és DFT átviteli karakterisztika', 'NumberTitle', 'off');

% Lineáris skálájú ábrázolás
subplot(2, 1, 1);
plot(delta_f_meres, amp_norm, 'ro', 'MarkerFaceColor', 'r', 'MarkerSize', 6, 'DisplayName', 'Mért pontok (|rez|)'); hold on;
if has_sim_data
    plot(delta_f_dense, amp_rbo_sim, 'r-', 'LineWidth', 1.5, 'DisplayName', 'RBO átviteli karakterisztika (mért jelen)');
end
plot(f_axis, dft_response, 'b--', 'LineWidth', 1.2, 'DisplayName', sprintf('DFT sinc válasz (T = %.1f s)', T_w));
grid on;
xlabel('Frekvencia elhangolás \Delta f [Hz]');
ylabel('Normalizált amplitúdó');
title('A rezonátoros megfigyelő és a DFT átviteli függvényének összehasonlítása');
legend('Location', 'northeast');
xlim([-12, 12]);
ylim([0, 1.1]);

% Logaritmikus (dB) skálájú ábrázolás (mellékhullámok és elnyomás vizsgálata)
subplot(2, 1, 2);
plot(delta_f_meres, 20*log10(max(amp_norm, 1e-4)), 'ro', 'MarkerFaceColor', 'r', 'DisplayName', 'Mért pontok [dB]'); hold on;
if has_sim_data
    plot(delta_f_dense, 20*log10(max(amp_rbo_sim, 1e-4)), 'r-', 'LineWidth', 1.5, 'DisplayName', 'RBO válasz [dB]');
end
plot(f_axis, 20*log10(max(dft_response, 1e-4)), 'b--', 'LineWidth', 1.2, 'DisplayName', 'DFT válasz [dB]');
grid on;
xlabel('Frekvencia elhangolás \Delta f [Hz]');
ylabel('Erősítés [dB]');
title('Átviteli karakterisztika logaritmikus skálán (dB)');
legend('Location', 'northeast');
xlim([-12, 12]);
ylim([-40, 5]);

%% 5. Értékelés kiírása
fprintf('================ 2.4. FELADAT KIÉRTÉKELÉSE ================\n');
fprintf('A rezonátor sávszélessége (ahol az amplitúdó -3 dB alá esik):\n');
idx_3db = find(amp_norm >= 1/sqrt(2));
fprintf('Becsült 3 dB sávszélesség a mérés alapján: kb. +/- %.2f Hz\n', abs(delta_f_meres(idx_3db(1))));
fprintf('DFT vs RBO összefoglalás:\n');
fprintf('- RBO: Sima lefutású rezonáns szűrő, nincsenek mellékhullámok.\n');
fprintf('- DFT: Sinc lefutás peremdiszkontinuitásokkal és másodlagos hullámokkal.\n');
fprintf('===========================================================\n');