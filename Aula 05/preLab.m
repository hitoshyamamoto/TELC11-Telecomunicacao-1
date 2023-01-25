%EXERCICIO MODULACAO AM, PM e FM

%limpar imagens, variaveis e janela de comando
clear all
close all
clc

%carregar as bibliotecas
pkg load control
pkg load signal

%Tempo de Amostragem
%tamostra = [0.00:0.00001:0.04];
tamostra = [0.00:1/(100*2*1000):0.04];

%Sinal da Mensagem
Am = 2;
fm = 100;
tm = tamostra;
Fm = Am*cos(2*pi*fm.*tm);

%Sinal da Portadora
Kf = 800;
Ap = 1;
fp = 2*1000;
tp = tamostra;
Fp = Ap*cos(2*pi*fp.*tp);

%Frequencia de Amostragem
fam = 100*fp;

%Indice de Modulação
K = Am/Ap

%Equacao Sinal Modulado AM
%F_Mod_AM = (1+(1/Ap).*Fm).*Fp;
%F_Mod_AM = (Fm/Am+K).*Fp
F_Mod_AM = Fp.*Fm + Fp;

%Equacao Sinal Modulado PM
fang = fp + Kf.*Fm;
F_Mod_PM = Ap*cos(2*pi*fang.*tp);

%Equação Sinal Modulado FM
%fmod = 2*pi*fp.*tp + Kf.*quad(Fm,0,tm);
beta = (Kf*Am)/fm;
fmod = 2*pi*fp.*tp + beta*sin(2*pi*fm.*tm);
F_Mod_FM = Ap*cos(fmod);

%Eixo da Frequência
vf = linspace(-fam/2,fam/2,length(tp));
N = length(tp);

% AM Domínio Frequencia
psd_Kf_AM = fftshift(fft(F_Mod_AM)/N);
pot_Kf_AM = abs(psd_Kf_AM);

% PM Domínio Frequencia
psd_Kf_PM = fftshift(fft(F_Mod_PM)/N);
pot_Kf_PM = abs(psd_Kf_PM);

% FM Dominio Frequencia
psd_Kf_FM = fftshift(fft(F_Mod_FM)/N);
pot_Kf_FM = abs(psd_Kf_FM);

% --- PLOT ---
figure
subplot(4,2,1)
plot(tamostra, F_Mod_AM)
subplot(4,2,3)
plot(tamostra, F_Mod_PM)
subplot(4,2,5)
plot(tamostra, F_Mod_FM)

subplot(4,2,2)
stem(vf, pot_Kf_AM)
subplot(4,2,4)
stem(vf, pot_Kf_PM)
subplot(4,2,6)
stem(vf, pot_Kf_FM)

subplot(4,2,7)
plot(tamostra, Fm)
subplot(4,2,8)
plot(tamostra, Fp)
