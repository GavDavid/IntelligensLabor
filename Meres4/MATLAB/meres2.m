clear;

GridFreq = 50; % [Hz]

MeasName = 'meres2.wav';

[MeasData, MeasRate] = audioread(MeasName);

%% Spectrogram
figure(1)
spectrogram(MeasData, 40000, [], [], MeasRate, 'yaxis')
title('Spektrogram – mérés 2')
xlabel('Idő [s]')
ylabel('Frekvencia [Hz]')

VentFreq = 43.74; % [Hz]

Slip = (GridFreq - VentFreq) / GridFreq * 100;

fprintf("A slip: %0.00f \n", Slip);





