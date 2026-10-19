fs = 48e3;
ts = 1/fs;
T = 

%%

h = load('bp_fract.dat');
hold on
plot(h)
hold off

freqz(h,1,2^16,48000);