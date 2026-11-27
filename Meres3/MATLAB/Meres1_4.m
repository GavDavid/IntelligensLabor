%% Az 1.4 feladat: a bátorsági tényező és a szűrőhossz hatása
clear;
clc;
close all;

scriptDir  = fileparts(mfilename("fullpath"));
pictureDir = fullfile(scriptDir, "..", "Kepek");

rng(1);

[b, a, fs] = tervezIIR();

N = 20000;
x = randn(N, 1);
y = filter(b, a, x);

[Hiir, f] = freqz(b, a, 4096, fs);

%% A bátorsági tényező hatása a konvergenciára (rögzített M mellett)
M      = 32;
muList = [0.0005, 0.002, 0.01, 0.028];

ujAbra();
hold on;
for k = 1:numel(muList)
    [e, ~] = lms(muList(k), M, x, y);
    plot((0:N-1)/fs*1000, 10*log10(movmean(e.^2, 200)), ...
        "DisplayName", sprintf("\\mu = %g", muList(k)));
    fprintf("mu = %-7g M = %d: állandósult hiba = %.2f dB\n", ...
        muList(k), M, 10*log10(mean(e(end-2000:end).^2)));
end
grid on;
xlabel("Idő [ms]");
ylabel("Négyzetes hiba [dB]");
legend("Location", "northeast");
title(sprintf("A bátorsági tényező hatása (M = %d)", M));
saveas(gcf, fullfile(pictureDir, "LMS_mu_hatasa.jpg"));

%% A szűrőhossz hatása az approximáció jóságára (rögzített mu mellett)
mu    = 0.002;
MList = [4, 8, 16, 32, 64];

figTanulas = ujAbra();
hold on;
figAtvitel = ujAbra();
plot(f, 20*log10(abs(Hiir)), "k", "LineWidth", 2, "DisplayName", "IIR szűrő");
hold on;

for k = 1:numel(MList)
    [e, w] = lms(mu, MList(k), x, y);
    Hfir = freqz(w, 1, 4096, fs);

    figure(figTanulas);
    plot((0:N-1)/fs*1000, 10*log10(movmean(e.^2, 200)), ...
        "DisplayName", sprintf("M = %d", MList(k)));

    figure(figAtvitel);
    plot(f, 20*log10(abs(Hfir)), "--", "DisplayName", sprintf("M = %d", MList(k)));

    relErrDb = 10*log10(sum(abs(Hiir - Hfir).^2) / sum(abs(Hiir).^2));
    fprintf("mu = %g M = %-3d: állandósult hiba = %.2f dB, átviteli hiba = %.2f dB\n", ...
        mu, MList(k), 10*log10(mean(e(end-2000:end).^2)), relErrDb);
end

figure(figTanulas);
grid on;
xlabel("Idő [ms]");
ylabel("Négyzetes hiba [dB]");
legend("Location", "northeast");
title(sprintf("A szűrőhossz hatása a konvergenciára (\\mu = %g)", mu));
saveas(gcf, fullfile(pictureDir, "LMS_M_hatasa.jpg"));

figure(figAtvitel);
grid on;
xlim([0 fs/2]);
ylim([-80 5]);
xlabel("Frekvencia [Hz]");
ylabel("Amplitúdó [dB]");
legend("Location", "southwest");
title(sprintf("Az identifikált FIR szűrők átvitele (\\mu = %g)", mu));
saveas(gcf, fullfile(pictureDir, "LMS_M_atvitel.jpg"));

function fig = ujAbra()
% Világos témájú ábra létrehozása a jegyzőkönyvhöz (R2025a-tól)
if exist("theme", "file")
    fig = figure("Theme", "light");
else
    fig = figure;
end
set(fig, "Color", "w");
end
