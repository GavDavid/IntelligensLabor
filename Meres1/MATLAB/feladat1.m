pb_ripple = 2;
sb_atten = 30;
pb_lims= (10^(pb_ripple/20)-1)/(10^(pb_ripple/20)+1);
sb_lim=10^(-(sb_atten + 1)/20);
fs = 48000;
f_cut = 5000;
f_stop = 6000;


[n, f0, m0, w] = firpmord([f_cut f_stop],[1 0], [pb_lims sb_lim], fs);



FIR_lowpass = firpm(n, f0, m0, w);

freqz(FIR_lowpass, 1, 2^16, fs);
hold on;
plot([0 f_cut],[pb_ripple pb_ripple], 'r');
plot([0 f_cut], [-pb_ripple -pb_ripple], 'r');
plot([f_cut f_cut], [-sb_atten -pb_ripple], 'r');
plot([f_stop f_stop], [-sb_atten pb_ripple], 'r');
plot([f_stop fs/2], [-sb_atten -sb_atten], 'r');

file= fopen('FIR_lowpass_coef.dat', 'w');
fprintf(file, '%f,\n', FIR_lowpass);
fclose(file);