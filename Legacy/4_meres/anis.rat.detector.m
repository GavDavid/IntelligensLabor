[Y,FS]=audioread('rattling.wav');
y = Y(:,2);
X = y; 
%abs(fft(Y,FS));
spectrogram(X,(FS), round(0.97*FS),FS,FS);

%rattling
band = F > 150 & F < 4000;
Sb = S(band,:);

%energy band
energy = mean(Sb,1);
energy = energy / max(energy + eps);

%thresh
threshold = 0.3;
if max(energy) > threshold
    flag = 1;
else
    flag = 0;
end
fprintf("energy based rattling detected? %d\n",flag);
