function [B, A, fs] = IIR()

fs = 2000; % sample rate
fc = 400; % cutoff freq

Rp = 1; % peak-to-peak ripple
Rs = 60; % stop band attentuation
N = 4; % order
Wp = fc / (fs / 2);

[B, A] = ellip(N, Rp, Rs, Wp);

end

