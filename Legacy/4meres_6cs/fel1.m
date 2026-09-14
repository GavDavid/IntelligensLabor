%% keressuk meg a megfelelo mintavetelezesi frekvenciat
audio = audioread('01_const.wav');
ch1 = audio(:,1);
fs = 44100;
N = length(ch1);
time = linspace(0,N/fs,N);
figure(1)
plot(time, ch1, 'x-')

figure(2)
frek = linspace(0,fs,N);
ch1_fft = 20*log10(abs(fft(ch1)));
plot(frek,ch1_fft)
xlabel('Frequency [Hz]')
ylabel('Amplitude [dB]');

%% mintavetelezzuk ujra a jelet vagy merjunk egy uj jelet ezzel az fs-sel
fs2 = 4036;
audio = audioread('02_4037Hz.wav');
ch1 = audio(:,1);
N = length(ch1);
time = linspace(0,N/fs2,N);
figure(3)
plot(time, ch1, 'x-')

figure(4)
frek = linspace(0,fs2,N);
ch1_fft = 20*log10(abs(fft(ch1)));
plot(frek,ch1_fft)
xlabel('Frequency [Hz]')
ylabel('Amplitude [dB]');

%% max-on forgatva a rendszert, identifikaljuk a nagy komponenseket
fs2 = 8072;
audio = audioread('04_max_fordulat.wav');
ch1 = audio(:,1);
plot(ch1);
% aud: 0,245
% osci: 95 mV
osci_rms = 67.4*(1e-3);
ms2_to_volt = 1;
ch1_rezg = ch1*(osci_rms/rms(ch1))/ms2_to_volt;
N = length(ch1);
time = linspace(0,N/fs2,N);

figure(5)
plot(time, ch1_rezg, 'x-')
xlabel('Time [sec]')
ylabel('Amplitude [m/s2]');

figure(6)
frek = linspace(0,fs2,N);
ch1_fft = (abs(fft(ch1_rezg)));
plot(frek,ch1_fft)
xlabel('Frequency [Hz]')
ylabel('Amplitude');

%% megvizsgaljuk a max fordulat spektrumat
fs2 = 8072;
audio = audioread('04_max_fordulat.wav');
ch1 = audio(:,1);
% aud: 0,245
% osci: 95 mV
osci_rms = 67.4*(1e-3);
ms2_to_volt = 1;
ch1_rezg = ch1/rms(ch1)*osci_rms/ms2_to_volt;
N = length(ch1);
time = linspace(0,N/fs2,N);

figure(5)
plot(time, ch1_rezg, 'x-')
xlabel('Time [sec]')
ylabel('Amplitude [m/s2]');

% figure(6)
% frek = linspace(0,fs2,N);
% ch1_fft = (abs(fft(ch1_rezg)));
% plot(frek,ch1_fft)
% xlabel('Frequency [Hz]')
% ylabel('Amplitude [dB]');

figure(7)
window = hamming(fs2);
noverlap = floor(fs2*0.9);
spectrogram(ch1,window,noverlap,fs2,fs2)


%% tranzisenseket is vizsgaljuk meg
fs2 = 8072;
audio = audioread('06.wav');
ch1 = audio(:,1);
% aud: 0,245
% osci: 95 mV
osci_rms = 67.4*(1e-3);
ms2_to_volt = 1;
ch1_rezg = ch1/rms(ch1)*osci_rms/ms2_to_volt;
N = length(ch1);
time = linspace(0,N/fs2,N);
figure(5)
plot(time, ch1_rezg, 'x-')
xlabel('Time [sec]')
ylabel('Amplitude [m/s2]');

% figure(6)
% frek = linspace(0,fs2,N);
% ch1_fft = (abs(fft(ch1_rezg)));
% plot(frek,ch1_fft)
% xlabel('Frequency [Hz]')
% ylabel('Amplitude [dB]');

figure(7)
window = hamming(fs2/4);
noverlap = floor(fs2*0.22);
spectrogram(ch1,window,noverlap,fs2,fs2)

%% kovi feladat

fs = 44100;
N = 219500;
frek = linspace(0,fs,N);

rezonancia_audio = audioread('21.wav');
rezonancia = rezonancia_audio(1:N,1);
plot(rezonancia);

chirp_audio = audioread('21_chirp.wav');
chirp = chirp_audio(1:N,1);
plot(chirp);
% plot(frek, 20*log10(abs(fft(chirp*hann(N)))));


figure(7)
window = hamming(fs);
noverlap = floor(fs*0.99);
spectrogram(rezonancia,window,noverlap,fs,fs)
%%spectrogram(rezonancia-chirp(1:length(rezonancia)),window,noverlap,fs,fs)

%%
 
whitenoise_audio = audioread('22_whitenoise.wav');
whitenoise = whitenoise_audio(1:N,1);
plot(whitenoise);

wh_resp_audio = audioread('22.wav');
wh_resp = wh_resp_audio(1:N,1);
plot(wh_resp);

figure(7)
window = hamming(fs);
noverlap = floor(fs*0.9);
spectrogram(wh_resp,window,noverlap,fs,fs)
%%spectrogram(rezonancia-chirp(1:length(rezonancia)),window,noverlap,fs,fs)

%%

figure(6)
NO_AVG = 30;
frek = linspace(0,fs,N/NO_AVG);
wh_h_fft = zeros(N/NO_AVG,1);
% erdemes implementalni hann ablakokkal
for i = 1:NO_AVG
    wh_u_fft = (abs(fft(whitenoise( (i-1)*N/NO_AVG+1:(i)*N/NO_AVG ))));
    wh_y_fft = (abs(fft(wh_resp( (i-1)*N/NO_AVG+1:(i)*N/NO_AVG ))));
    wh_h_fft = wh_h_fft + (wh_y_fft ./ wh_u_fft);
end

plot(frek,20*log10(wh_h_fft))

%%
wh_u_fft = (abs(fft(whitenoise)));
wh_y_fft = (abs(fft(wh_resp)));
wh_h_fft = wh_y_fft ./ wh_u_fft;
plot(frek,20*log10(medfilt1(wh_h_fft,10)))
xlabel('Frequency [Hz]')
ylabel('Amplitude [dB]');

doboz_hossza = 11*1e-2;
hangsebesseg = 346.3;

% ha akar negativ akar pozitiv csucs tud megjelenni, azaz hany felhullam
% fer ki az ures tavolsagra, mindig lesz egy kiemeles (abszolut amplitudomenet)
legkisebb_kiemeles_frekije = hangsebesseg / doboz_hossza / 2;
% ott fogunk elnyomást tapasztalni, ahol paratlan szamu negyedhullamhossz
% van, mert itt az amp. (leszamitva a nemlinearis behatasokat) nulla lesz
legkisebb_elnyomas_frekije = legkisebb_kiemeles_frekije / 2;

% tapasztaltunk egy kicsi elcsuszast az ertekek kozott


%% 
mh_u_fft = (abs(fft(chirp)));
mh_y_fft = (abs(fft(rezonancia)));
mh_h_fft = mh_y_fft ./ mh_u_fft;
plot(frek,20*log10(medfilt1(mh_h_fft,10)))


%%

% veszunk egy hann ablaknyit a gerjesztojelunkbol
K = 250;
window_width = N/K;
fft_hann_w = hann(2*window_width);
gerjesztes = [zeros(window_width/2,1) ; chirp ; zeros(window_width/2,1)];
valasz = [zeros(window_width/2,1) ; rezonancia ; zeros(window_width/2,1)];
negyzetes_hiba = zeros(K,1);
for i = 1:K
    current_window = gerjesztes( (i-1)*window_width+1:(i+1)*window_width );
    hanned_gerjesztes = abs(fft( fft_hann_w .*current_window, length(wh_h_fft))) ;
    predikcio = hanned_gerjesztes .* wh_h_fft ;
    current_window = valasz( (i-1)*window_width+1:(i+1)*window_width );
    hanned_valasz = abs(fft( fft_hann_w .*current_window, length(wh_h_fft))) ;
    hiba_vec = hanned_valasz - predikcio;
    negyzetes_hiba(i) = mse(hiba_vec) * 2 * window_width;
end

plot(negyzetes_hiba);
% az ablakozott jelnek megnezzuk a doboz altal adott valaszat

% vesszuk a teljsitmenyhibajat 











