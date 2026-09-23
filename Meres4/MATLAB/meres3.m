clear;

MeasName = 'meres3-4_10sec_AfterBoxSet.wav';
%MeasName = 'meres3_10sec.wav';

[MeasData, MeasRate] = audioread(MeasName);

%% Spectrogram
figure(1)
spectrogram(MeasData, 2500, [], [], MeasRate, 'yaxis')
title('Mérés 3')
xlabel('Time [s]')
ylabel('Frekvencia [kHz]')
ylim([0,5]);
t = 0:1/MeasRate:(length(MeasData)/MeasRate)-1*(1/MeasRate);

%% Szuro
f = 10000;
[b,a] = butter(4, f/(MeasRate/2), "high" );
filtered = filtfilt(b, a, MeasData);

%% RMS
window = 1000;
rms = sqrt(movmean(filtered.^2,window));
median = mean(rms);

alarm = zeros(length(MeasData),1);

for i = 1: length(MeasData)
    if rms(i) > median
        alarm(i) = true;
    else
        alarm(i) = false;
    end
end
figure(2);
plot(t, rms);
figure(3);
plot(t,alarm);
ylim([-0.1,1.1]);