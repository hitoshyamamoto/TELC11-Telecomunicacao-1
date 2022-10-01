%EXERCICIO REFERENTE A AM-DSB

%Limpar imagens, variaveis e Janela de Comando
clear all
close all
clc

%Carregar os pacotes
pkg load control
pkg load signal

%Sinal da Mensagem
Ae  = 1;
fe  = 50; %frequencia 5 vezes menor comparado a portadora
te  = [0.15:0.0001:0.2];
FEntrada = Ae*sin(2*pi*fe*te);

%Sinal da Portadora
Ap  = 1;
fp  = 250;
tp  = [0.15:0.0001:0.2];
FPortadora = Ap*sin(2*pi*fp*tp);

%Sinal Modulado
m1 = 0.3;
FMod1 = (1+m1*FEntrada).*FPortadora;
m2 = 0.7;
FMod2 = (1+m2*FEntrada).*FPortadora;
m3 = 1.0;
FMod3 = (1+m3*FEntrada).*FPortadora;
m4 = 1.4;
FMod4 = (1+m4*FEntrada).*FPortadora;

% --- PLOTS ---
figure(1)
plot(te,FEntrada)
figure(2)
plot(tp,FPortadora)
figure(3)
plot(tp,FMod1)
figure(4)
plot(tp,FMod2)
figure(5)
plot(tp,FMod3)
figure(6)
plot(tp,FMod4)
