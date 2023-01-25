%EXERCICIO 2 DE MODULACAO FREQUENCIA

%limpar imagens, variaveis e janela de comando
clear all
close all
clc

%carregar as bibliotecas
pkg load control
pkg load signal

%Faixas de tempo
t  = [0.0000:0.0001:0.15];
t1 = [0.0000:0.0001:0.05];
t2 = [0.0501:0.0001:0.10];
t3 = [0.1001:0.0001:0.15];

%Sinal da Mensagem
Am_1 = 1;
Am_2 = -2;
Am_3 = 0;
fm = 25;
Fm_1 = Am_1*sin(2*pi*fm*t1);
Fm_2 = Am_2*sin(2*pi*fm*t2);
Fm_3 = Am_3*sin(2*pi*fm*t3);

%Concatenar a funcao
Fm = horzcat(Fm_1,Fm_2);
Fm = horzcat(Fm,Fm_3);
Am = Fm/sin(2*pi*fm*t);

%Constantes
mf = 0.5;
Kf = (mf*fm)/Am

%Sinal da Portadora
Ap = 1;
fp = 200;
Fp = Ap*sin(2*pi*fp*t);

%Equacao Sinal Modulado
F_Mod_Kf1 = Ap*cos( 2*pi.*Fp + 2*pi*quad(Kf.*Fm,0,t) );

%Dominio da Frequencia
vf = linspace(-fp/2,fp/2,length(t));
N = length(t);
psd_Kf1 = fftshift(fft(F_Mod_Kf1)/N);
power_Kf1 = abs(psd_Kf1);


% --- PLOTS ---
figure
subplot(3,1,1)
plot(t, Fm)
subplot(3,1,2)
plot(t,F_Mod_Kf1)
subplot(3,1,3)
stem(vf,power_Kf1)

