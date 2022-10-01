clear all
close all
clc

pkg load control
pkg load signal

#Sinal de Entrada
Ae  = 1;
fe  = 1000;
te  = [0:1/fe:1];
FEntrada = Ae*sin(2*pi*fe*te);

#Sinal da Portadora
Ap  = 1;
fp  = 10*10^6;
tp  = [0:1/fe:0.01];
FPortadora = Ap*sin(2*pi*fp*tp);

#Modulacao
#FMod = (Ap+FEntrada)*(FPortadora/Ap);
FMod = (1+Ae/Ap)*FPortadora;

#Fator de Modulacao
m = Ae/Ap

#   --- PLOTS ---
#Plotar Sinal de Entrada
figure(1)
plot(te,FEntrada)

#Plotar Sinal da Portadora
figure(2)
plot(tp,FPortadora)

#Plotar Sinal Modulado
figure(3)
plot(tp,FMod)
