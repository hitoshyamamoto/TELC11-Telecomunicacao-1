close all
clc

pkg load control
pkg load signal

fs = 1000;
t = [0:1/fs:0.1];
N=length(t);
A = 1; %amplitude
f = 60; %frequencia da amostra
vf=linspace(-fs/2, fs/2,length(t)); %vetor de frequencia
signal = A*sin(2*pi*f*t);

psd=fftshift(fft(signal)/N);
power=abs(psd);
plot(vf,power)

%Testando em domínio do tempo
%S = A*sin(2*pi*f*t);
%plot(t,S)