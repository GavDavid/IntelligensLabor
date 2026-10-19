%% Reset
clear;
clc;
close all;

%% Constants
% specifikacio:
% 60 db elnyomás kell kb, 40 elfogadható, lengedezésre 3 db-t lehet hallani
% vagyis +-1.5-es range legyen
fs = 48e3;
fn = (fs/2);
N = 300;

% impulzus válasza a szumma sz?r?knek -> egységnyi átvitel, 1 db
% késleltetés az egész
% Filter

% Low
    f = [0, 500, 600, fn]/fn;
    m = [1, 1,   0,   0 ];
    b_1 = fir2(N,f,m);
    [H_1,F] = freqz(b_1,1,10e3,fs);
    figure(1);
        semilogx(F, db(abs(H_1)));

% Middle
    f = [0, 500, 600, 1e3, 1e3+100, fn]/fn;
    m = [0, 0,   1,   1,   0,       0 ];
    b_2 = fir2(N,f,m);
    [H_2,F] = freqz(b_2,1,10e3,fs);
    figure(1);
        hold on;
        semilogx(F, db(abs(H_2)));
        hold off;
    
% High
    f = [0, 1e3, 1e3+100, fn]/fn;
    m = [0, 0,   1,       1 ];
    b_3 = fir2(N,f,m);
    [H_3,F] = freqz(b_3,1,10e3,fs);
    figure(1);
        hold on;
        semilogx(F, db(abs(H_3)));
        hold off;

% Combo test
figure(2);
    semilogx(F, db(abs(H_1 + H_2 + H_3)));
    
figure(3);
    plot(F, unwrap(angle(H_1 + H_2 + H_3)));
    
    
b_sum = b_1 + b_2 + b_3;
figure(4);
    stem(b_sum);
    
residue = max(b_sum)-1;

dlmwrite('D:\intlab_jakab_barany\EQ\BlackFin_FIR_asm\src\lpf.dat', b_1, ',');
dlmwrite('D:\intlab_jakab_barany\EQ\BlackFin_FIR_asm\src\bpf.dat', b_2, ',');
dlmwrite('D:\intlab_jakab_barany\EQ\BlackFin_FIR_asm\src\hpf.dat', b_3, ',');

%% Testing
[music, fs] = audioread('D:\intlab_jakab_barany\EQ\music.mp3');
mono = (music(:,1) + music(:,2))/2;

lfs = filter(b_1, 1, mono);
mfs = filter(b_2, 1, mono);
hfs = filter(b_3, 1, mono);

A_l = 0.5012;
A_m = 0.9999;
A_h = 0.9999;

filtered = A_l*lfs + A_m*mfs + A_h*hfs;

audiowrite('D:\intlab_jakab_barany\EQ\filtered.wav',filtered,fs);

plot([zeros(150,1);mono]-[filtered; zeros(150,1)]);

%% Create amp-s
amplitudes_db = [0, -3 ,-6, -9, -12];
amplitudes_lin = 10.^(amplitudes_db/20);
dlmwrite('D:\intlab_jakab_barany\EQ\BlackFin_FIR_asm\src\amps.dat', amplitudes_lin, ',');

