close all
clc

pkg load control
pkg load signal

%Configuracao e parametros iniciais
fs = 10^7;
t = [0:1/fs:0.00001];
A = 1;
f = 700*10^3;

%Dominio do tempo
S = A*sin(2*pi*f*t);
plot(t,S)
figure

%Dominio da Frequencia
N=length(t);
vf=linspace(-fs/2, fs/2,length(t)); %vetor de frequencia
signal = A*sin(2*pi*f*t);
psd=fftshift(fft(signal)/N);
power=abs(psd);
plot(vf,power)
