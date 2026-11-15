%% A 3.1 feladat: az FxLMS algoritmus megvalósítása
function [e, w] = fxlms(mu, M, s, c, x, y)
% Az FxLMS algoritmus megvalósítása az útmutató (17)-(20) egyenletei
% alapján. Mivel az S(z) másodlagos út is része az adaptációs huroknak,
% a számítás mintánként (nem blokkosan) történik.
%
% bemeneti paraméterek:
%   mu: lépésköz (bátorsági tényező)                      1 x 1
%   M:  a szűrő együtthatóinak száma                      1 x 1
%   s:  a másodlagos út (FIR szűrő) együtthatói           S x 1
%   c:  a másodlagos út (FIR szűrő) modelljének
%       együtthatói                                       C x 1
%   x:  a szűrő bemenete (referenciajel)                  N x 1
%   y:  a szűrő kimenete (elnyomandó jel)                 N x 1
% kimeneti változók:
%   e:  becslési hiba                                     N x 1
%   w:  szűrőegyütthatók                                  M x 1

x = x(:);
y = y(:);
s = s(:);
c = c(:);
assert(length(x) == length(y), "Az x és y vektorok hossza nem egyezik.");
N = length(x);

w = zeros(M, 1);
e = zeros(N, 1);

xVec    = zeros(M, 1);         % adaptív szűrő bemenete: [x(n) ... x(n-M+1)]
yHatBuf = zeros(length(s), 1); % S(z) bemenete: [y_hat(n) ... y_hat(n-S+1)]
xcBuf   = zeros(length(c), 1); % C(z) bemenete: [x(n) ... x(n-C+1)]
xcVec   = zeros(M, 1);         % (19): szűrt referencia [xc(n) ... xc(n-M+1)]

for n = 1:N
    % Az adaptív szűrő kimenete
    xVec = [x(n); xVec(1:end-1)];
    yHat = w.' * xVec;

    % Az adaptív szűrő kimenete átjut a másodlagos úton
    yHatBuf = [yHat; yHatBuf(1:end-1)];
    yHatS = s.' * yHatBuf;

    % (17): hibajel
    e(n) = y(n) - yHatS;

    % (19): a referenciajelet a másodlagos út C(z) modelljével szűrjük
    xcBuf = [x(n); xcBuf(1:end-1)];
    xcVec = [c.' * xcBuf; xcVec(1:end-1)];

    % (20): együtthatók frissítése
    w = w + mu * e(n) * xcVec;
end
end
