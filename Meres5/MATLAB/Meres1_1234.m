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
% figure;
% plot(sensorDataX, sensorDataY);
% hold on;
% plot(gwySampX, gwySampY);
% xlabel("Idõ [s]");
% ylabel("Mérési érték [ADC]");
% title("Nyers szenzor- és gateway-adatok (50 Hz)");
% legend("Szenzor", "Gateway", "Location", "best");
% grid on;

% figure;
% plot(stmpSyncGwy, stmpSyncSens);
% xlabel("Gateway idõbélyege [s]");
% ylabel("Szenzor idõbélyege [s]");
% title("Nyers szinkronizációs idõbélyegek (50 Hz)");
% grid on;

% %% Idobelyeg transzformáció
% idobelyegPoli = polyfit(stmpSyncGwy, stmpSyncSens, 1);
% GwyToSensorTime  = polyval(idobelyegPoli, gwySampX);
% 
% %% Plot offset data
% figure;
% plot(sensorDataX, sensorDataY);
% hold on;
% plot(GwyToSensorTime , gwySampY);
% xlabel("Idõ [s]");
% ylabel("Mérési érték [ADC]");
% title("Idõbélyeggel Összehangolt adatok (50 Hz)");
% legend("Szenzor", "Gateway", "Location", "best");
% grid on;

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
% figure;
% plot(sensorDataX, sensorDataY);
% hold on;
% plot(gwySampX, gwySampY);
% xlabel("Idõ [s]");
% ylabel("Mérési érték [ADC]");
% title("Nyers szenzor- és gateway-adatok (500 Hz)");
% legend("Szenzor", "Gateway", "Location", "best");
% grid on;

% figure;
% plot(stmpSyncGwy, stmpSyncSens);
% xlabel("Gateway idõbélyege [s]");
% ylabel("Szenzor idõbélyege [s]");
% title("Nyers szinkronizációs idõbélyegek (500 Hz)");
% grid on;

% %% Idobelyeg transzformáció
% idobelyegPoli2 = polyfit(stmpSyncGwy, stmpSyncSens, 1);
% GwyToSensorTime  = polyval(idobelyegPoli2, gwySampX);
% 
% %% Plot offset data
% figure;
% plot(sensorDataX, sensorDataY);
% hold on;
% plot(GwyToSensorTime , gwySampY);
% xlabel("Idõ [s]");
% ylabel("Mérési érték [ADC]");
% title("Idõbélyeggel Összehangolt adatok (500 Hz)");
% legend("Szenzor", "Gateway", "Location", "best");
% grid on;

%% Clearing workspace
clearvars;

%% Loading measurement files and parameters for 50 [Hz] measurement with changing amplitudes
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
% figure;
% plot(sensorDataX, sensorDataY);
% hold on;
% plot(gwySampX, gwySampY);
% xlabel("Idõ [s]");
% ylabel("Mérési érték [ADC]");
% title("Nyers szenzor- és gateway-adatok (50 Hz, változó amplitúdó)");
% legend("Szenzor", "Gateway", "Location", "best");
% grid on;

% figure;
% plot(stmpSyncGwy, stmpSyncSens);
% xlabel("Gateway idõbélyege [s]");
% ylabel("Szenzor idõbélyege [s]");
% title("Nyers szinkronizációs idõbélyegek (50 Hz, változó amplitúdó)");
% grid on;

%% Idobelyeg transzformáció
% idobelyegPoli = polyfit(stmpSyncGwy, stmpSyncSens, 1);
% GwyToSensorTime = polyval(idobelyegPoli, gwySampX);
% 
% %% Plot offset data
% figure;
% plot(sensorDataX, sensorDataY);
% hold on;
% plot(GwyToSensorTime , gwySampY);
% xlabel("Idõ [s]");
% ylabel("Mérési érték [ADC]");
% title("Idõbélyeggel Összehangolt adatok (50 Hz, változó amplitúdó)");
% legend("Szenzor", "Gateway", "Location", "best");
% grid on;

%% Pseudoinvers calc

X = [stmpSyncGwy, ones(size(stmpSyncGwy))];
Y = stmpSyncSens;
cond(X)
idobelyegPoliPseudo = pinv(X) * Y;
GwyToSensorTime_pseudo = polyval(idobelyegPoliPseudo, gwySampX);

% %% Plot offset data
% figure;
% plot(sensorDataX, sensorDataY);
% hold on;
% plot(GwyToSensorTime_pseudo, gwySampY);
% xlabel("Idõ [s]");
% ylabel("Mérési érték [ADC]");
% title("Összehangolt adatok pszeudoinverzzel (50 Hz, változó amplitúdó)");
% legend("Szenzor", "Gateway", "Location", "best");
% grid on;

%% Szinkronizációs pont eltolás
stmpSyncGwy = stmpSyncGwy + 10^6;
gwySampX_shifted = gwySampX + 10^6;

%% Pseudoinvers calc

X = [stmpSyncGwy, ones(size(stmpSyncGwy))];
Y = stmpSyncSens;
cond(X)
idobelyegPoliPseudo = pinv(X) * Y;
GwyToSensorTime_pseudo = polyval(idobelyegPoliPseudo, gwySampX_shifted);

%% Plot offset data
figure;
plot(sensorDataX, sensorDataY);
hold on;
plot(GwyToSensorTime_pseudo, gwySampY);
xlabel("Idõ [s]");
ylabel("Mérési érték [ADC]");
title("Pszeudoinverzes Összehangolás 10^6 s idõeltolással");
legend("Szenzor", "Gateway", "Location", "best");
grid on;
