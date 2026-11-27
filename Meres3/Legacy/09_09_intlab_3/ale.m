fs = 48e3;

t = (0 : 30*fs)/fs;

x = 0.1*sin(2*pi*100*t);

plot(t, x)

noise = 0.2* randn(1, length(x));

%noise = 0.1*sin(2*pi*500*t);

plot(t, x+noise);

sound(x, fs)