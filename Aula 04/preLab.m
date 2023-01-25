%EXERCICIO MODULACAO FREQUENCIA

%limpar imagens, variaveis e janela de comando
clear all
close all
clc

%carregar as bibliotecas
pkg load control
pkg load signal

tamostra = [0.15:0.00001:0.2];

%Sinal da Mensagem
Am = 1;
fm = 50;
tm = tamostra;
Fm = Am*sin(2*pi*fm*tm);

%Sinal da Portadora
Ap = 1;
fp = 1000;
tp = tamostra;
Fp = Ap*sin(2*pi*fp*tp);

%Frequencia instantanea
Kf = 10; %100[Hz/V]
Fi = Fp-Kf*Fm;

%Desvio de Frequencia
Df = Kf*Am;

%Indice de Modulacao
B = Df/fm;

%Angulo da Fase do sinal senoidal
Ang_i = 2*pi*Fp + 2*pi*quad(Kf*Fm,0,tamostra);
F_Mod_Ang = Ap*cos(Ang_i);

%Equacao Sinal Modulado
F_Mod = Ap*cos( 2*pi*Fp + 2*pi*quad(Kf*Fm,0,tamostra) );

% --- PLOTS ---
figure
subplot(4,1,1)
plot(tm,Fm) %Sinal Mensagem
subplot(4,1,2)
plot(tp,Fp) %Sinal Portadora
subplot(4,1,3)
plot(tamostra,F_Mod)  %Sinal Modulado
subplot(4,1,4)
plot(tamostra,F_Mod_Ang)  %Sinal Modulado pela Eq. Angulo Instantaneo
