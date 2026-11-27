clear;
close all;

% LMS params
mu = 1; % NLMS 1.9, 2.0, 2.1
M = 100;

% params
N = 10000;
pow = 1;
fs = 48000;
fc = 2400 / (fs/2);

% input
u = wgn(N, 1, pow);

% filter
[b, a] = butter(10, fc);
y = filter(b, a, u); % filtered input
[h_b, t_b] = impz(b, a);

% lms
%[e, w] = lms(mu, M, u, y);
[e, w] = nlms(mu, eps, M, u, y);
[h_lms, t_lms] = impz(w, 1);

figure(1)
plot(e)

figure(2)
hold on;
grid on;
plot(t_b, h_b)
plot(t_lms, h_lms);