close all
clc

pkg load control
pkg load signal

fs = 100*10^5;
t = [0:1/fs:0.0001];
A = 2;
freq = 100*10^3;
S = A*sin(2*pi*freq*t);
plot(t,S)