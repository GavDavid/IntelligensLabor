function [e,w]=mynlms(mu,a,M,x,y)
%bemeneti paraméterek:
%mu: lépésköz (bátorsági tényez®) 1 × 1
%M: a szűrő együtthatóinak száma 1 × 1
%x: a szűrő bemenete N × 1
%y: a szűrő kimenete N × 1
%a: regularizáló konstans 1 × 1

%kimeneti változók:
%e: becslési hiba N × 1
%w: szűrő együtthatók M × 1

w = zeros(M,1);
e = zeros(length(x),1);
s = zeros(M,1);
% d szűrő által becsült kimenet

    for k=1:length(x)
        s(1) = x(k);
        d = transpose(w)*s;
        e(k) = y(k) - d;
        w = w + mu/(a+(transpose(s)*s))*e(k)*s;
        s(2:M) = s(1:M-1);
    end


end