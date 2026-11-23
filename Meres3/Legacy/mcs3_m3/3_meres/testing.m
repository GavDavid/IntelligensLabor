%Globals
fs = 48000;
fc = fs/20;
N = 10000;
M = 50;
mu1 = 0.001;
mu2 = 1.9;
alfa = eps;
u = wgn(N, 1, 0);

%IIR filter
[b,a] = butter(10, fc/(fs/2));
c = zeros(1, 100);
c(1) = 1;
h = filter(b, a, c);

y = filter(b, a, u);
[e1, w1] = lms(mu1, M, u, y);

figure(1);
plot(h);
hold on;
plot(w1(:,end));
grid on

[e2, w2] = nlms(mu2, alfa, M, u, y);

figure(2);
plot(h);
hold on;
plot(w2(:,end));
grid on