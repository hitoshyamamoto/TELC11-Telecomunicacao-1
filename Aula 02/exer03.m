close all
clc

pkg load control
pkg load signal

fs = 10^6;
t = [0:1/fs:1];
freq = linspace(-fs/2, fs/2,length(t));
   
S1 = cos(2*pi*15*t);
S2 = cos(2*pi*30*t);
n = length(S1);
A = [S1;S2];
X = fft(A,[],2);
power = abs(X).^2/n;
plot(freq,power(1,:),freq,(2,:))