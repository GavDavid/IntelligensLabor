%%feldat 1
%% hanglifel betoltese
[x,Fs] = audioread('.wav');

%%spectrogram
xl = x(:,1);
N = floor(Fs);
window = hann(N+1);
noverlap = floor(Fs/2);

%%pwelch
%%pwelch(xl,window,noverlap,20000,Fs);

%%spectogram
spectrogram(xl,window,noverlap,Fs,Fs);
xlim([0 0.5])