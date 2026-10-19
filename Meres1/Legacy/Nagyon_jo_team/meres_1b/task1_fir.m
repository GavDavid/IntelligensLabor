f_cutoff = 5000; %Hz
f_stop = 6000; %Hz
r_passband = 2; %dB
a_stopband = 30; %dB

f_sampling=48000;


d_pass= (10^(r_passband/20)-1)/(10^(r_passband/20)+1);
d_stop=10^(-(a_stopband + 1)/20);

[N,Fo,Ao,W] = firpmord([f_cutoff f_stop], [1 0], [d_pass d_stop], f_sampling);

FIR_lowpass = firpm(N,Fo,Ao,W);
A=1;

figure;
[H,W]= freqz(FIR_lowpass, A, 1024, f_sampling);

plot(W,20*log10(abs(H)), 'b', 'LineWidth', 2.0);
hold on;
grid on;
ylim ([-60,30]);

plot([0 f_cutoff],[r_passband r_passband], 'r--');
plot([0 f_cutoff], [-r_passband -r_passband], 'r--');
plot([f_cutoff f_cutoff], [-a_stopband -r_passband], 'r--');
plot([f_stop f_stop], [-a_stopband r_passband], 'r--');
plot([f_stop f_sampling/2], [-a_stopband -a_stopband], 'r--');

hold off;

file= fopen('task_1_fir_filter.dat', 'w');
fprintf(file, '%f,\n', FIR_lowpass);
fclose(file);