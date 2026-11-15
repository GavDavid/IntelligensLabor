%% A 3.2-3.4 feladat: az FxLMS algoritmus vizsgálata
clear;
clc;
close all;

scriptDir  = fileparts(mfilename("fullpath"));
pictureDir = fullfile(scriptDir, "..", "Kepek");

rng(1);

[b, a, fs] = tervezIIR();   % P(z): az elsődleges út

%% 3.2: az S(z) másodlagos út identifikálása LMS algoritmussal
% S(z): egyszerű FIR szűrő, amely késleltetést (pl. AD/DA-átalakítók) és
% aluláteresztő jelleget modellez
sDelay = 5;
s = [zeros(sDelay, 1); fir1(10, 0.5).'];

Nid = 20000;
Mc  = 24;          % a C(z) modell együtthatóinak száma
muC = 0.005;

xId = randn(Nid, 1);
yId = filter(s, 1, xId);
[eId, c] = lms(muC, Mc, xId, yId);

[Hs, f] = freqz(s, 1, 4096, fs);
Hc = freqz(c, 1, 4096, fs);

ujAbra();
tiledlayout(2, 1);
nexttile;
stem(0:length(s)-1, s, "filled");
hold on;
stem(0:Mc-1, c);
grid on;
xlabel("n [minta]");
ylabel("Amplitúdó");
legend("S(z) együtthatói", "C(z) identifikált együtthatói", "Location", "northeast");
title("A másodlagos út identifikációja");
nexttile;
plot(f, 20*log10(abs(Hs)), "LineWidth", 1.5);
hold on;
plot(f, 20*log10(abs(Hc)), "--", "LineWidth", 1.5);
grid on;
xlim([0 fs/2]);
ylim([-80 5]);
xlabel("Frekvencia [Hz]");
ylabel("Amplitúdó [dB]");
legend("S(z)", "C(z)", "Location", "southwest");
saveas(gcf, fullfile(pictureDir, "FxLMS_masodlagos_ut.jpg"));

fprintf("A másodlagos út identifikációjának hibája: %.2f dB\n", ...
    10*log10(sum(abs(Hs - Hc).^2) / sum(abs(Hs).^2)));

%% 3.3: az FxLMS tesztelése többféle referenciajellel
N  = 24000;            % 0,5 s
t  = (0:N-1).' / fs;
f0 = 500;              % a referenciajel frekvenciája [Hz]
M  = 64;               % az adaptív szűrő együtthatóinak száma
mu = 0.0005;           % bátorsági tényező

references = { ...
    "Szinuszjel",     sin(2*pi*f0*t); ...
    "Háromszögjel",   sawtooth(2*pi*f0*t, 0.5); ...
    "Négyszögjel",    square(2*pi*f0*t)};

ujAbra();
tiledlayout(size(references, 1), 1);
for k = 1:size(references, 1)
    x = references{k, 2};
    y = filter(b, a, x);           % az elnyomandó jel: P(z) kimenete
    [e, ~] = fxlms(mu, M, s, c, x, y);

    attenuationDb = 10*log10(mean(y(end-2400:end).^2) / mean(e(end-2400:end).^2));
    fprintf("%s: elnyomás az utolsó 50 ms-ban = %.1f dB\n", references{k, 1}, attenuationDb);

    nexttile;
    plot(t*1000, y, "Color", [0.75 0.75 0.75]);
    hold on;
    plot(t*1000, e);
    grid on;
    xlabel("Idő [ms]");
    ylabel("Amplitúdó");
    legend("Elnyomandó jel (y)", "Hibajel (e)", "Location", "northeast");
    title(sprintf("%s, f_0 = %d Hz (\\mu = %g, M = %d)", references{k, 1}, f0, mu, M));
end
saveas(gcf, fullfile(pictureDir, "FxLMS_referenciajelek.jpg"));

%% 3.4: S(z) elégtelen identifikációja esetén az algoritmus nem konvergens
% A hibás modellt a másodlagos út identifikált modelljének további
% késleltetésével állítjuk elő. Ha f0-on a C(z) és S(z) közötti
% fáziseltérés meghaladja a 90 fokot, az algoritmus mu értékétől
% függetlenül divergál, mu csökkentése csak a divergencia sebességét
% csökkenti.
f0     = 1000;
dExtra = 20;                         % többletkésleltetés [minta]
cBad   = [zeros(dExtra, 1); c];

HcBad = freqz(cBad, 1, 4096, fs);
phaseErr = rad2deg(unwrap(angle(Hs .* conj(HcBad))));

ujAbra();
plot(f, phaseErr);
hold on;
yline(90, "r--");
xline(f0, "k:");
grid on;
xlim([0 2000]);
xlabel("Frekvencia [Hz]");
ylabel("Fáziseltérés [fok]");
title("Az S(z) és a hibás C(z) modell fáziseltérése");
saveas(gcf, fullfile(pictureDir, "FxLMS_faziselteres.jpg"));

N = 96000;   % 2 s
t = (0:N-1).' / fs;
x = sin(2*pi*f0*t);
y = filter(b, a, x);
M = 32;
muList = [1e-3, 1e-4, 1e-5];

ujAbra();
hold on;
[eGood, ~] = fxlms(muList(end), M, s, c, x, y);
plot(t, 20*log10(movmean(abs(eGood), 480)), "k", "LineWidth", 1.5, ...
    "DisplayName", sprintf("helyes C(z), \\mu = %g", muList(end)));
for k = 1:numel(muList)
    [e, ~] = fxlms(muList(k), M, s, cBad, x, y);
    e(~isfinite(e)) = NaN;
    plot(t, 20*log10(movmean(abs(e), 480)), ...
        "DisplayName", sprintf("hibás C(z), \\mu = %g", muList(k)));
end
grid on;
ylim([-100 100]);
xlabel("Idő [s]");
ylabel("|e| [dB]");
legend("Location", "northwest");
title(sprintf("Az FxLMS divergenciája hibás másodlagosút-modell esetén (f_0 = %d Hz)", f0));
saveas(gcf, fullfile(pictureDir, "FxLMS_divergencia.jpg"));

function fig = ujAbra()
% Világos témájú ábra létrehozása a jegyzőkönyvhöz (R2025a-tól)
if exist("theme", "file")
    fig = figure("Theme", "light");
else
    fig = figure;
end
set(fig, "Color", "w");
end
