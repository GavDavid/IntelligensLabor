%% Reset
clear;
clc;
close all;

%% Input
[y_zaj,fs] = audioread('zaj.wav');
names = ["5_5_5"; "3_5_5"; "1_5_5";]% "5_3_5"; "5_1_5"; "5_5_3"; "5_5_1"; "3_3_3"]

clear y
%y = zeros(1, length(names));
for i = 1:length(names)
    currentName = names(i) + ".wav";
    [currenty, fs] = audioread(char(currentName));
    y(:, i) = currenty;
end



%% Plot

figure(2);
    %semilogx(20*log10(abs(fft(y_zaj,fs))));
    pwelch(20*log10(abs(fft(y(:, 1),fs))));
    hold on;
    
    X = abs(fft(y_zaj, fs));
    Y = abs(fft(y(:, 2),fs));
    
    f = 0:length(X)-1 * (1/fs);
    
    semilogx(f, 20*log10(Y./X))
    grid on
    
    
    pwelch(20*log10(abs(fft(y(:, 3),fs))));
    xlim([0, fs/2])
    grid on
    hold off
    
    legend('unity', '', 'Location', 'SouthWest')
    
    %%
    [y, fs] = audioread('3_5_5.wav');
    figure(3)
    X = fft(y_zaj, 1*length(y_zaj));
    Y = fft(y, 1*length(y_zaj));
    
    X = X(1:end/2);
    Y = Y(1:end/2);
    
    f = 0:length(X)-1 * (1/fs);
    
    semilogx(f, 20*log10(abs(Y./X)))
    grid on
    
