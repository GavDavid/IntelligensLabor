function [e, w] = FxLMS(mu, s, c, M, x, y)
% bemeneti paraméterek:
% mu: lépésköz (bátorsági tényez?) 1x1
% M: sz?r? együtthatóinak száma 1x1
% x: a sz?r? bemenete Nx1
% y: a sz?r? kimenete Nx1
% a: regularizációs konstans 1x1
% s: a másodlagos út (FIR sz?r?) együtthatói Sx1
% c : a másodlagos út (FIR sz?r?) modelljének együtthatói Cx1

% kimeneti változók:
% e: becslési hiba Nx1
% w: sz?r?együtthatók Mx1

N = length(x);

w = zeros(M, 1);
e = zeros(N, 1);
xVec    = zeros(M, 1);         
yHatBuf = zeros(length(s), 1);
xcBuf   = zeros(length(c), 1); 
xcVec   = zeros(M, 1);        

for n = 1:N
   
    xVec = [x(n); xVec(1:end-1)];
    yHat = w.' * xVec;

    yHatBuf = [yHat; yHatBuf(1:end-1)];
    yHatS = s.' * yHatBuf;

    e(n) = y(n) - yHatS;


    xcBuf = [x(n); xcBuf(1:end-1)];
    xcVec = [c.' * xcBuf; xcVec(1:end-1)];


    w = w + mu * e(n) * xcVec;
end


