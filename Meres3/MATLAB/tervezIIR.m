%% Az 1.2 feladat: az identifikálandó IIR szűrő
function [b, a, fs] = tervezIIR()
% Az 1.2 feladatban tervezett IIR szűrő, amit az 1.3, 1.4, 2.2 és a
% 3.x feladatokban is felhasználunk (a 3. feladatban ez a P(z) átvitel).
%
% TODO: a szűrő paramétereit a mérésvezető utasításai szerint kell
% beállítani! Az alábbi értékek csak kezdeti, ideiglenes értékek.

fs = 48000;   % mintavételi frekvencia [Hz]
N  = 4;       % a szűrő fokszáma
fc = 4000;    % határfrekvencia [Hz]

[b, a] = butter(N, fc / (fs/2), "low");
end
