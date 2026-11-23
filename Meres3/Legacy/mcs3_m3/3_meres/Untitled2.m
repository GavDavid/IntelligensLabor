close all;
clear;

N = 100000;
a = eps;
L = 120;
mu = 0.01;
M = L+1;
[B,A]= butter(10,0.05);
x = 5*randn(1,N);
y = filter (B,A,x);
[e,w]=lms(mu,M,x,y);


%plot(x);
figure;
plot(e); 

figure;
plot(filter(B,A,[1 0*(2:500)]));
hold on;
plot(w(:,end));
