%% Clearing wokspace
clear;
clf;
clc;
close all;

%% Loading measurement files and parameters for 50 [Hz] measurement
gwySampFull = load("Measurements/MasodikFeladatJel50HzProgi52Hz/pre_gwySampFull.dat");
sensorDataFull = load("Measurements/MasodikFeladatJel50HzProgi52Hz/pre_sensorResonator.dat");
stmpSync = load("Measurements/MasodikFeladatJel50HzProgi52Hz/pre_stmpSync.dat");
signalFreq = load("Measurements/MasodikFeladatJel50HzProgi52Hz/signalFreq.dat");

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

%% c, feladat
Phase = angle(sensorDataFirstHarmonic);
Phase = unwrap(Phase);
phasePoly = polyfit(sensorDataTime, Phase, 1);
gradient = phasePoly(1) / (2* pi);



