clear;

GridFreq = 50; % [Hz]

MeasName = 'meres2.wav';

[MeasData, MeasRate] = audioread(MeasName);

%%Spectogram
figure(1)
spectrogram(MeasData, 8000, [], [], MeasRate, 'yaxis')

VentFreq = 43.74; % [Hz]

Slip = (GridFreq - VentFreq) / GridFreq * 100;

fprintf("A slip: %0.00f \n", Slip);





