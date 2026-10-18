%% A 2.6 feladat: Fourier-egyutthatok becslese a gateway adataibol
clear;
clf;
clc;
close all;

%% Meresi adatok es parameterek betoltese
gwySampFull = load("Measurements/MasodikFeladatJel50HzKiBeKapcsoltProgi50Hz/pre_gwySampFull.dat");
sensorDataFull = load("Measurements/MasodikFeladatJel50HzKiBeKapcsoltProgi50Hz/pre_sensorResonator.dat");
stmpSync = load("Measurements/MasodikFeladatJel50HzKiBeKapcsoltProgi50Hz/pre_stmpSync.dat");
signalFreq = load("Measurements/MasodikFeladatJel50HzKiBeKapcsoltProgi50Hz/signalFreq.dat");

sensorDataID = sensorDataFull(:, 1);
sensorDataTime = sensorDataFull(:, 2);
sensorDataPhi = sensorDataFull(:, 3);
sensorDataFirstHarmonic = sensorDataFull(:, 4) + 1i * sensorDataFull(:, 9);
sensorDataSecondHarmonic = sensorDataFull(:, 5) + 1i * sensorDataFull(:, 10);
sensorDataThirdHarmonic = sensorDataFull(:, 6) + 1i * sensorDataFull(:, 11);
sensorDataFourthHarmonic = sensorDataFull(:, 7) + 1i * sensorDataFull(:, 12);
sensorDataFifthHarmonic = sensorDataFull(:, 8) + 1i * sensorDataFull(:, 13);
clearvars sensorDataFull;

gwySampX = gwySampFull(:, 1);
gwySampY = gwySampFull(:, 2);
clearvars gwySampFull;

stmpSyncGwy = stmpSync(:, 1);
stmpSyncSens = stmpSync(:, 2);
clearvars stmpSync;

%% Gateway DC komponensenek eltavolitasa
gwySampY = gwySampY - mean(gwySampY);

%% Idobelyeg-transzformacio
idobelyegPoli = polyfit(stmpSyncSens, stmpSyncGwy, 1);
sensorToGwyTime = polyval(idobelyegPoli, sensorDataTime);

%% A szenzor fazisanak meghatarozasa a gateway mintavetelezesi idopontjaiban
% A gateway es a szenzor idoskala a szinkronizacios pontok alapjan azonos.
inSensorRange = gwySampX >= sensorToGwyTime(1) & gwySampX <= sensorToGwyTime(end);
validSamples = false(size(gwySampX));
validSamples(inSensorRange) = true;

nearestSensorIndex = nan(size(gwySampX));
nearestSensorIndex(inSensorRange) = interp1(sensorToGwyTime, (1:numel(sensorToGwyTime))', gwySampX(inSensorRange), "nearest");

gatewayPhase = nan(size(gwySampX));
for sampleIndex = find(inSensorRange)'
    sensorIndex = nearestSensorIndex(sampleIndex);
    gatewayPhase(sampleIndex) = sensorDataPhi(sensorIndex) + (gwySampX(sampleIndex) - sensorToGwyTime(sensorIndex)) * signalFreq * 2 * pi;
end

%% Fourier-egyutthatok becslese a rezonaros megfigyelovel
% A becsles a jegyzokonyv (8)-(10) egyenletei szerint tortenik:
% y'_n = 2 * real(c_n^T * xHat_n)
% e_n = y_n - y'_n
% xHat_(n+1) = xHat_n + alpha * e_n * conj(c_n)
harmonicNumbers = (1:5)';
alpha = 0.01;

reconstructedCoefFirst = nan(size(gwySampX));
reconstructedCoefSecond = nan(size(gwySampX));
reconstructedCoefThird = nan(size(gwySampX));
reconstructedCoefFourth = nan(size(gwySampX));
reconstructedCoefFifth = nan(size(gwySampX));
reconstructedSignal = nan(size(gwySampX));

estimatedCoefficients = zeros(numel(harmonicNumbers), 1);
validIndices = find(inSensorRange);
for sampleIndex = validIndices'
    currentBasis = exp(1i * harmonicNumbers * gatewayPhase(sampleIndex));
    complexEstimate = currentBasis.' * estimatedCoefficients;
    currentEstimate = 2 * real(complexEstimate);
    currentError = gwySampY(sampleIndex) - currentEstimate;

    reconstructedSignal(sampleIndex) = currentEstimate;
    reconstructedCoefFirst(sampleIndex) = estimatedCoefficients(1);
    reconstructedCoefSecond(sampleIndex) = estimatedCoefficients(2);
    reconstructedCoefThird(sampleIndex) = estimatedCoefficients(3);
    reconstructedCoefFourth(sampleIndex) = estimatedCoefficients(4);
    reconstructedCoefFifth(sampleIndex) = estimatedCoefficients(5);

    estimatedCoefficients = estimatedCoefficients ...
        + alpha * currentError * conj(currentBasis);
end

%% A szenzor egyutthatoinak gateway idopontjaira illesztese
sensorCoefFirstAtGateway = nan(size(gwySampX));
sensorCoefSecondAtGateway = nan(size(gwySampX));
sensorCoefThirdAtGateway = nan(size(gwySampX));
sensorCoefFourthAtGateway = nan(size(gwySampX));
sensorCoefFifthAtGateway = nan(size(gwySampX));

for sampleIndex = find(inSensorRange)'
    sensorIndex = nearestSensorIndex(sampleIndex);
    sensorCoefFirstAtGateway(sampleIndex) = sensorDataFirstHarmonic(sensorIndex);
    sensorCoefSecondAtGateway(sampleIndex) = sensorDataSecondHarmonic(sensorIndex);
    sensorCoefThirdAtGateway(sampleIndex) = sensorDataThirdHarmonic(sensorIndex);
    sensorCoefFourthAtGateway(sampleIndex) = sensorDataFourthHarmonic(sensorIndex);
    sensorCoefFifthAtGateway(sampleIndex) = sensorDataFifthHarmonic(sensorIndex);
end

%% Hibak kiszamolasa
coefficientDifference = [
    reconstructedCoefFirst(validSamples) - sensorCoefFirstAtGateway(validSamples), ...
    reconstructedCoefSecond(validSamples) - sensorCoefSecondAtGateway(validSamples), ...
    reconstructedCoefThird(validSamples) - sensorCoefThirdAtGateway(validSamples), ...
    reconstructedCoefFourth(validSamples) - sensorCoefFourthAtGateway(validSamples), ...
    reconstructedCoefFifth(validSamples) - sensorCoefFifthAtGateway(validSamples)];

coefficientRmsError = sqrt(mean(abs(coefficientDifference).^2, 1));
signalRmsError = sqrt(mean( ...
    (gwySampY(validSamples) - reconstructedSignal(validSamples)).^2));

fprintf("Alfa = %.4f\n", alpha);
fprintf("Gateway es a visszaallitott jel RMS elterese = %.6g\n", signalRmsError);
fprintf("Fourier-egyutthatok RMS elterese:\n");
fprintf("  1. harmonikus: %.6g\n", coefficientRmsError(1));
fprintf("  2. harmonikus: %.6g\n", coefficientRmsError(2));
fprintf("  3. harmonikus: %.6g\n", coefficientRmsError(3));
fprintf("  4. harmonikus: %.6g\n", coefficientRmsError(4));
fprintf("  5. harmonikus: %.6g\n", coefficientRmsError(5));

%% A jel visszaallitasa es a gateway mereseinek osszehasonlitasa
figure;
plot(gwySampX(validSamples), gwySampY(validSamples));
hold on;
plot(gwySampX(validSamples), reconstructedSignal(validSamples));
xlabel("Ido [s]");
ylabel("Meresi ertek [ADC]");
title("A gateway jele es a Fourier-egyutthatokbol visszaallitott jel");
legend("Gateway altal mert jel", "Visszaallitott jel", ...
    "Location", "best");
grid on;

%% A becsult es a szenzor altal szolgaltatott egyutthatok osszehasonlitasa
figure;
plot(gwySampX(validSamples), abs(reconstructedCoefFirst(validSamples)));
hold on;
plot(gwySampX(validSamples), abs(sensorCoefFirstAtGateway(validSamples)));
plot(gwySampX(validSamples), abs(reconstructedCoefSecond(validSamples)));
plot(gwySampX(validSamples), abs(sensorCoefSecondAtGateway(validSamples)));
plot(gwySampX(validSamples), abs(reconstructedCoefThird(validSamples)));
plot(gwySampX(validSamples), abs(sensorCoefThirdAtGateway(validSamples)));
plot(gwySampX(validSamples), abs(reconstructedCoefFourth(validSamples)));
plot(gwySampX(validSamples), abs(sensorCoefFourthAtGateway(validSamples)));
plot(gwySampX(validSamples), abs(reconstructedCoefFifth(validSamples)));
plot(gwySampX(validSamples), abs(sensorCoefFifthAtGateway(validSamples)));
xlabel("Ido [s]");
ylabel("Fourier-egyutthato amplitudo");
title("A becsult es a szenzor altal szolgaltatott Fourier-egyutthatok");
legend("Becsult 1.", "Szenzor 1.", ...
    "Becsult 2.", "Szenzor 2.", ...
    "Becsult 3.", "Szenzor 3.", ...
    "Becsult 4.", "Szenzor 4.", ...
    "Becsult 5.", "Szenzor 5.", ...
    "Location", "best");
grid on;
