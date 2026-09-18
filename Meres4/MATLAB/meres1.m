clear;
close all;
clc;

Sensi = 9.8; % [pC/g] / 0.998 [pC/ms-2]
Gain = 0.1; % [Volt/Unit out]
MeasName = 'meres1_mono.wav';

[MeasData, MeasRate] = audioread(MeasName);

%% Spektrogram
windowLength = 15000;
[~, Frequency, Time, Power] = spectrogram(...
	MeasData, windowLength, [], windowLength, MeasRate);

figure(1)
imagesc(Time, Frequency / 1000, 10 * log10(Power));
axis xy
xlabel('Idő [s]')
ylabel('Frekvencia [kHz]')
title('A ventilátor rezgésjelének spektrogramja')
colorbar
clim([-150 -70])
ylim([0 3])
grid on


%% A mérési jel átszámítása gyorsulásértékre
AccData = MeasData / (Gain * 0.998) * (0.04 / 0.0054);
TimeAcc = (0:length(AccData) - 1) / MeasRate;

figure(2)
plot(TimeAcc, AccData)
xlabel('Idő [s]')
ylabel('Gyorsulás [m/s^2]')
title('A rezgésjel nagysága')
grid on


