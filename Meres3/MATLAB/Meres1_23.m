%% Az 1.2-1.3 feladat: IIR szűrő identifikálása az LMS algoritmussal
clear;
clc;
close all;

scriptDir  = fileparts(mfilename("fullpath"));
pictureDir = fullfile(scriptDir, "..", "Kepek");

%% 1.2: az IIR szűrő tervezése
[b, a, fs] = tervezIIR();

[Hiir, f] = freqz(b, a, 4096, fs);

ujAbra();
plot(f, 20*log10(abs(Hiir)));
grid on;
xlim([0 fs/2]);
ylim([-80 5]);
xlabel("Frekvencia [Hz]");
ylabel("Amplitúdó [dB]");
title("A tervezett IIR szűrő amplitúdómenete");
saveas(gcf, fullfile(pictureDir, "IIR_atvitel.jpg"));

%% 1.3: identifikáció Gauss-eloszlású fehér zaj gerjesztéssel
N  = 20000;     % a gerjesztés hossza [minta]
M  = 32;        % az adaptív FIR szűrő együtthatóinak száma
mu = 0.005;     % bátorsági tényező

x = randn(N, 1);          % egységnyi szórású fehér zaj
y = filter(b, a, x);      % az identifikálandó rendszer kimenete

[e, w] = lms(mu, M, x, y);

% Tanulási görbe: a négyzetes hiba mozgóátlaga
ujAbra();
plot((0:N-1)/fs*1000, 10*log10(movmean(e.^2, 200)));
grid on;
xlabel("Idő [ms]");
ylabel("Négyzetes hiba [dB]");
title(sprintf("Az LMS algoritmus tanulási görbéje (\\mu = %g, M = %d)", mu, M));
saveas(gcf, fullfile(pictureDir, "LMS_tanulasi_gorbe.jpg"));

% Az IIR szűrő és az identifikált FIR szűrő átvitelének összehasonlítása
Hfir = freqz(w, 1, 4096, fs);

ujAbra();
plot(f, 20*log10(abs(Hiir)), "LineWidth", 1.5);
hold on;
plot(f, 20*log10(abs(Hfir)), "--", "LineWidth", 1.5);
grid on;
xlim([0 fs/2]);
ylim([-80 5]);
xlabel("Frekvencia [Hz]");
ylabel("Amplitúdó [dB]");
legend("IIR szűrő", "Identifikált FIR szűrő", "Location", "southwest");
title("Az IIR szűrő és az identifikált FIR szűrő átvitele");
saveas(gcf, fullfile(pictureDir, "LMS_atvitel_osszehasonlitas.jpg"));

% Az impulzusválaszok összehasonlítása
h = impz(b, a, M);

ujAbra();
stem(0:M-1, h, "filled");
hold on;
stem(0:M-1, w);
grid on;
xlabel("n [minta]");
ylabel("Amplitúdó");
legend("IIR impulzusválasz", "Identifikált FIR együtthatók", "Location", "northeast");
title("Az impulzusválaszok összehasonlítása");
saveas(gcf, fullfile(pictureDir, "LMS_impulzusvalasz.jpg"));

% Számszerű jellemzők
steadyMse = mean(e(end-2000:end).^2);
relErrDb  = 10*log10(sum(abs(Hiir - Hfir).^2) / sum(abs(Hiir).^2));
fprintf("Állandósult négyzetes hiba: %.4g (%.2f dB)\n", steadyMse, 10*log10(steadyMse));
fprintf("Az átvitel relatív hibája: %.2f dB\n", relErrDb);

function fig = ujAbra()
% Világos témájú ábra létrehozása a jegyzőkönyvhöz (R2025a-tól)
if exist("theme", "file")
    fig = figure("Theme", "light");
else
    fig = figure;
end
set(fig, "Color", "w");
end
