function [e,w]=lms(mu,M,x,y);


w = zeros(1,M);
n = length(input);
yn = zeros (1,N);
e = zeros(1,N);
x = zeros(1,M);

for n = 1:N
    x = [u(n) x(1:end-1)];
    yn(n) = w * x;
    e(n) = y(n) - yn(n);
    w = w + mu * e(n) * x;
end

end
