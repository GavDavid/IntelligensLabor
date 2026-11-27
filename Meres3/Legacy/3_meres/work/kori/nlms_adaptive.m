function [e,w]=nlms_adaptive(mu,M,x,y,a)
%bemeneti paraméterek:
%mu: lépésköz (bátorsági tényez®) 1 × 1
%M: a szűrő együtthatóinak száma 1 × 1
%x: a szűrő bemenete N × 1
%y: a szűrő kimenete N × 1
%a: regularizáló konstans 1 × 1

%kimeneti változók:
%e: becslési hiba N × 1
%w: szűrőegyütthatók M × 1

n = length(x);
e = zeros(n,1);
w = zeros(M,1);

for i=M:n
    x_M = x(i-M+1:i); % last M elements
    y_est = w'*x_M;
    e_i = y(i)-y_est;
    w = w + mu/(a+x_M'*x_M)*e_i*x_M;
    e(i) = e_i;
end

end


