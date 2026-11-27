function [e, w] = lms(mu, M, u, y)
    n = size(u, 1);
    e = zeros(n, 1);
    w = zeros(M, 1);
    x = zeros(M, 1);
    
    for i = 1:n
        x = [u(i); x(1:end-1)];
        e(i) = y(i) - w' * x;
        w = w + 2 * mu * e(i) * x;
    end
end