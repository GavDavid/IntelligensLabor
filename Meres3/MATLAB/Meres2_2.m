%% A 2.2 feladat: az NLMS algoritmus vizsgálata
clear;
clc;
close all;

scriptDir  = fileparts(mfilename("fullpath"));
pictureDir = fullfile(scriptDir, "..", "Kepek");

rng(1);

[b, a, fs] = tervezIIR();
[Hiir, f] = freqz(b, a, 4096, fs);

N  = 20000;
M  = 32;
aReg = 1e-6;           % regularizáló konstans
t  = (0:N-1)/fs*1000;  % időtengely [ms]

x0 = randn(N, 1);      % egységnyi teljesítményű fehér zaj

%% A gerjesztőjel teljesítményének hatása (LMS és NLMS összevetése)
sigmaList  = [0.25, 0.5, 1, 2];   % a gerjesztés szórása
lineStyles = ["-", "--", "-.", ":"];
lineWidths = [2.6, 2.0, 1.5, 1.2];
muLms  = 0.002;
muNlms = 0.1;

ujAbra();
tiledlayout(2, 1);
axLms  = nexttile; hold on;
axNlms = nexttile; hold on;
for k = 1:numel(sigmaList)
    x = sigmaList(k) * x0;
    y = filter(b, a, x);

    [eL, ~] = lms(muLms, M, x, y);
    [eN, ~] = nlms(muNlms, aReg, M, x, y);

    % A hibát a kimenet teljesítményére normáljuk, hogy a görbék
    % összevethetők legyenek
    Py = mean(y.^2);
    plot(axLms,  t, 10*log10(movmean(eL.^2, 200) / Py), ...
        "DisplayName", sprintf("\\sigma_x = %g", sigmaList(k)));
    plot(axNlms, t, 10*log10(movmean(eN.^2, 200) / Py), ...
        "LineStyle", lineStyles(k), "LineWidth", lineWidths(k), ...
        "DisplayName", sprintf("\\sigma_x = %g", sigmaList(k)));
end
title(axLms,  sprintf("LMS (\\mu = %g)", muLms));
title(axNlms, sprintf("NLMS (\\mu = %g, a = %g)", muNlms, aReg));
for ax = [axLms, axNlms]
    grid(ax, "on");
    xlabel(ax, "Idő [ms]");
    ylabel(ax, "Normált hiba [dB]");
    legend(ax, "Location", "northeast");
end
saveas(gcf, fullfile(pictureDir, "NLMS_teljesitmeny.jpg"));

%% A bátorsági tényező hatása az NLMS algoritmusnál
x = x0;
y = filter(b, a, x);
muList = [0.02, 0.1, 1, 1.8];

ujAbra();
hold on;
for k = 1:numel(muList)
    [e, ~] = nlms(muList(k), aReg, M, x, y);
    plot(t, 10*log10(movmean(e.^2, 200)), ...
        "DisplayName", sprintf("\\mu = %g", muList(k)));
    fprintf("NLMS mu = %-5g: állandósult hiba = %.2f dB\n", ...
        muList(k), 10*log10(mean(e(end-2000:end).^2)));
end
grid on;
xlabel("Idő [ms]");
ylabel("Négyzetes hiba [dB]");
legend("Location", "northeast");
title(sprintf("A bátorsági tényező hatása az NLMS-nél (M = %d)", M));
saveas(gcf, fullfile(pictureDir, "NLMS_mu_hatasa.jpg"));

%% Az LMS és az NLMS identifikáció eredményének összevetése
[eL, wL] = lms(0.005, M, x, y);
[eN, wN] = nlms(muNlms, aReg, M, x, y);
HL = freqz(wL, 1, 4096, fs);
HN = freqz(wN, 1, 4096, fs);

ujAbra();
plot(f, 20*log10(abs(Hiir)), "k", "LineWidth", 2);
hold on;
plot(f, 20*log10(abs(HL)), "--", "LineWidth", 1.5);
plot(f, 20*log10(abs(HN)), "-.", "LineWidth", 1.5);
grid on;
xlim([0 fs/2]);
ylim([-80 5]);
xlabel("Frekvencia [Hz]");
ylabel("Amplitúdó [dB]");
legend("IIR szűrő", "LMS (\mu = 0.005)", sprintf("NLMS (\\mu = %g)", muNlms), ...
    "Location", "southwest");
title("Az LMS és az NLMS identifikáció eredménye");
saveas(gcf, fullfile(pictureDir, "NLMS_LMS_osszehasonlitas.jpg"));

fprintf("LMS  átviteli hiba: %.2f dB\n", 10*log10(sum(abs(Hiir - HL).^2) / sum(abs(Hiir).^2)));
fprintf("NLMS átviteli hiba: %.2f dB\n", 10*log10(sum(abs(Hiir - HN).^2) / sum(abs(Hiir).^2)));

function fig = ujAbra()
% Világos témájú ábra létrehozása a jegyzőkönyvhöz (R2025a-tól)
if exist("theme", "file")
    fig = figure("Theme", "light");
else
    fig = figure;
end
set(fig, "Color", "w");
end
