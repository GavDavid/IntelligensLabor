normalized = coeff_norm ./3;

fc = 12000;
fs = 48000;

[b_butter,a_butter] = butter(4,fc/(fs/2));
%freqz(b_butter,a_butter,2^14,48000);

fc_c = 4000;
rp = 2;
n = 4;

[b_cheby, a_cheby] = cheby1(n, rp, fc_c/(fs/2));
freqz(b_cheby,a_cheby,2^14,48000);
b_cheb_norm = b_cheby.' ./5;
a_cheb_norm = a_cheby(2:end).' ./5;

%freqz(normalized(1:5), [0.33;normalized(6:end)],2^14,48000);


