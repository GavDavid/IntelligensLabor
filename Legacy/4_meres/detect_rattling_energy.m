function flag = detect_rattling_energy(audioFile)
    %file
    [Y, fs] = audioread(audioFile);
    Y = mean(:,2);  
    %spec
    win = hamming(1024);
    hop = 512;
    nfft = 2048;
    [S, F, ~] = spectrogram(Y,fs, round(0.97*fs),fs,fs);
    S = abs(S);
    %ratt freq
    band = (F > 150 & F < 4000);
    Sb = S(band, :);
    %energy
    energy = mean(Sb, 1);
    energy = energy / (max(energy) + eps);

    %threshold
    threshold = 0.35;

    %detect
    if max(energy) > threshold
        flag = 1;
    else
        flag = 0;
    end
end
 