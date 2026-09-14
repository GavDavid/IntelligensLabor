% Rezges jel betoltese
[x, Fs] = audioread('feladat3_talanrezges.wav');

% Valtozo definialas
xl = x(:,1);
N = floor(Fs/20);
window = hann(N+1);
noverlap = floor(Fs/40);

% Spektrogramm zorej
figure;
subplot(4,1,1);
spectrogram(xl, window, noverlap, Fs, Fs, 'yaxis');
ylim([0 5]);
title('Spectrogram');
xlabel('Ido (s)');
ylabel('Frekvencia (kHz)');

s = spectrogram(xl, window, noverlap, Fs, Fs, 'yaxis');
s = s(1:5000,:);
%sV = sum(s);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Referencia jel betoltese
[y, Fs_ref] = audioread('feladat3_erintesmentes_erzekelo.wav');

% Valtozo definialas
yl = y(:,1);
N_ref = floor(Fs_ref/20);
window_ref = hann(N_ref+1);
noverlap_ref = floor(Fs_ref/40);

% Spektrogramm pure
% figure;
subplot(4,1,2);
spectrogram(yl, window_ref, noverlap_ref, Fs_ref, Fs_ref, 'yaxis');
ylim([0 5]);
title('Spectrogram');
xlabel('Ido (s)');
ylabel('Frekvencia (kHz)');

s_ref = spectrogram(yl, window_ref, noverlap_ref, Fs_ref, Fs_ref, 'yaxis');
s_ref = s_ref(1:5000,:);
%sV_ref = sum(s_ref);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

min_len = min(length(s_ref(1,:)), length(s(1,:)));
s = s(:,1:min_len);
s_ref = s_ref(:,1:min_len);

abs_errV = abs(minus(s, s_ref));
abs_errV = sum(abs_errV);

subplot(4,1,3);
plot(abs_errV);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

error_ref = 20000;

for itr = 1:min_len
    if abs_errV(itr) > error_ref
        zerges(itr) = 1;
    else
        zerges(itr) = 0;
    end
end

subplot(4,1,4);
plot(zerges);

