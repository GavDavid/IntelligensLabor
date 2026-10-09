%% Az 1.5 feladat: lineáris interpoláció
clear;
clf;
clc;
close all;

frequencies = [50, 500];
measurementFolders = ["ElsoFeladat50Hz", "ElsoFeladat500Hz"];

for k = 1:numel(frequencies)
    frequency = frequencies(k);
    measurementFolder = measurementFolders(k);

    % A mérési adatok betöltése.
    gwySampFull = load(fullfile("Measurements", measurementFolder, ...
        "pre_gwySampFull.dat"));
    sensorDataFull = load(fullfile("Measurements", measurementFolder, ...
        "pre_sensorDataFull.dat"));
    stmpSync = load(fullfile("Measurements", measurementFolder, ...
        "pre_stmpSync.dat"));

    sensorDataX = sensorDataFull(:, 1);
    sensorDataY = sensorDataFull(:, 2);
    gwySampX = gwySampFull(:, 1);
    gwySampY = gwySampFull(:, 2);

    % A gateway idejét a szenzor órájára transzformáljuk.
    idobelyegPoli = polyfit(stmpSync(:, 1), stmpSync(:, 2), 1);
    gatewayTimeInSensorClock = polyval(idobelyegPoli, gwySampX);

    % A szenzor jelét a gateway mintavételi időpontjaiban becsüljük.
    sensorDataYInterpolated = interp1( ...
        sensorDataX, sensorDataY, gatewayTimeInSensorClock, "linear");

    validSamples = ~isnan(sensorDataYInterpolated);
    squaredError = mean((gwySampY(validSamples) ...
        - sensorDataYInterpolated(validSamples)).^2);
    fprintf("%d Hz: átlagos négyzetes eltérés = %.6g\n", ...
        frequency, squaredError);

    figure;
    plot(sensorDataX, sensorDataY, "-o");
    hold on;
    plot(gatewayTimeInSensorClock, gwySampY, "-o");
    plot(gatewayTimeInSensorClock, sensorDataYInterpolated, "-.");
    xlabel("Idő [s]");
    ylabel("Mérési érték [ADC]");
    title(sprintf("Lineáris interpoláció %d Hz-en", frequency));
    legend("Szenzor", "Gateway", ...
        "Interpolált szenzorérték", "Location", "best");
    grid on;
end
