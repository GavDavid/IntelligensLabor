%% Clearing wokspace
clear;
clf;
clc;
close all;

%% Loading measurement files and parameters for 50 [Hz] measurement
gwySampFull = load("Measurements/ElsoFeladat50Hz/pre_gwySampFull.dat");
sensorDataFull = load("Measurements/ElsoFeladat50Hz/pre_sensorDataFull.dat");
stmpSync = load("Measurements/ElsoFeladat50Hz/pre_stmpSync.dat");

sensorDataX = sensorDataFull(:, 1);
sensorDataY = sensorDataFull(:, 2);
clearvars sensorDataFull;

gwySampX = gwySampFull(:, 1);
gwySampY = gwySampFull(:, 2);
clearvars gwySampFull;

stmpSyncGwy = stmpSync(:, 1);
stmpSyncSens = stmpSync(:, 2);
clearvars stmpSync;

%% Id?bélyeg transzformáció
idobelyegPoli = polyfit(stmpSyncGwy, stmpSyncSens, 1);
offseteltGwySampX = polyval(idobelyegPoli, gwySampX);

%% Plot offset data
figure;
plot(sensorDataX, sensorDataY, '-o');
hold on;
plot(offseteltGwySampX, gwySampY, '-o');
title("Offsetelt Data 50 [Hz]");

%% Linear interpolation
sensorDataY_interpol = interp1(sensorDataX, sensorDataY, offseteltGwySampX);
plot(offseteltGwySampX, sensorDataY_interpol, '-o');
