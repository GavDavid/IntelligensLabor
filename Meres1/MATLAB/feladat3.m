clear;
close all;
clc;

fs = 48000;
fc = 12000;
N = 4;

[b, a] = butter(N, fc/(fs/2));

[H, f] = freqz(b, a, 2^16, fs);
plot(f, 20*log10(abs(H)));
grid on;
xlim([0 fs/2]);
ylim([-80 5]);
xlabel('Frekvencia [Hz]');
ylabel('Amplitudo [dB]');
title('Negyedrendu Butterworth szuro atvitele', 'Color', 'k');
set(gcf, 'Color', 'w');
set(gca, 'Color', 'w', 'XColor', 'k', 'YColor', 'k');

script_dir = fileparts(mfilename('fullpath'));
picture_dir = fullfile(script_dir, '..', 'Kepek');
source_dir = fullfile(script_dir, '..', 'CrossCore', 'BlackFin_FIR_fract', 'src');
saveas(gcf, fullfile(picture_dir, 'Butterworth_atvitel.jpg'));
