
[inputSignalData, inputSignalFs] = audioread('bemenet_10sec.wav');
[accelData, accelFs] = audioread('meres3-4_10sec.wav');

minLen = min(length(inputSignalData), length(accelData));
inputSignal = inputSignalData(1:minLen);
accelSignal = accelData(1:minLen);

inputSignal = inputSignal - mean(inputSignal);
accelSignal = accelSignal - mean(accelSignal);

f = (0:minLen-1) * (inputSignalFs / minLen);

fftInput = fft(inputSignal);
fftAccel = fft(accelSignal);

ampInput = abs(fftInput) / minLen;
ampAccel = abs(fftAccel) / minLen;

idx = 1:floor(minLen/2);

ampRatio = ampAccel(idx) ./ ampInput(idx);

figure;
plot(f(idx), ampRatio);
grid on;
xlim([0 1000]);
xlabel('Frekvencia (Hz)');
ylabel('Amplitúdómenet');
title('Bemeneti feszültség és gyorsulásjel közötti amplitúdómenet');



