% Jel betöltése
[x, Fs] = audioread('feladat3_talanrezges.wav');

% Specifikációk
xl = x(:,1);
N = floor(Fs/20);
window = hann(N+1);
noverlap = floor(Fs/40);

% Spektrogramm
figure;
subplot(2,1,1);
spectrogram(xl, window, noverlap, Fs, Fs, 'yaxis');
title('Spectrogram');
xlabel('Ido (s)');
ylabel('Frekvencia (kHz)');

% Az amplitúdók összege az idő függvényében
[~, F, T, P] = spectrogram(xl, window, noverlap, [], Fs);

% Az amplitúdók lineáris értékeinek összegzése
amplitudes = sum(sqrt(P), 1); % Az intenzitások négyzetgyökének összege

% Küszöbérték deklarálása
felso_kuszob = 0.5; % �?llítsd be a kívánt küszöbértéket

% Plot az amplitúdók időbeli változásáról
subplot(2,1,2);
plot(T, amplitudes); % Lineáris skálán
xlabel('Ido (s)');
ylabel('Osszes amplitudo');
title('Osszes frekvencia aplitudo osszege idoben');
hold on;

% Jelölés vörös négyzettel a küszöbértéket meghaladó értékeknél
above_threshold = amplitudes > felso_kuszob;
plot(T(above_threshold), amplitudes(above_threshold), 'rs', 'MarkerFaceColor', 'r');

hold off;
