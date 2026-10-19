N = 4;
fc = 4000;
Rp = 2;
fs = 48000;
 
[b_cheby, a_cheby] = cheby1(N, Rp, fc/(fs/2));

a_cheby = a_cheby(2:length(a_cheby));
max_val = max(max(abs(b_cheby)), max(abs(a_cheby)));
scale_factor = 1;

if max_val >= 1
    scale_factor = 2^ceil(log2(max_val)); 
end

b_scaled = b_cheby/scale_factor;
a_scaled = a_cheby/scale_factor;

[H,W]=freqz(b_cheby, [1 a_cheby], 1024, fs);
plot(W, 20*log10(abs(H)));
ylim([-80 5]);
hold on;
grid on;

file= fopen('task_4_iir_cheby_b.dat', 'w');
fprintf(file, '%f,\n', b_scaled);
fclose(file);

file= fopen('task_4_iir_cheby_a.dat', 'w');
fprintf(file, '%f,\n', a_scaled);
fclose(file);

disp(['num b: ', num2str(length(b_scaled))]);
disp(['num a: ', num2str(length(a_scaled))]);
disp(['scale: ', num2str(length(scale_factor))]);
