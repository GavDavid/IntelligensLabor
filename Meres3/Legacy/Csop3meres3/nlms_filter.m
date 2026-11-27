close all;

fc = 400;
fs = 2000;


[b_coef,a_coef] = ellip(4, 1, 60, fc/(fs/2));
N=4*2048;

x=randn(N,1) * 0.5;
y=filter(b_coef,a_coef,x);

mu = 0.9;
M = 500;
a = 0.12;

[e,w] = nlms(mu,a, M, x, y);
[H_iir, freq] = freqz(b_coef, a_coef, 512, fs);
[H_ellip, ~]   = freqz(w, 1, 512, fs);
 
figure('Name', 'Elliptikus sz?r? NLMS identifikációja');
subplot(2,1,1);
plot(freq, 20*log10(abs(H_iir)), 'b', freq, 20*log10(abs(H_ellip)), 'r--', 'LineWidth', 1.5);
grid on;
legend('Eredeti Elliptikus IIR', 'Identifikált FIR', 'Location', 'SouthWest');
xlabel('Frekvencia [Hz]');
ylabel('Amplitúdó [dB]');
title('Frekvencia-karakterisztika összehasonlítása');
 
subplot(2,1,2);
plot(e.^2, 'k');
grid on;
xlabel('Mintaszám [n]');
ylabel('Négyzetes hiba [dB]');
title('Adaptációs tranziens (Hibajel)');






%%
%[e,w] = lms(mu, M, x, y);
%[H_iir , w_freq] = freqz(b,a, 2048, fs); 
%[H_ellip , ~ ] = freqz(w, 1, 2048, fs);
%figure;
%plot(w_freq/pi, 20*log10(abs(H_iir)), 'b' , w_freq/pi, 20*log10(abs(H_ellip)), 'r--');
%xlabel("placeholder");
%ylabel("placeholder");
%subplot(w_freq/pi, 20*log10(abs(e)));

%figure;
%plot(x, 'g');
%hold on
%plot(y, 'b');
%subplot(2,1,1);

%figure;
%plot(w_freq/pi, 20*log10((e.^2 + e)));

function [e,w]=nlms(mu,a,M,x,y)
  N = length(x);
  e = zeros(N,1);
  w = zeros(M,1);
  for n = M:N
      x_vec = x(n:-1:n-M+1);
      y_hat = w' * x_vec;
      e(n) = y(n) - y_hat;
      norm_factor = a+(x_vec' * x_vec);
      w = w + (mu/norm_factor)*e(n)*x_vec;
%bemeneti paraméterek:
%mu: lépésköz (bátorsági tényez®) 1 × 1
%M: a sz¶r® együtthatóinak száma 1 × 1
%x: a sz¶r® bemenete N × 1
%y: a sz¶r® kimenete N × 1
%kimeneti változók:
%e: becslési hiba N × 1
%w: sz¶r®együtthatók M × 1
 end
end 
%2khz fs, 400 cutoff, 1db ripple, 60db elnyomas, elliptikus szuro