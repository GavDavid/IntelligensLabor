%% Clearing workspace
clear;
clf;
clc;
close all;

%% Loading measurement files
measurementFolder = fullfile(fileparts(fileparts(mfilename("fullpath"))), ...
    "Measurements", "MasodikFeladatJel50HzKiBeKapcsoltProgi50Hz");
gwySampFull = load(fullfile(measurementFolder, "pre_gwySampFull.dat"));
sensorDataFull = load(fullfile(measurementFolder, "pre_sensorResonator.dat"));
stmpSync = load(fullfile(measurementFolder, "pre_stmpSync.dat"));
signalFreq = load(fullfile(measurementFolder, "signalFreq.dat"));

gwySampX = gwySampFull(:, 1);
gwySampY = gwySampFull(:, 2);
gwySampY = gwySampY - mean(gwySampY);

sensorDataTime = sensorDataFull(:, 2);
sensorDataPhi = sensorDataFull(:, 3);
sensorDataCoef = sensorDataFull(:, 4:8) + 1i * sensorDataFull(:, 9:13);

stmpSyncGwy = stmpSync(:, 1);
stmpSyncSens = stmpSync(:, 2);

%% Synchronizing the sensor timestamps to gateway time
idobelyegPoli = polyfit(stmpSyncSens, stmpSyncGwy, 1);
sensorToGwyTime = polyval(idobelyegPoli, sensorDataTime);

%% Selecting the harmonics measured by the sensor
if sensorDataFull(1, 14) == 0
    harmonics = 1:5;
else
    harmonics = 1:2:9;
end

%% Calculating Fourier coefficients from gateway samples
validPackets = sensorToGwyTime >= gwySampX(1) & ...
    sensorToGwyTime <= gwySampX(end);
packetIndices = find(validPackets);
compareTimes = sensorToGwyTime(validPackets);
sensorCoefficients = sensorDataCoef(validPackets, :);

windowLength = 50;
sampleIndices = interp1(gwySampX, 1:length(gwySampX), ...
    compareTimes, "previous");
validWindows = sampleIndices >= windowLength;
sampleIndices = sampleIndices(validWindows);
packetIndices = packetIndices(validWindows);
compareTimes = compareTimes(validWindows);
sensorCoefficients = sensorCoefficients(validWindows, :);
gatewayCoefficients = zeros(length(compareTimes), length(harmonics));

for i = 1:length(compareTimes)
    windowIndices = sampleIndices(i) - windowLength + 1:sampleIndices(i);
    phase = 2 * pi * signalFreq * ...
        (gwySampX(windowIndices) - gwySampX(1));
    basisFunctions = exp(1i * phase(:) * harmonics);
    fourierMatrix = [2 * real(basisFunctions), -2 * imag(basisFunctions)];
    coefficients = fourierMatrix \ gwySampY(windowIndices);
    gatewayCoefficients(i, :) = coefficients(1:length(harmonics)) + ...
        1i * coefficients(length(harmonics) + 1:end);
end

phaseOffset = sensorDataPhi(packetIndices) - ...
    2 * pi * signalFreq * (compareTimes - gwySampX(1));
sensorCoefficients = sensorCoefficients .* exp(1i * phaseOffset(:) * harmonics);
coefficientError = sqrt(mean(abs(sensorCoefficients - gatewayCoefficients).^2, 1));
disp("Harmonikusonkénti komplex egyutthato RMSE:");
disp("Oszlopok: harmonikus sorszama, komplex egyutthato RMSE");
disp([harmonics(:), coefficientError(:)]);

figure;
for i = 1:length(harmonics)
    subplot(length(harmonics), 1, i);
    plot(compareTimes, real(sensorCoefficients(:, i)));
    hold on;
    plot(compareTimes, real(gatewayCoefficients(:, i)));
    ylabel("Re x_" + harmonics(i));
    grid on;
    if i == 1
        legend("Szenzor (kozos fazis)", "Gateway", "Location", "best");
    end
end
xlabel("Ido [s]");
sgtitle("Fourier-egyutthatok valos resze");

figure;
for i = 1:length(harmonics)
    subplot(length(harmonics), 1, i);
    plot(compareTimes, imag(sensorCoefficients(:, i)));
    hold on;
    plot(compareTimes, imag(gatewayCoefficients(:, i)));
    ylabel("Im x_" + harmonics(i));
    grid on;
    if i == 1
        legend("Szenzor (kozos fazis)", "Gateway", "Location", "best");
    end
end
xlabel("Ido [s]");
sgtitle("Fourier-egyutthatok kepzetes resze");