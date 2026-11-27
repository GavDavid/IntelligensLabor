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
[e1, w1] = new_lms(mu1, M, u, y);

figure(1);
plot(e1);

figure(2)
        
[h1, f1] = freqz(b, a, 10240, fs);
[h2, f2] = freqz(w1, 1, 10240, fs);
        
semilogx(f1, db(abs(h1)), 'LineWidth', 2);
hold on
semilogx(f2, db(abs(h2)), 'LineWidth', 2);
        %xline(8e3, 'LineWidth', 2)
grid on
 xlabel('Frequency [Hz]')
ylabel('Amplitude [dB]')
ylim([-50, 10]);
hold off

[e2, w2] = new_nlms(mu2, alfa, M, u, y);

figure(3);
plot(e2);

figure(4)
        
[h3, f3] = freqz(b, a, 10240, fs);
[h4, f4] = freqz(w2, 1, 10240, fs);
        
semilogx(f3, db(abs(h3)), 'LineWidth', 2);
hold on
semilogx(f4, db(abs(h4)), 'LineWidth', 2);
        %xline(8e3, 'LineWidth', 2)
grid on
xlabel('Frequency [Hz]')
ylabel('Amplitude [dB]')
        % ylim([-50, 10]);
hold off