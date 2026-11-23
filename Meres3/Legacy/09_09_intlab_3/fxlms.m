function [e,w]=fxlms(mu,M,s,c,x,y)
%bemeneti paraméterek:
%mu: lépésköz (bátorsági tényez®) 1 × 1
%M: a szűrő együtthatóinak száma 1 × 1
%x: a szűrő bemenete N × 1
%y: a szűrő kimenete N × 1
%s: a másodlagos út (FIR szűrő) együtthatói S × 1
%c: a másodlagos út (FIR szűrő) modelljének együtthatói C × 1

%kimeneti változók:
%e: becslési hiba N × 1
%w: szűrő együtthatók M × 1

w = zeros(M,1);
e = zeros(length(x),1);
s = zeros(M,1);
% d szűrő által becsült kimenet
state_d = 0;
memory_d = 0;
z = zeros(M,1);
state_z = 0;
memory_z = 0;

    for k=1:length(x)
        s(1) = x(k);
        [z(1), state_z, memory_z] = myIIR4one(c, 1, state_z, memory_z, x(k));
        d = w'*s;
        [d, state_d, memory_d] = myIIR4one(s, 1, state_d, memory_d, d);
        e(k) = y(k) - d;
        w = w + 2*mu*e(k)*s;
        s(2:M) = s(1:M-1);
    end
end