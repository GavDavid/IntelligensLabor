function flag = detect_rattling_simple_ref(testFile, cleanRefFile)
   % Load files
   [x, fs] = audioread(testFile);
   [ref, fs2] = audioread(cleanRefFile);
   if fs ~= fs2, error('Sample rates do not match'); end
   x   = mean(x, 2);
   ref = mean(ref, 2);
   % --- Align reference using cross-correlation ---
   c = xcorr(x, ref);
   [~, I] = max(abs(c));
   lag = I - length(x);
   if lag > 0
       ref = [zeros(lag,1); ref];
   else
       ref = ref(-lag+1:end);
   end
   % Match lengths
   L = min(length(x), length(ref));
   x = x(1:L);
   ref = ref(1:L);
   % --- Subtract reference chirp ---
   residual = x - ref;
   % --- Residual energy (rattle = extra noise) ---
   energy = mean(residual.^2);
   % --- Threshold (very simple) ---
   threshold = 0.001;   % adjust if needed
   flag = energy > threshold;
   
   %plot
   figure;
   subplot(3,1,1)
   plot(t, x); hold on; plot(t, ref);
   legend('Test','Reference');
   title('Test Signal and Reference Chirp');
   xlabel('Time (s)')
   subplot(3,1,2)
   plot(t, residual);
   title('Residual (difference = rattling noise)');
   xlabel('Time (s)')
   subplot(3,1,3)
   plot(t_energy, energyCurve);
   hold on; yline(threshold, 'r--');
   title('Residual Energy Curve (Rattling Indicator)');
   xlabel('Time (s)')
   legend('Energy','Threshold');
   fprintf('Rattling detected? %d\n', flag);

end