clear;
close all;
clc;

fs = 48000;
N = 4;
fc = 4000;
Rp = 2;

[b, a] = cheby1(N, Rp, fc/(fs/2));

[H, f] = freqz(b, a, 2^16, fs);
figure;
plot(f, 20*log10(abs(H)));
grid on;
xlim([0 fs/2]);
ylim([-80 5]);
xlabel('Frekvencia [Hz]');
ylabel('Amplitudo [dB]');
title('Negyedrendu Csebisev I szuro atvitele', 'Color', 'k');
set(gcf, 'Color', 'w');
set(gca, 'Color', 'w', 'XColor', 'k', 'YColor', 'k');

script_dir = fileparts(mfilename('fullpath'));
picture_dir = fullfile(script_dir, '..', 'Kepek');
saveas(gcf, fullfile(picture_dir, 'Cheby1_atvitel.jpg'));

% Osszehasonlitas a Butterworth szurovel
[bB, aB] = butter(N, 12000/(fs/2));
[HB, fB] = freqz(bB, aB, 2^16, fs);
figure;
plot(fB/12000, 20*log10(abs(HB)));
hold on;
plot(f/fc, 20*log10(abs(H)));
plot([1 1], [-80 5], 'k--');
grid on;
xlim([0 2]);
ylim([-80 5]);
xlabel('Normalizalt frekvencia (f/f_c)');
ylabel('Amplitudo [dB]');
legend('Butterworth, f_c = 12 kHz', 'Csebisev I, f_c = 4 kHz', 'f/f_c = 1', 'Location', 'southwest');
title('Butterworth es Csebisev I szuro osszehasonlitasa', 'Color', 'k');
set(gcf, 'Color', 'w');
set(gca, 'Color', 'w', 'XColor', 'k', 'YColor', 'k');
saveas(gcf, fullfile(picture_dir, 'Butterworth_Cheby1_osszehasonlitas.jpg'));
