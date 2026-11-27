function [e,w]=fxlms_adaptive_section(mu,M,s,c,x,y)
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
e = zeros(n,1);
w = zeros(M,1);
I = length(c);

x_filt_in = zeros(1, I);
x_c = zeros(M, 1);
z = zeros(I-1, 1);
filt = 0;

for i=1:M
    x_filt_in = [x_filt_in(2:end) x(i) ];
    [filt, z] = filter(c, 1, x_filt_in, z);
    x_c = [filt; x_c(1:end-1)];
end

for i=M:n
    x_filt_in = [x_filt_in(2:end) x(i) ];
    [filt, z] = filter(c, 1, x_filt_in, z);
    x_c = [filt; x_c(1:end-1)];    
    
    y_est = w'*x_c;
    e_i = y(i)-y_est;
    w = w + mu*e_i*x_c;
    e(i) = e_i;
end

end


