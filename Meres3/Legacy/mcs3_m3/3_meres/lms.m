function [e,w] = lms(mu, M, u, y)
    N = length(u);
    e = zeros(N, 1);
    w = zeros(M, N);
    x = zeros(M,1);
  
    for i = 1:N
        x = [u(i); x(1:end-1)];
        e(i) = y(i) - w(:,i).' * x;
        w(:,i+1) = w(:,i) + 2*mu*e(i)*x; 
    end
end