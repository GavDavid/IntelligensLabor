[y, fs] = audioread('D:\4_meres\sweep.wav');
y = y(:,2);

D = 100;
u = [ones(D, 1); y(1:end-D)];

mu = 0.9;             % Learning rate
M = 150;            % FIR filter order
[e,w] = nlms(mu, eps, M, u, y);

%figure(1)
%plot(e);

N = length(y);
f = (0:(fs/N):(fs));
f = f(1:end-1)';
%w = hann(N);
%y = y .* w;

%figure(1)
%plot(y)

%figure(2)
%hold on;
%plot(f, db(abs(fft(y))));
%grid on;
%xlim([0 fs/2])
%hold off;

window = hann(fs/10);


%figure(4)
[s,f,t,ps] = spectrogram(e, window, round(0.75 * length(window)), fs, fs);

n_pow = size(ps, 2);
pow = zeros(1, n_pow);
for i = 1:n_pow
     for j = 1:size(ps, 1)
        pow(i) = pow(i) + ps(j,i)^2;
     end
end

t_pow = 0:1:n_pow-1;
t_pow = t_pow / n_pow * max(t);
plot(t_pow, db(pow));

valami = compare(db(pow), -200);
plot(t_pow, valami)


figure(3)
spectrogram(y, window, round(0.75 * length(window)), fs, fs);
hold on;
plot(6+valami*10, t_pow, 'r', 'LineWidth', 2)


function y = compare(x, threshold)
    n = size(x, 2);
    y = ones(1, n);
    for i = 1:n
        if x(i) > threshold
            y(i) = 1;
        else
            y(i) = 0;
        end
    end
end
