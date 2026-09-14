%%feldat 3
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Jel betöltése
[signal, fs] = audioread('feladat3_talanrezges.wav');

% Fourier-transzformáció a frekvenciaspektrumhoz
N = length(signal);
f = (0:N-1)*(fs/N); % Frekvenciavektor
fft_signal = fft(signal);

% Amplitúdóspektrum kiszámítása
amplitude = abs(fft_signal/N);

% Plot az amplitúdóspektrumra
%figure;
%plot(f(1:floor(N/2)), amplitude(1:floor(N/2))); % Csak a pozitív frekvenciák
%xlabel('Frekvencia (Hz)');
%ylabel('Amplitúdó');
%title('A rezgésjel amplitúdóspektruma');

% Bemeneti feszültség és gyorsulásjel közötti amplitúdómenet elemzése
[input_signal, fs_input] = audioread('feladat3_chirp.wav');

% Ellenőrizzük, hogy a két jel azonos hosszúságú-e, ha nem, vágjuk a rövidebbre
min_len = min(length(signal), length(input_signal));
signal = signal(1:min_len);
input_signal = input_signal(1:min_len);

% Fourier-transzformáció a bemeneti jelre
fft_input_signal = fft(input_signal);
amplitude_input = abs(fft_input_signal/min_len);

% Amplitúdómenet
amplitude_ratio = amplitude(1:floor(min_len/2)) ./ amplitude_input(1:floor(min_len/2));

% Plot az amplitúdómenetre
figure;
plot(f(1:floor(min_len/2)), amplitude_ratio);
xlim([0 2000])
xlabel('Frekvencia (Hz)');
ylabel('Amplitudomenet');
title('Bemeneti feszultseg es gyorsulasjel kozotti amplitudomenet');

