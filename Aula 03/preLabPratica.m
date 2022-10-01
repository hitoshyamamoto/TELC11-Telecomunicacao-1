clear all
close all
clc

pkg load control
pkg load signal

%Mensagem
Ae  = 1;
fe  = 50;
te  = [0.15:0.0001:0.3];
FEntrada = Ae*sin(2*pi*fe*te)

%Portadora
Ap  = 1;
fp  = 250;
tp  = [0.15:0.0001:0.3];
FPortadora = Ap*sin(2*pi*fp*tp)

%Modulada
m = Ae/Ap;
FMod = (1+m*FEntrada).*FPortadora

%Dominio da Frequencia
S = fft(FMod)

% --- PLOTS ---
figure(1)
plot(te,FEntrada)
figure(2)
plot(tp,FPortadora)
figure(3)
plot(tp,FMod)
