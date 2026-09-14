% Jel betöltése
[x, Fs] = audioread('feladat3_erintesmentes_erzekelo.wav');

%%spectrogram
xl = x(:,1);
N = floor(Fs/12);
window = hann(N+1);
noverlap = floor(Fs/24);

%%pwelch
%%pwelch(xl,window,noverlap,20000,Fs);

%%spectogram
spectrogram(xl,window,noverlap,Fs,Fs);
xlim([0 1])

