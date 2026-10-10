%% Az 1.6 feladat: felmintavételezés
%% Clearing wokspace
clear;
clf;
clc;
close all;


frequencies = [50, 500];
measurementFolders = ["ElsoFeladat50Hz", "ElsoFeladat500Hz"];

for k = 1:numel(frequencies)
    frequency = frequencies(k);
    measurementFolder = measurementFolders(k);

    %% Loading measurement files and parameters
    gwySampFull = load(fullfile("Measurements", measurementFolder, "pre_gwySampFull.dat"));
    sensorDataFull = load(fullfile("Measurements", measurementFolder, "pre_sensorDataFull.dat"));
    stmpSync = load(fullfile("Measurements", measurementFolder, "pre_stmpSync.dat"));

    sensorDataX = sensorDataFull(:, 1);
    sensorDataY = sensorDataFull(:, 2);
    gwySampX = gwySampFull(:, 1);
    gwySampY = gwySampFull(:, 2);

    stmpSyncGwy = stmpSync(:, 1);
    stmpSyncSens = stmpSync(:, 2);

   
%{
  %% Upsampling the sensor data
    upSampNum = 10;
    Ts = mean(diff(sensorDataX));
    fs = 1 / Ts;
    fsNew = fs * upSampNum;

    upSampledSensorDataX = sensorDataX(1):1/fsNew:sensorDataX(end);
    upSampledSensorDataY = interp1(sensorDataX, sensorDataY, upSampledSensorDataX, 'linear');
 
%}

    %% Upsampling the sensor data

    upSampNum = 10;
    Ts = mean(diff(sensorDataX));
    fs = 1 / Ts;
    fsNew = fs * upSampNum;

    yUp = zeros(upSampNum * (numel(sensorDataY) - 1) + 1, 1);
    yUp(1:upSampNum:end) = sensorDataY;

    filterOrder = 100;
    filterCoeff = fir1(filterOrder, 1/upSampNum);
    
    filterCoeff = filterCoeff / sum(filterCoeff) * sqrt(upSampNum);

    upSampledSensorDataY = filtfilt(filterCoeff, 1, yUp);

    upSampledSensorDataX = sensorDataX(1) + ...
        (0:numel(yUp)-1)' / fsNew;

    %% Interpolation
    idobelyegPoli = polyfit(stmpSyncGwy, stmpSyncSens, 1);
    gatewayTimeInSensorClock = polyval(idobelyegPoli, gwySampX);
    sensorDataYInterpolated = interp1(upSampledSensorDataX, upSampledSensorDataY, gatewayTimeInSensorClock, 'linear');

    validSamples = ~isnan(sensorDataYInterpolated);
    squaredError = mean((gwySampY(validSamples) - sensorDataYInterpolated(validSamples)).^2);
    fprintf("%d Hz: átlagos négyzetes eltérés = %.6g\n", frequency, squaredError);

    %% Plotting
    figure;
    plot(sensorDataX, sensorDataY, "-o");
    hold on;
    plot(gatewayTimeInSensorClock, gwySampY, "-o");
    plot(gatewayTimeInSensorClock, sensorDataYInterpolated, "-o");
    xlabel("Idő [s]");
    ylabel("Mérési érték [ADC]");
    title(sprintf("Lineáris interpoláció %d Hz-en", frequency));
    legend("Szenzor", "Gateway", ...
        "Interpolált szenzorérték", "Location", "best");
    grid on;
end