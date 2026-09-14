clear;

Sensi = 9.8; % [pC/g] / 0.998 [pC/ms-2]
Gain = 0.1; % [Volt/Unit out]
MeasName = 'meres1_mono.wav';

[MeasData, MeasRate] = audioread(MeasName);

%%Spectogram
figure(1)
spectrogram(MeasData, 15000, [], [], MeasRate, 'yaxis')


%%Data converted to acceleration values
AccData = MeasData / (0.1 * 0.998) * (0.04 / 0.0054);
figure(2)
plot(AccData)


