clear;


MeasName = 'meres5.wav';

[MeasData, MeasRate] = audioread(MeasName);

%% Spectrogram
figure(1)
spectrogram(MeasData, 4000, [], [], MeasRate, 'yaxis')
title('Spektrogram Csengő hangja')
xlabel('Idő [s]')
ylabel('Frekvencia [kHz]')

%% Hang generalas

fs = 44100;
T = 6;

t = 0:1/fs:T-1/fs;


f = [1400, 3400, 5600, 6900];
A = [1, 1, 1, 1];
tau = [3.5, 1.2, 0.6, 0.4];

f1 = 1400;
f2 = 3400;
f3 = 5600;
f4 = 6900;

x = zeros(size(t));

for i = 1:length(f)
    envelope = exp(-t/tau(i));
    
    component = A(i) .* envelope .* sin(2*pi*f(i)*t);
    
    x = x+component;
end

x = x/max(abs(x));
figure(2);
spectrogram(x, 4000, [], [], MeasRate, 'yaxis')
title('Spektrogram Csengő hangja előállítva')
xlabel('Idő [s]')
ylabel('Frekvencia [kHz]')
sound(x,fs);

