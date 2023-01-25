%EXERCICIO AMOSTRAGEM

%limpar imagens, variaveis e janela de comando
clear all
close all
clc

%carregar as bibliotecas
pkg load control
pkg load signal

#Frequência
f_mensagem    = 60;
f_amostragem  = 10*f_mensagem; % "8x" -> 9 amostras

%Tempo de Amostragem
tamostra = [0.00:1/(100*f_mensagem):10/f_mensagem];

%Sinal da Mensagem
Am = 5;
fm = f_mensagem;
tm = tamostra;
Fm = Am*cos(2*pi*fm.*tm);

%Sinal da Amostragem
T_amostragem  = 1/f_amostragem;
Num_amostras  = length(tamostra);
n = [0:1:Num_amostras-1];
t_sample = [0 : T_amostragem : n(Num_amostras).*T_amostragem];
Freq_digital = 2*pi*(f_mensagem/f_amostragem);
Fm_amostragem = Am*cos(Freq_digital.*n);

% --- PLOT ---
figure

hold on
plot(tamostra,Fm);
stem(t_sample, Fm_amostragem);
hold off
