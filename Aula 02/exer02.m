close all
clc

pkg load control
pkg load signal

A = 1;
fs = 100*10^3;
t = [0:1/fs:1];
signal = A*cos(1*pi*50*t);
S = fft(signal);
plot(abs(S));