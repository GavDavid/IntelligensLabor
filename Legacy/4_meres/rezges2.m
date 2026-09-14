clear
close all

[y, fs] = audioread('D:\4_meres\berezges.wav');
[y2, fs2] = audioread('D:\4_meres\rezges_nelkuli.wav');


y = y(:,2);
y2 = y2(:,2);

figure(2)
spect1 = spectrogram(y, fs, round(0.9*fs), fs, fs);

figure(3)
spect2 = spectrogram(y2, fs2, round(0.9*fs2), fs2, fs2);

min_rows = min(size(spect1,1), size(spect2,1));   
min_cols = min(size(spect1,2), size(spect2,2));  

spect1_cut = spect1(1:min_rows, 1:min_cols);
spect2_cut = spect2(1:min_rows, 1:min_cols);


absSpect = abs(abs(spect2_cut) - abs(spect1_cut));

imagesc(log10(absSpect));

rms_row = zeros(min_cols, 1);
rezges = zeros(min_cols, 1);
for c = 1:min_cols 
   rms_row(c) = sqrt(sum(absSpect(:,c).^2));
end

for i = 1:min_cols
    if 4000 <= rms_row(i)
       rezges(i,1) = 1;
    end    
end








Urms = 45*10^-3;