%% Clearing wokspace
clear;
clf;
clc;
close all;

%% Loading measurement files and parameters for 50 [Hz] measurement
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

%% Gateway átlag kivonás
gwySampY = gwySampY - mean(gwySampY);

%% Id?bélyeg transzformáció 
idobelyegPoli = polyfit(stmpSyncSens, stmpSyncGwy, 1);
sensorToGwyTime  = polyval(idobelyegPoli, sensorDataTime);

evalTimes = zeros(length(gwySampX), 1);
evalValues = zeros(length(gwySampX), 1);
evalDeltaT = zeros(length(gwySampX), 1);

for i = 1:length(gwySampX)
    minVal = 100000;
    minDeltaT = 0;
    minID = 0;
    for j = 1:length(sensorToGwyTime)
        if (abs(gwySampX(i) - sensorToGwyTime(j)) < minVal)
            minID = sensorToGwyTime(j);
            minVal = abs(gwySampX(i) - sensorToGwyTime(j));
            minDeltaT = gwySampX(i) - sensorToGwyTime(j);
        end
    end
    evalTimes(i) = minID;
    evalValues(i) = minVal;
    evalDeltaT(i) = minDeltaT;
end

reconstructedPhasesBase = zeros(length(gwySampX), 1);
reconstructedPhasesFirst = zeros(length(gwySampX), 1);
reconstructedPhasesSecond = zeros(length(gwySampX), 1);
reconstructedPhasesThird = zeros(length(gwySampX), 1);
reconstructedPhasesFourth = zeros(length(gwySampX), 1);
reconstructedPhasesFifth = zeros(length(gwySampX), 1);

reconstructedCoefFirst = zeros(length(gwySampX), 1);
reconstructedCoefSecond = zeros(length(gwySampX), 1);
reconstructedCoefThird = zeros(length(gwySampX), 1);
reconstructedCoefFourth = zeros(length(gwySampX), 1);
reconstructedCoefFifth = zeros(length(gwySampX), 1);

for i = 1 : length(reconstructedPhasesBase)
    for j = 1:length(sensorDataPhi)
        if sensorToGwyTime(j) == evalTimes(i)
            reconstructedPhasesBase(i) = sensorDataPhi(j) + evalDeltaT(i) * signalFreq * 2 * pi;
            reconstructedPhasesFirst(i) = sensorDataPhi(j) + evalDeltaT(i) * signalFreq * 1 * 2 * pi;
            reconstructedPhasesSecond(i) = sensorDataPhi(j) + evalDeltaT(i) * signalFreq * 2 * 2 * pi;
            reconstructedPhasesThird(i) = sensorDataPhi(j) + evalDeltaT(i) * signalFreq * 3 * 2 * pi;
            reconstructedPhasesFourth(i) = sensorDataPhi(j) + evalDeltaT(i) * signalFreq * 4 * 2 * pi;
            reconstructedPhasesFifth(i) = sensorDataPhi(j) + evalDeltaT(i) * signalFreq * 5 * 2 * pi;
        
            reconstructedCoefFirst(i) = sensorDataFirstHarmonic(j);
            reconstructedCoefSecond(i) = sensorDataSecondHarmonic(j);
            reconstructedCoefThird(i) = sensorDataThirdHarmonic(j);
            reconstructedCoefFourth(i) = sensorDataFourthHarmonic(j);
            reconstructedCoefFifth(i) = sensorDataFifthHarmonic(j);
        end
    end
end
    
%reconstructedBaseFncBase = abs(reconstructedCoefFirst).*exp(1j * reconstructedPhasesBase + angle(reconstructedCoefFirst));
reconstructedBaseFncFirst = abs(reconstructedCoefFirst).*exp(1j * reconstructedPhasesFirst  + angle(reconstructedCoefFirst));
reconstructedBaseFncSecond = abs(reconstructedCoefSecond).*exp(1j * reconstructedPhasesSecond + angle(reconstructedCoefSecond));
reconstructedBaseFncThird = abs(reconstructedCoefThird).*exp(1j * reconstructedPhasesThird + angle(reconstructedCoefThird));
reconstructedBaseFncFourth = abs(reconstructedCoefFourth).*exp(1j * reconstructedPhasesFourth  + angle(reconstructedCoefFourth));
reconstructedBaseFncFifth = abs(reconstructedCoefFifth).*exp(1j * reconstructedPhasesFifth + angle(reconstructedCoefFifth));

%reconstructedSignal = 2 * real(reconstructedBaseFncFirst + reconstructedBaseFncSecond + reconstructedBaseFncThird + reconstructedBaseFncFourth + reconstructedBaseFncFifth);
reconstructedSignal = 2 * real(reconstructedBaseFncFirst);

plot(reconstructedSignal)
hold on;
plot(gwySampY);

