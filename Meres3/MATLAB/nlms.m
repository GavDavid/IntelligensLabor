%% A 2.1 feladat: az NLMS algoritmus megvalósítása
function [e, w] = nlms(mu, a, M, x, y)
% Az NLMS algoritmus rendszeridentifikációs megvalósítása az útmutató
% (15) és (16) egyenletei alapján.
%
% bemeneti paraméterek:
%   mu: lépésköz (bátorsági tényező)    1 x 1
%   a:  regularizáló konstans           1 x 1
%   M:  a szűrő együtthatóinak száma    1 x 1
%   x:  a szűrő bemenete                N x 1
%   y:  a szűrő kimenete                N x 1
% kimeneti változók:
%   e:  becslési hiba                   N x 1
%   w:  szűrőegyütthatók                M x 1

x = x(:);
y = y(:);
assert(length(x) == length(y), "Az x és y vektorok hossza nem egyezik.");
N = length(x);

w = zeros(M, 1);
e = zeros(N, 1);

% Regressziós vektor: [x(n), x(n-1), ..., x(n-M+1)]^T
xVec = zeros(M, 1);

for n = 1:N
    xVec = [x(n); xVec(1:end-1)];

    % (15): becslési hiba
    e(n) = y(n) - w.' * xVec;

    % (16): a lépésközt a regressziós vektor energiájával normáljuk
    w = w + mu / (a + xVec.' * xVec) * e(n) * xVec;
end
end
