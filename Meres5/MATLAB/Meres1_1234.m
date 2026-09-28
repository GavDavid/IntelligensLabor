%%TODO
%Egészben javítani a meredekséget

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

%% Plotting the raw data
figure;
plot(sensorDataX, sensorDataY);
hold on;
plot(gwySampX, gwySampY);
title("Raw Sensor Data 50 [Hz]");

figure;
plot(stmpSyncGwy, stmpSyncSens);
title("Sync Raw Data 50 [Hz]");

%% Id?bélyeg transzformáció
idobelyegPoli = polyfit(stmpSyncGwy, stmpSyncSens, 1);
offseteltGwySampX = polyval(idobelyegPoli, gwySampX);

%% Plot offset data
figure;
plot(sensorDataX, sensorDataY);
hold on;
plot(offseteltGwySampX, gwySampY);
title("Offsetelt Data 50 [Hz]");

%% Clearing workspace
clearvars;

%% Loading measurement files and parameters for 500 [Hz] measurement
gwySampFull = load("Measurements/ElsoFeladat500Hz/pre_gwySampFull.dat");
sensorDataFull = load("Measurements/ElsoFeladat500Hz/pre_sensorDataFull.dat");
stmpSync = load("Measurements/ElsoFeladat500Hz/pre_stmpSync.dat");

sensorDataX = sensorDataFull(:, 1);
sensorDataY = sensorDataFull(:, 2);
clearvars sensorDataFull;

gwySampX = gwySampFull(:, 1);
gwySampY = gwySampFull(:, 2);
clearvars gwySampFull;

stmpSyncGwy = stmpSync(:, 1);
stmpSyncSens = stmpSync(:, 2);
clearvars stmpSync;

%% Plotting the raw data
figure;
plot(sensorDataX, sensorDataY);
hold on;
plot(gwySampX, gwySampY);
title("Raw Sensor Data 500 [Hz]");

figure;
plot(stmpSyncGwy, stmpSyncSens);
title("Sync Raw Data 500 [Hz]");

%% Id?bélyeg transzformáció
idobelyegPoli = polyfit(stmpSyncGwy, stmpSyncSens, 1);
offseteltGwySampX = polyval(idobelyegPoli, gwySampX);

%% Plot offset data
figure;
plot(sensorDataX, sensorDataY);
hold on;
plot(offseteltGwySampX, gwySampY);
title("Offsetelt Data 500 [Hz]");

%% Clearing workspace
clearvars;

%% Loading measurement files and parameters for 500 [Hz] measurement
gwySampFull = load("Measurements/ElsoFeladat50HzChangingAmplitudes/pre_gwySampFull.dat");
sensorDataFull = load("Measurements/ElsoFeladat50HzChangingAmplitudes/pre_sensorDataFull.dat");
stmpSync = load("Measurements/ElsoFeladat50HzChangingAmplitudes/pre_stmpSync.dat");

sensorDataX = sensorDataFull(:, 1);
sensorDataY = sensorDataFull(:, 2);
clearvars sensorDataFull;

gwySampX = gwySampFull(:, 1);
gwySampY = gwySampFull(:, 2);
clearvars gwySampFull;

stmpSyncGwy = stmpSync(:, 1);
stmpSyncSens = stmpSync(:, 2);
clearvars stmpSync;

%% Plotting the raw data
figure;
plot(sensorDataX, sensorDataY);
hold on;
plot(gwySampX, gwySampY);
title("Raw Sensor Data 50 [Hz] Changing Amplitudes");

figure;
plot(stmpSyncGwy, stmpSyncSens);
title("Sync Raw Data 50 [Hz] Changing Amplitudes");

%% Id?bélyeg transzformáció
idobelyegPoli = polyfit(stmpSyncGwy, stmpSyncSens, 1);
offseteltGwySampX = polyval(idobelyegPoli, gwySampX);

%% Plot offset data
figure;
plot(sensorDataX, sensorDataY);
hold on;
plot(offseteltGwySampX, gwySampY);
title("Offsetelt Data 50 [Hz] Changing Amplitudes");

%% Pseudoinvers calc

X = [stmpSyncGwy, ones(size(stmpSyncGwy))];
Y = stmpSyncSens;
cond(X)
idobelyegPoliPseudo = inv(X' * X) *  X' * Y;
offseteltGwySampX_pseudo = polyval(idobelyegPoli, gwySampX);

%% Plot offset data
figure;
plot(sensorDataX, sensorDataY);
hold on;
plot(offseteltGwySampX_pseudo, gwySampY);
title("Offsetelt Data 50 [Hz] Changing Amplitudes with Pseudoinverse");

%% Szinkronizációs pont eltolás
stmpSyncGwy = stmpSyncGwy + 10^6;
%stmpSyncSens = stmpSyncSens + 10^6;

%% Pseudoinvers calc

X = [stmpSyncGwy, ones(size(stmpSyncGwy))];
Y = stmpSyncSens;
cond(X)
idobelyegPoliPseudo = inv(X' * X) *  X' * Y;
offseteltGwySampX_pseudo = polyval(idobelyegPoli, gwySampX);

%% Plot offset data
figure;
plot(sensorDataX, sensorDataY);
hold on;
plot(offseteltGwySampX_pseudo, gwySampY);
title("Offsetelt Data 50 [Hz] Changing Amplitudes with Pseudoinverse with sync time offset by 10^6");
