close all
clc

pkg load control
pkg load signal

%Configuracao e parametros iniciais
fs = 2.6*10^3*10;
t = [0:1/fs:0.2];
A = 1;
f1 = 2.4*10^3;
f2 = 2.6*10^3;

%Dominio do tempo
S = A*cos(2*pi*f1*t)+A*cos(2*pi*f2*t);
plot(t,S)
figure

%Dominio da Frequencia
N=length(t);
vf=linspace(-fs/2, fs/2,length(t)); %vetor de frequencia
%signal = A*sin(2*pi*f*t);
psd=fftshift(fft(S)/N);
power=abs(psd);
plot(vf,power)