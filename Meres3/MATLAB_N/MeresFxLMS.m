clear;
clc;
close all;

[b, a, fs] = IIR();

figure;

[Hiir, W] = freqz(b, a, 4096, fs);

plot(W, 20*log10(abs(Hiir)));
grid on;
xlim([0 fs/2]);
ylim([-80 5]);

N  = 20000;     % a gerjesztés hossza [minta]
M  = 64;        % az adaptív FIR sz?r? együtthatóinak száma
mu = 0.005;     % bátorsági tényez?

x = randn(N, 1);          
y = filter(b, a, x);      

[e, w] = lms(mu, M, x, y);

figure;
subplot(2,1,1);
plot((0:N-1)/fs, 10*log10(movmean(e.^2, 200)));
grid on;
xlabel("Ido [s]");
ylabel("Négyzetes hiba [dB]");
title(sprintf("Az LMS algoritmus tanulási görbéje (\\mu = %g, M = %d) - BASELINE", mu, M));

subplot(2,1,2);
Hfir = freqz(w, 1, 4096, fs);

plot(W, 20*log10(abs(Hiir)), W, 20*log10(abs(Hfir)));
grid on;
xlim([0 fs/2]);
ylim([-100 5]);
legend("IIR sz?r?", "Identifikált FIR sz?r?");
xlabel("Frekvencia [Hz]");
ylabel("Amplitudó [dB]");

alfa = 0.01;
mu_nlms = 0.5;
[e, w] = nlms(mu_nlms, alfa, M, x, y);

figure;
subplot(2,1,1);
plot((0:N-1)/fs, 10*log10(movmean(e.^2, 200)));
grid on;
xlabel("Ido [s]");
ylabel("Négyzetes hiba [dB]");
title(sprintf("Az NLMS algoritmus tanulási görbéje (\\mu = %g, M = %d) - BASELINE", mu_nlms, M));

subplot(2,1,2);
Hfir = freqz(w, 1, 4096, fs);

plot(W, 20*log10(abs(Hiir)), W, 20*log10(abs(Hfir)));
grid on;
xlim([0 fs/2]);
ylim([-100 5]);
legend("IIR sz?r?", "Identifikált FIR sz?r?");
xlabel("Frekvencia [Hz]");
ylabel("Amplitudó [dB]");


s = [0; 1; 0; 0; 1];
%s=1;

s_y = filter(s,1, x);

M_c = 8;
mu_c = 0.02;
[~, c] = lms(mu_c, M_c, x, s_y);
disp('Valós s együtthatók:'); disp(s');
disp('Identifikált c együtthatók:'); disp(c');


mu_fxlms = 0.0005;
M_fx  = 256;

[e, w] = FxLMS(mu_fxlms, s, c, M_fx, x, y);

figure;
subplot(2,1,1);
plot((0:N-1)/fs, 10*log10(movmean(e.^2, 200)));
grid on;
xlabel("Ido [s]");
ylabel("Négyzetes hiba [dB]");
title(sprintf("Az FxLMS algoritmus tanulási görbéje (\\mu = %g, M = %d)", mu_fxlms, M_fx));

subplot(2,1,2);
Hfir = freqz(w, 1, 4096, fs);

plot(W, 20*log10(abs(Hiir)), W, 20*log10(abs(Hfir)));
grid on;
xlim([0 fs/2]);
ylim([-100 5]);
legend("IIR sz?r?", "Identifikált FIR sz?r?");
xlabel("Frekvencia [Hz]");
ylabel("Amplitudó [dB]");

