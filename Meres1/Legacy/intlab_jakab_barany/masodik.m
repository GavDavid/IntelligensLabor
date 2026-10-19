%% 

fs = 48e3;

fcutoff = 5e3;
fstop = 6e3;
passband_ripple = 2;        %[dB]
stopband_attenuation = 30;  %[dB]

lin2db = (10^(2/20)-1)/(10^(2/20)+1);
sb = 10^(-1*stopband_attenuation/20);
%kiegeszites: 44-nél kisebb legyen a fokszám
b = firpm(42, [0 fcutoff fstop fs/2]/(fs/2), [1 1 0 0], [1 5]);

[N,Fo,Ao,W] = firpmord([fcutoff fstop], [1 0], [lin2db sb], fs);

b = firpm(N+4,Fo,Ao, W);
%b = firpm(42,Fo,Ao,[1;10]);
freqz(b, 1, 10e3, fs);

dlmwrite('D:\intlab_jakab_barany\BlackFin_FIR_fract\src\bp_fract2.dat', b, ',');

%%
%3.
fs = 48e3
b = [-0.611372975152342, 0.917059462728512, -0.611372975152342, 0.152843243788085, 0.152843243788085];
a = [1, -0.651471653594406, 0.620472122486497, -0.147379460605609, 0.0261686639228548];
freqz(b, a, 10e3, fs);

%high pass jelleg? nem így kéne kinéznie

%%
fc = 12e3;

[b, a] = butter(4, fc/(fs/2));

freqz(b, a, 10e3, fs);

% nem kell skalazni

%%
fc = 4e3;

[b, a] = cheby1(4, 2, fc/(fs/2));
freqz(b, a, 10e3, fs);

% maxa = max(abs(a))
factor = 2^ceil(log2(max(abs(a)))); %bitshift a gyors szorzashoz
anorm = a / factor;
