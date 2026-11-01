clear;
close all;
clc;

fs = 48000;

% Set 4 egyutthatoi a meresi utmutatobol
b = [0.499814997569879, -1.99925999027952, 2.99888998541927, ...
    -1.99925999027952, 0.499814997569879];
a = [1, -2.63862774389125, 2.76930978615149, ...
    -1.33928076126520, 0.249821669810126];

[H,f] = freqz(b, a, 2^16, fs);
plot(f, 20*log10(abs(H)));
grid on;
ylim([-100 5]);
xlabel('Frekvencia [Hz]');
ylabel('Amplitudo [dB]');
title('4. IIR szuro atvitele', 'Color', 'k');
set(gcf, 'Color', 'w');
set(gca, 'Color', 'w', 'XColor', 'k', 'YColor', 'k');
saveas(gcf, '../Kepek/IIR_atvitel.jpg');

p = roots(a);
disp(max(abs(p)));

x = zeros(1, 100);
x(1) = 1;
y = filter(b, a, x);

figure;
stem(0:39, y(1:40));
xlabel('Mintaszam');
ylabel('Amplitudo');
title('IIR szuro impulzusvalasza', 'Color', 'k');
set(gcf, 'Color', 'w');
set(gca, 'Color', 'w', 'XColor', 'k', 'YColor', 'k');
saveas(gcf, '../Kepek/IIR_impulzus.jpg');
