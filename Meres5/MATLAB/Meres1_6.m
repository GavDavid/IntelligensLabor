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

    %% Upsampling the sensor data

    upSampNum = 10;
    Ts = mean(diff(sensorDataX));
    fs = 1 / Ts;
    fsNew = fs * upSampNum;

    yUp = zeros(upSampNum * (numel(sensorDataY) - 1) + 1, 1);
    yUp(1:upSampNum:end) = sensorDataY;

    cutoffFrequency = fs / 2;
    [b, a] = butter(4, cutoffFrequency / (fsNew / 2), "low");

    upSampledSensorDataY = filtfilt(b, a, yUp);

    upSampledSensorDataY = upSampNum * upSampledSensorDataY;

    upSampledSensorDataX = sensorDataX(1) + (0:numel(yUp) - 1)' / fsNew;

    %% Interpolation
    idobelyegPoli = polyfit(stmpSyncGwy, stmpSyncSens, 1);
    gatewayTimeInSensorClock = polyval(idobelyegPoli, gwySampX);
    sensorDataYInterpolated = interp1(upSampledSensorDataX, upSampledSensorDataY, gatewayTimeInSensorClock, 'linear');

    validSamples = ~isnan(sensorDataYInterpolated);

    edgeSamples = 50;
    comparisonSamples = validSamples;
    comparisonSamples(1:edgeSamples) = false;
    comparisonSamples(end-edgeSamples + 1:end) = false;

    squaredError = mean((gwySampY(comparisonSamples) - ...
        sensorDataYInterpolated(comparisonSamples)).^2);
    fprintf("%d Hz: átlagos négyzetes eltérés = %.6g\n", frequency, squaredError);

    %% Plotting
    figure;
    plot(sensorDataX, sensorDataY, "-o");
    hold on;
    plot(gatewayTimeInSensorClock(comparisonSamples), ...
        gwySampY(comparisonSamples), "-o");
    plot(gatewayTimeInSensorClock(comparisonSamples), ...
        sensorDataYInterpolated(comparisonSamples), "-o");
    xlabel("Idő [s]");
    ylabel("Mérési érték [ADC]");
    title(sprintf("Lineáris interpoláció %d Hz-en", frequency));
    legend("Szenzor", "Gateway", ...
        "Interpolált szenzorérték", "Location", "best");
    grid on;
end
