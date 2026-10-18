%% Az 1.7 feladat: lokális polinomos interpoláció
clear;
clf;
clc;
close all;

frequencies = [50, 500];
measurementFolders = ["ElsoFeladat50Hz", "ElsoFeladat500Hz"];
L = 5;
polynomialDegree = 2 * L;

for k = 1:numel(frequencies)
    frequency = frequencies(k);
    measurementFolder = measurementFolders(k);

    gwySampFull = load(fullfile("Measurements", measurementFolder, "pre_gwySampFull.dat"));
    sensorDataFull = load(fullfile("Measurements", measurementFolder, "pre_sensorDataFull.dat"));
    stmpSync = load(fullfile("Measurements", measurementFolder, "pre_stmpSync.dat"));

    sensorDataX = sensorDataFull(:, 1);
    sensorDataY = sensorDataFull(:, 2);
    gwySampX = gwySampFull(:, 1);
    gwySampY = gwySampFull(:, 2);

    idobelyegPoli = polyfit(stmpSync(:, 1), stmpSync(:, 2), 1);
    gatewayTimeInSensorClock = polyval(idobelyegPoli, gwySampX);

    
    nearestSensorIndex = nan(size(gatewayTimeInSensorClock));
    inSensorRange = gatewayTimeInSensorClock >= sensorDataX(1) & gatewayTimeInSensorClock <= sensorDataX(end);
    nearestSensorIndex(inSensorRange) = interp1(sensorDataX, (1:numel(sensorDataX))', gatewayTimeInSensorClock(inSensorRange), "nearest");

    sensorDataYInterpolated = nan(size(gatewayTimeInSensorClock));
    validSamples = false(size(gatewayTimeInSensorClock));
    for sampleIndex = find(inSensorRange)'
        centerIndex = nearestSensorIndex(sampleIndex);
        if centerIndex - L < 1 || centerIndex + L > numel(sensorDataX)
            continue;
        end

        localIndices = (centerIndex - L):(centerIndex + L);
        localTimeOffsets = sensorDataX(localIndices)  - gatewayTimeInSensorClock(sampleIndex);
        localTimeScale = max(abs(localTimeOffsets));
        localPolynomial = polyfit(localTimeOffsets / localTimeScale, sensorDataY(localIndices), polynomialDegree);
        sensorDataYInterpolated(sampleIndex) = polyval(localPolynomial, 0);
        validSamples(sampleIndex) = true;
    end

    squaredError = mean((gwySampY(validSamples) - sensorDataYInterpolated(validSamples)).^2);
    fprintf("%d Hz (L = %d, %d. fokú polinom): átlagos négyzetes eltérés = %.6g\n", frequency, L, polynomialDegree, squaredError);

    figure;
    plot(sensorDataX, sensorDataY, "-o");
    hold on;
    plot(gatewayTimeInSensorClock(validSamples), gwySampY(validSamples), "-o");
    plot(gatewayTimeInSensorClock(validSamples), sensorDataYInterpolated(validSamples), "-.");
    xlabel("Idő [s]");
    ylabel("Mérési érték [ADC]");
    title(sprintf("Lokális polinomos interpoláció %d Hz-en", frequency));
    legend("Szenzor", "Gateway", ...
        "Interpolált szenzorérték", "Location", "best");
    grid on;
end
