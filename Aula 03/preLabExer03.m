%EXERCICIO REFERENTE A AM-DSB-SC
%Com analise no dominio da frequencia

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

%Analise pelo Dominio da Frequencia
N = length(te);
xfreq = linspace(-2*fp,2*fp,N);

FTMod1 = fftshift(fft(FMod1)/N);
Potencia1 = abs(FTMod1);
FTMod2 = fftshift(fft(FMod2)/N);
Potencia2 = abs(FTMod2);
FTMod3 = fftshift(fft(FMod3)/N);
Potencia3 = abs(FTMod3);
FTMod4 = fftshift(fft(FMod4)/N);
Potencia4 = abs(FTMod4);

%Analise do Sinal Modulado sem a Portadora
%Ou seja, modulacao em amplitude com portadora suprimida
FMod_SC     = FEntrada.*cos(2*pi*fp*tp);
FTMod_SC    = fftshift(fft(FMod_SC)/N);
Potencia_SC = abs(FTMod_SC);

% --- PLOTS Mensagem e Portadora ---
figure(1)
plot(te,FEntrada)
figure(2)
plot(tp,FPortadora)

% --- PLOTS Sinais Modulados ---
figure(3)
plot(tp,FMod1)
figure(4)
plot(tp,FMod2)
figure(5)
plot(tp,FMod3)
figure(6)
plot(tp,FMod4)

% --- PLOTS Modulados no Dominio da Frequencia ---
figure(7)
plot(xfreq,Potencia1)
figure(8)
plot(xfreq,Potencia2)
figure(9)
plot(xfreq,Potencia3)
figure(10)
plot(xfreq,Potencia4)

% --- PLOT Sinal AM-DSB-SC ---
figure(11)
plot(tp,FMod_SC)
figure(12)
plot(xfreq,Potencia_SC)
