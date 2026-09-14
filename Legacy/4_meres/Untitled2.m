[Y,FS]=audioread('rattling.wav');
y = Y(:,2);
X = y; 
%abs(fft(Y,FS));
spectrogram(X,(FS), round(0.97*FS),FS,FS);

%rattling
band = FS > 150 & FS < 4000;


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
