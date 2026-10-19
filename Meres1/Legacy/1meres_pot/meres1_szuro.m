rp = 2;           % Passband ripple
rs = 32;          % Stopband ripple
fs = 48000;        % Sampling frequency
f = [5000 6000];    % Cutoff frequencies
a = [1 0];        % Desired amplitudes

dev = [(10^(rp/20)-1)/(10^(rp/20)+1)  10^(-rs/20)]; 
[n,fo,ao,w] = firpmord(f,a,dev,fs);
b = firpm(n,fo,ao,w);
freqz(b,1,1024,fs)
title('Lowpass Filter Designed to Specifications')

fid = fopen('fir_coeffs.dat','w');
fprintf(fid,'%f,\n', b);
fclose(fid);