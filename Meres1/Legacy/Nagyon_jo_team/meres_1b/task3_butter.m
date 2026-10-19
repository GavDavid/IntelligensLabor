N = 4;
f_sample = 48000; %Hz
f_cutoff = 12000; %Hz

[B,A] = butter(N,f_cutoff/(f_sample/2));

A = A(2:length(A));
max_val = max(max(abs(B)), max(abs(A)));
scale_factor = 1;

if max_val >= 1
    scale_factor = 2^ceil(log2(max_val)); 
end

b_scaled = B/scale_factor;
a_scaled = A/scale_factor;

[H,W] = freqz(b_scaled, [1 a_scaled], 1024, f_sample);

plot(W, 20*log10(abs(H)));
ylim([-80 5]);
hold on;
grid on;


file= fopen('task_3_iir_butter_b.dat', 'w');
fprintf(file, '%f,\n', b_scaled);
fclose(file);

file= fopen('task_3_iir_butter_a.dat', 'w');
fprintf(file, '%f,\n', a_scaled);
fclose(file);

disp(['num b: ', num2str(length(b_scaled))]);
disp(['num a: ', num2str(length(a_scaled))]);
disp(['scale: ', num2str(length(scale_factor))]);