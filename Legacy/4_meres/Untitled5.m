close all;
clear;

%flag = detect_rattling_simple_ref('rattling.wav','chirp.wav');

mu = 0.5;
N = 100;
D = 200;
a = eps;

[x, fs] = audioread('rattle4.wav');
x = x(:,2);

delayed = [zeros(D,1);x(1:end-D)];

[e,w] = nlms(mu,a,N,delayed,x);

figure;
plot(x);
hold on;
plot(e);

figure;
spectrogram(e,(fs), round(0.97*fs),fs,fs);

s = spectrogram(e,(fs), round(0.97*fs),fs,fs);

prat = 10*log10(sum(abs(s).^2,1));

figure;
plot(prat);

flag = prat;
for i = 1:length(prat)
    if prat(i) > 55
        flag(i) = 1;
    else
        flag(i) = 0;
    end
end


timescale = 0.5+(length(x)/fs)*(0:length(prat)-1)/(length(prat));

figure;
spectrogram(x,(fs), round(0.97*fs),fs,fs);
hold on;
plot(11+flag,timescale,'r');




function [e,w] = nlms(mu,a, M, u, y)
   N = length(u);
   e = zeros(N, 1);
   w = zeros(M, N);
   x = zeros(M,1);
   for i = 1:N
       x = [u(i); x(1:end-1)];
       e(i) = y(i) - w(:,i).' * x;
       w(:,i+1) = w(:,i) + (mu/(x.'*x+a))*e(i)*x;
   end
end


