%% Clearing wokspace
clear;
clf;
clc;
close all;

%% Loading measurement files and parameters for 50 [Hz] measurement
gwySampFull = load("Measurements/MasodikFeladatJel50HzProgi60Hz/pre_gwySampFull.dat");
sensorDataFull = load("Measurements/MasodikFeladatJel50HzProgi60Hz/pre_sensorResonator.dat");
stmpSync = load("Measurements/MasodikFeladatJel50HzProgi60Hz/pre_stmpSync.dat");
signalFreq = load("Measurements/MasodikFeladatJel50HzProgi60Hz/signalFreq.dat");

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

%% Időbélyeg transzformáció 
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


reconstructedBaseFncFirst = abs(reconstructedCoefFirst) .* exp(1j * (reconstructedPhasesFirst + angle(reconstructedCoefFirst)));
reconstructedBaseFncSecond = abs(reconstructedCoefSecond) .* exp(1j * (reconstructedPhasesSecond + angle(reconstructedCoefSecond)));
reconstructedBaseFncThird = abs(reconstructedCoefThird) .* exp(1j * (reconstructedPhasesThird + angle(reconstructedCoefThird)));
reconstructedBaseFncFourth = abs(reconstructedCoefFourth) .* exp(1j * (reconstructedPhasesFourth + angle(reconstructedCoefFourth)));
reconstructedBaseFncFifth = abs(reconstructedCoefFifth) .* exp(1j * (reconstructedPhasesFifth + angle(reconstructedCoefFifth)));

reconstructedSignal = 2 * real(reconstructedBaseFncFirst + reconstructedBaseFncSecond + ... 
reconstructedBaseFncThird + reconstructedBaseFncFourth + reconstructedBaseFncFifth);

AmplitudoAtvitel = median(2 * abs(sensorDataFirstHarmonic))

difference = sqrt(mean((gwySampY - reconstructedSignal).^2))

%{
plot(reconstructedSignal)
hold on;
plot(gwySampY);
legend('Visszaállított jel', 'Gateway által mért jel');
grid on; 
%}


%% Amplitudóátvitel
amp40Hz = 53.7344;
amp45Hz = 51.6940;
amp48Hz = 53.9712;
amp49Hz = 53.7013;
amp49_5Hz = 53.8094;
amp49_9Hz = 53.8094;
amp49_99Hz = 53.7013;
amp50Hz = 53.3756;
amp50_01Hz = 53.7013;
amp50_1Hz = 53.6425;
amp50_5Hz = 53.3333;
amp51Hz = 52.8210;
amp52Hz = 51.7258;
amp55Hz = 46.8897;
amp60Hz = 37.6352;

ratio40Hz = amp40Hz / amp50Hz;
ratio45Hz = amp45Hz / amp50Hz;
ratio48Hz = amp48Hz / amp50Hz;
ratio49Hz = amp49Hz / amp50Hz;
ratio49_5Hz = amp49_5Hz / amp50Hz;
ratio49_9Hz = amp49_9Hz / amp50Hz;
ratio49_99Hz = amp49_99Hz / amp50Hz;
ratio50Hz = amp50Hz / amp50Hz;
ratio50_01Hz = amp50_01Hz / amp50Hz;
ratio50_1Hz = amp50_1Hz / amp50Hz;
ratio50_5Hz = amp50_5Hz / amp50Hz;
ratio51Hz = amp51Hz / amp50Hz;
ratio52Hz = amp52Hz / amp50Hz;
ratio55Hz = amp55Hz / amp50Hz;
ratio60Hz = amp60Hz / amp50Hz;

frequencies = [40, 45, 48, 49, 49.5, 49.9, 49.99, 50, 50.01, 50.1, 50.5, 51, 52, 55, 60];
ratios = [ratio40Hz, ratio45Hz, ratio48Hz, ratio49Hz, ratio49_5Hz, ratio49_9Hz, ratio49_99Hz, ratio50Hz, ratio50_01Hz, ratio50_1Hz, ratio50_5Hz, ratio51Hz, ratio52Hz, ratio55Hz, ratio60Hz];
plot(frequencies, ratios, '-o');
xlabel('Rezonátor frekvenciája [Hz]');
ylabel('Arány');
title('Amplitudóátvitel');
grid on;


diff50Hz = 5.3073;
diff49_99Hz = 1.1718;
diff49_9Hz = 5.3477;
diff49_5Hz = 5.4318;
diff49Hz = 2.2138;
diff48Hz = 20.7149;
diff45Hz = 46.6970;
diff40Hz = 18.6983;
diff50_01Hz = 1.1722;
diff50_1Hz = 1.5195;
diff50_5Hz = 5.1621;
diff51Hz = 10.1817;
diff52Hz = 19.8554;
diff55Hz = 43.2100;
diff60Hz = 59.0115;

figure;
plot(frequencies, [diff40Hz, diff45Hz, diff48Hz, diff49Hz, diff49_5Hz, diff49_9Hz, diff49_99Hz, diff50Hz, diff50_01Hz, diff50_1Hz, diff50_5Hz, diff51Hz, diff52Hz, diff55Hz, diff60Hz], '-o');
xlabel('Rezonátor frekvenciája [Hz]');
ylabel('Különbség');
title('RMS különbség a visszaállított jel és a Gateway által mért jel között');
grid on;