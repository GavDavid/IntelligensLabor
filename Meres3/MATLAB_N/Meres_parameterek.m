%% Az 1.2-1.4 és 2.2 feladatok ábráinak generálása az elliptikus IIR szűrővel
clear;
clc;
close all;

scriptDir  = fileparts(mfilename("fullpath"));
pictureDir = fullfile(scriptDir, "..", "Kepek");

rng(1);

[b, a, fs] = IIR();
[Hiir, f] = freqz(b, a, 4096, fs);

N = 20000;
t = (0:N-1).' / fs;    % időtengely [s]
x0 = randn(N, 1);
y0 = filter(b, a, x0);

%% 1.2: A tervezett elliptikus IIR szűrő amplitúdómenete
fig = ujAbra();
plot(f, 20*log10(abs(Hiir)), "LineWidth", 1.5);
grid on;
xlim([0 fs/2]);
ylim([-90 5]);
xlabel("Frekvencia [Hz]");
ylabel("Amplitúdó [dB]");
title("A tervezett 4. rendű elliptikus IIR szűrő amplitúdómenete");
exportgraphics(fig, fullfile(pictureDir, "IIR_ellip_atvitel.jpg"), "Resolution", 200);

%% 1.3: LMS identifikáció (baseline: M = 64, mu = 0.005)
M = 64;
mu = 0.005;
[eL, wL] = lms(mu, M, x0, y0);
HL = freqz(wL, 1, 4096, fs);

fig = ujAbra();
plot(t, 10*log10(movmean(eL.^2, 200)), "LineWidth", 1.2);
grid on;
xlim([0 t(end)]);
ylim([-85 5]);
xlabel("Idő [s]");
ylabel("Négyzetes hiba [dB]");
title(sprintf("Az LMS algoritmus tanulási görbéje (\\mu = %g, M = %d)", mu, M));
exportgraphics(fig, fullfile(pictureDir, "LMS_ellip_tanulasi_gorbe.jpg"), "Resolution", 200);

fig = ujAbra();
plot(f, 20*log10(abs(Hiir)), "LineWidth", 1.6);
hold on;
plot(f, 20*log10(abs(HL)), "--", "LineWidth", 1.4);
grid on;
xlim([0 fs/2]);
ylim([-90 5]);
xlabel("Frekvencia [Hz]");
ylabel("Amplitúdó [dB]");
legend("Elliptikus IIR szűrő", "Identifikált FIR szűrő", "Location", "southwest");
title(sprintf("Az IIR szűrő és az LMS-sel identifikált FIR szűrő átvitele (M = %d)", M));
exportgraphics(fig, fullfile(pictureDir, "LMS_ellip_atvitel.jpg"), "Resolution", 200);

h = impz(b, a, M);
fig = ujAbra();
stem(0:M-1, h, "filled", "MarkerSize", 4);
hold on;
stem(0:M-1, wL, "MarkerSize", 5);
grid on;
xlim([-1 M]);
xlabel("n [minta]");
ylabel("Amplitúdó");
legend("IIR impulzusválasz", "Identifikált FIR együtthatók", "Location", "northeast");
title("Az IIR szűrő impulzusválasza és az identifikált FIR együtthatók");
exportgraphics(fig, fullfile(pictureDir, "LMS_ellip_impulzusvalasz.jpg"), "Resolution", 200);

fprintf("1.3 Baseline LMS: steadyMSE = %.2f dB, relErr = %.2f dB\n", ...
    10*log10(mean(eL(end-2000:end).^2)), ...
    10*log10(sum(abs(Hiir - HL).^2) / sum(abs(Hiir).^2)));

%% 1.4a: A bátorsági tényező hatása (M = 64)
muList = [0.0005, 0.002, 0.005, 0.012, 0.015];
fig = ujAbra();
hold on;
for k = 1:numel(muList)
    [e, ~] = lms(muList(k), M, x0, y0);
    plot(t, 10*log10(movmean(e.^2, 200)), "LineWidth", 1.2, ...
        "DisplayName", sprintf("\\mu = %g", muList(k)));
    fprintf("1.4 LMS mu=%-7g M=%d: steadyMSE = %.2f dB\n", ...
        muList(k), M, 10*log10(mean(e(end-2000:end).^2)));
end
grid on;
xlim([0 t(end)]);
ylim([-85 25]);
xlabel("Idő [s]");
ylabel("Négyzetes hiba [dB]");
legend("Location", "northeast");
title(sprintf("A bátorsági tényező hatása az LMS konvergenciájára (M = %d)", M));
exportgraphics(fig, fullfile(pictureDir, "LMS_ellip_mu_hatasa.jpg"), "Resolution", 200);

%% 1.4b: A szűrőhossz hatása (mu = 0.002)
muFix = 0.002;
MList = [8, 16, 32, 64, 128];

figT = ujAbra();
hold on;
figA = ujAbra();
plot(f, 20*log10(abs(Hiir)), "k", "LineWidth", 2, "DisplayName", "Elliptikus IIR szűrő");
hold on;

for k = 1:numel(MList)
    [e, w] = lms(muFix, MList(k), x0, y0);
    Hfir = freqz(w, 1, 4096, fs);

    figure(figT);
    plot(t, 10*log10(movmean(e.^2, 200)), "LineWidth", 1.2, ...
        "DisplayName", sprintf("M = %d", MList(k)));

    figure(figA);
    plot(f, 20*log10(abs(Hfir)), "--", "LineWidth", 1.3, ...
        "DisplayName", sprintf("M = %d", MList(k)));

    relErrDb = 10*log10(sum(abs(Hiir - Hfir).^2) / sum(abs(Hiir).^2));
    fprintf("1.4 LMS mu=%g M=%-3d: steadyMSE = %.2f dB, relErr = %.2f dB\n", ...
        muFix, MList(k), 10*log10(mean(e(end-2000:end).^2)), relErrDb);
end

figure(figT);
grid on;
xlim([0 t(end)]);
ylim([-155 5]);
xlabel("Idő [s]");
ylabel("Négyzetes hiba [dB]");
legend("Location", "northeast");
title(sprintf("A szűrőhossz hatása az LMS konvergenciájára (\\mu = %g)", muFix));
exportgraphics(figT, fullfile(pictureDir, "LMS_ellip_M_hatasa.jpg"), "Resolution", 200);

figure(figA);
grid on;
xlim([0 fs/2]);
ylim([-90 5]);
xlabel("Frekvencia [Hz]");
ylabel("Amplitúdó [dB]");
legend("Location", "southwest");
title(sprintf("Különböző hosszúságú identifikált FIR szűrők átvitele (\\mu = %g)", muFix));
exportgraphics(figA, fullfile(pictureDir, "LMS_ellip_M_atvitel.jpg"), "Resolution", 200);

%% 2.2a: Gerjesztőjel-teljesítmény hatása (fele, eredeti, dupla bemenet)
sigmaList  = [0.5, 1, 2];
lineStyles = ["-", "--", ":"];
lineWidths = [2.4, 1.8, 1.5];
muLms  = 0.005;
muNlms = 0.5;
alfa   = 0.01;

fig = ujAbra([100 100 840 620]);
tiledlayout(2, 1, "TileSpacing", "compact", "Padding", "compact");
axL = nexttile; hold on;
axN = nexttile; hold on;

for k = 1:numel(sigmaList)
    x = sigmaList(k) * x0;
    y = filter(b, a, x);
    Py = mean(y.^2);

    [eL_s, ~] = lms(muLms, M, x, y);
    [eN_s, ~] = nlms(muNlms, alfa, M, x, y);

    errL = 10*log10(movmean(eL_s.^2, 200) / Py);
    errL(~isfinite(errL)) = NaN;
    errN = 10*log10(movmean(eN_s.^2, 200) / Py);

    plot(axL, t, errL, "LineWidth", 1.4, ...
        "DisplayName", sprintf("\\sigma_x = %g", sigmaList(k)));
    plot(axN, t, errN, "LineStyle", lineStyles(k), "LineWidth", lineWidths(k), ...
        "DisplayName", sprintf("\\sigma_x = %g", sigmaList(k)));
end

title(axL, sprintf("LMS (\\mu = %g, M = %d)", muLms, M));
ylim(axL, [-80 40]);
title(axN, sprintf("NLMS (\\mu = %g, a = %g, M = %d)", muNlms, alfa, M));
ylim(axN, [-80 5]);
for ax = [axL, axN]
    grid(ax, "on");
    xlim(ax, [0 t(end)]);
    xlabel(ax, "Idő [s]");
    ylabel(ax, "Normált hiba [dB]");
    legend(ax, "Location", "northeast");
end
exportgraphics(fig, fullfile(pictureDir, "NLMS_ellip_teljesitmeny.jpg"), "Resolution", 200);

%% 2.2b: A bátorsági tényező hatása az NLMS algoritmusnál
muNlmsList = [0.05, 0.2, 0.5, 1.0, 1.8];
fig = ujAbra();
hold on;
for k = 1:numel(muNlmsList)
    [e, ~] = nlms(muNlmsList(k), alfa, M, x0, y0);
    plot(t, 10*log10(movmean(e.^2, 200)), "LineWidth", 1.2, ...
        "DisplayName", sprintf("\\mu = %g", muNlmsList(k)));
    fprintf("2.2 NLMS mu=%-5g: steadyMSE = %.2f dB\n", ...
        muNlmsList(k), 10*log10(mean(e(end-2000:end).^2)));
end
grid on;
xlim([0 t(end)]);
ylim([-85 5]);
xlabel("Idő [s]");
ylabel("Négyzetes hiba [dB]");
legend("Location", "northeast");
title(sprintf("A bátorsági tényező hatása az NLMS-nél (M = %d, a = %g)", M, alfa));
exportgraphics(fig, fullfile(pictureDir, "NLMS_ellip_mu_hatasa.jpg"), "Resolution", 200);

%% 2.2c: Az LMS és az NLMS identifikáció összevetése
[~, wN] = nlms(muNlms, alfa, M, x0, y0);
HN = freqz(wN, 1, 4096, fs);

fig = ujAbra();
plot(f, 20*log10(abs(Hiir)), "k", "LineWidth", 2);
hold on;
plot(f, 20*log10(abs(HL)), "--", "LineWidth", 1.5);
plot(f, 20*log10(abs(HN)), "-.", "LineWidth", 1.5);
grid on;
xlim([0 fs/2]);
ylim([-90 5]);
xlabel("Frekvencia [Hz]");
ylabel("Amplitúdó [dB]");
legend("Elliptikus IIR szűrő", sprintf("LMS (\\mu = %g)", muLms), ...
    sprintf("NLMS (\\mu = %g, a = %g)", muNlms, alfa), "Location", "southwest");
title(sprintf("Az LMS és az NLMS identifikáció eredménye (M = %d)", M));
exportgraphics(fig, fullfile(pictureDir, "NLMS_LMS_ellip_osszehasonlitas.jpg"), "Resolution", 200);

fprintf("2.2 LMS  relErr = %.2f dB\n", 10*log10(sum(abs(Hiir - HL).^2) / sum(abs(Hiir).^2)));
fprintf("2.2 NLMS relErr = %.2f dB\n", 10*log10(sum(abs(Hiir - HN).^2) / sum(abs(Hiir).^2)));

function fig = ujAbra(pos)
if nargin < 1
    pos = [100 100 840 460];
end
if exist("theme", "file")
    fig = figure("Theme", "light", "Visible", "off", "Position", pos);
else
    fig = figure("Visible", "off", "Position", pos);
end
set(fig, "Color", "w");
end
