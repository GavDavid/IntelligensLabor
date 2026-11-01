pb_ripple = 2;
sb_atten = 30;
pb_lims= (10^(pb_ripple/20)-1)/(10^(pb_ripple/20)+1);
sb_lim=10^(-(sb_atten + 1)/20);
fs = 48000;
f_cut = 5000;
f_stop = 6000;


[n, f0, m0, w] = firpmord([f_cut f_stop],[1 0], [pb_lims sb_lim], fs);



FIR_lowpass = firpm(n, f0, m0, w);

[H,f] = freqz(FIR_lowpass, 1, 2^16, fs);
plot(f, 20*log10(abs(H)));
hold on;
plot([0 f_cut],[pb_ripple pb_ripple], 'r');
plot([0 f_cut], [-pb_ripple -pb_ripple], 'r');
plot([f_cut f_cut], [-sb_atten -pb_ripple], 'r');
plot([f_stop f_stop], [-sb_atten pb_ripple], 'r');
plot([f_stop fs/2], [-sb_atten -sb_atten], 'r');
xlabel('Frekvencia [Hz]');
ylabel('Amplitudo [dB]');
title('FIR alulatereszto szuro', 'Color', 'k');
xlim([0 fs/2]);
set(gcf, 'Color', 'w');
set(gca, 'Color', 'w', 'XColor', 'k', 'YColor', 'k');
saveas(gcf, '../Kepek/FIR_atvitel.jpg');

file= fopen('../CrossCore/BlackFin_FIR_fract/src/FIR_lowpass_coef.dat', 'w');
fprintf(file, '%f,\n', FIR_lowpass);
fclose(file);