function [e,w]=fxnlms_adaptive(mu,M,a,s,c,x,y)
%bemeneti paraméterek:
%mu: lépésköz (bátorsági tényez®) 1 × 1
%M: a sz¶r® együtthatóinak száma 1 × 1
%x: a sz¶r® bemenete N × 1
%y: a sz¶r® kimenete N × 1
%s: a másodlagos út (FIR sz¶r®) együtthatói S × 1
%c: a másodlagos út (FIR sz¶r®) modelljének együtthatói C × 1
%kimeneti változók:
%e: becslési hiba N × 1
%w: sz¶r®együtthatók M × 1

n = length(x);
e = zeros(n+M,1);
w = zeros(M,1);
I = length(s);

x = [zeros(M-1, 1); x];

x_filt = filter(c, 1, x);

z_i = zeros(I-1, 1);
for i=1:n-M
    W_out = w'*x(i:i+M-1);
    [y_est, z_i] = filter(s, 1, W_out,z_i);
    e_i = y(i)-y_est;
    w = w + mu/(a+x_filt(i:i+M-1)'*x_filt(i:i+M-1))*e_i*x_filt(i:i+M-1);
    e(i) = e_i;
end

end


