[Y,FS]=audioread('rattling.wav');
y = Y(:,2);
X = y; 
%abs(fft(Y,FS));
spectrogram(X,(FS), round(0.97*FS),FS,FS);
