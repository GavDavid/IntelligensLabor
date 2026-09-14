clear
close all

% 1. feladat

% [y, fs] = audioread('D:\4_meres\mintavetel2.wav');

[y2, fs2] = audioread('D:\4_meres\mintavetel_felfutas.wav');


y = y(:,2);
y2 = y2(:,2);

N = length(y);
Y = 20*log10(abs(fft(y)));
f = (0:(fs/N):(fs/2));

figure(1);
plot(f, Y(1:length(f)));
grid on

%Spektrogram
figure(2)
spectrogram(y, fs, round(0.9*fs), fs, fs);

figure(3)
spectrogram(y2, fs2, round(0.9*fs2), fs2, fs2);


Yrms = rms(y);
Urms = 78*10^-3;

amp = (Urms + Yrms)/2;

g = amp /8.15;

gyorsulas = g * 9.807;

% 2. feladat

