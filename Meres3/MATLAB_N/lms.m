function [e, w] = lms(mu, M, x, y)
% bemeneti paraméterek:
% mu: lépésköz (bátorsági tényez?) 1x1
% M: sz?r? együtthatóinak száma 1x1
% x: a sz?r? bemenete Nx1
% y: a sz?r? kimenete Nx1

% kimeneti változók:
% e: becslési hiba Nx1
% w: sz?r?együtthatók Mx1

N = length(x);

w = zeros(M, 1);
e = zeros(N, 1);

xVec = zeros(M, 1);

for i = 1:N
    xVec = [x(i); xVec(1:end-1)];
    
    e(i) = y(i) - w' * xVec;
    
    w = w + 2 * mu * e(i) * xVec;
end

