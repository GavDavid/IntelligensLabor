[y, fs]=audioread('venti_indul.wav');
y = y(:,2);
N = length(y);
f = (0:(fs/N):(fs));
f = f(1:end-1)';
%w = hann(N);
%y = y .* w;

%figure(1)
%plot(y)

%figure(2)
%hold on;
%plot(f, db(abs(fft(y))));
%grid on;
%xlim([0 fs/2])
%hold off;

window = hann(fs);
figure(3)
spectrogram(y, window, round(0.75 * length(window)), fs, fs);

slip = (50 - 44) / 50;