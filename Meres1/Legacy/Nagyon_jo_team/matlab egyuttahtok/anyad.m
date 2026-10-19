N = 1024;
n = 0:(N-1);

% Alaphang + 2. és 3. felharmonikus összeadása
y = sin(2 * pi * n / N) + 0.5 * sin(4 * pi * n / N) + 0.25 * sin(6 * pi * n / N);

% Normalizálás a [-1.0, 1.0] tartományba, hogy ne csorduljon túl
y = y / max(abs(y)); 


fid = fopen('sound_1024.dat', 'w');

fprintf(fid, '%.6f,\n', y);

fclose(fid);
