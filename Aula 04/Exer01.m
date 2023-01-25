%EXERCICIO 1 DE MODULACAO FREQUENCIA

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
fm = 1/0.15;
%Fm_1 = Am_1*sin(2*pi*fm*t1);
%Fm_2 = Am_2*sin(2*pi*fm*t2);
%Fm_3 = Am_3*sin(2*pi*fm*t3);

Fm_1 = Am_1;
Fm_2 = Am_2;
Fm_3 = Am_3;

Fm = horzcat(Fm_1,Fm_2);
Fm = horzcat(Fm,Fm_3);

%Frequencia instantanea
Kf = 50; %50[Hz/V]

%Sinal da Portadora
Ap = 1;
fp = 200;
Fp_1 = Ap*sin(2*pi*fp*t1);
Fp_2 = Ap*sin(2*pi*fp*t2);
Fp_3 = Ap*sin(2*pi*fp*t3);
Fp = Ap*sin(2*pi*fp*t);

%Equacao Sinal Modulado
%F_Mod_1 = Ap*cos( 2*pi.*Fp_1 + 2*pi*quad(Kf.*Fm_1,0,t1) );
%F_Mod_2 = Ap*cos( 2*pi.*Fp_2 + 2*pi*quad(Kf.*Fm_2,t1,t2) );
%F_Mod_3 = Ap*cos( 2*pi.*Fp_3 + 2*pi*quad(Kf.*Fm_3,t2,t3) );

fi_1 = fp + Kf*Fm_1; %200 + 50*1    = 250
fi_2 = fp + Kf*Fm_2; %200 + 50*(-2) = 100
fi_3 = fp + Kf*Fm_3; %200 + 50*0    = 200

F_Mod_1 = Ap*cos(2*pi*fi_1*t1);
F_Mod_2 = Ap*cos(2*pi*fi_2*t2);
F_Mod_3 = Ap*cos(2*pi*fi_3*t3);


%Dominio da Frequencia
vf = linspace(-fp/2,fp/2,length(t));
%N1 = length(t1);
%N2 = length(t2);
%N3 = length(t3);
%psd_1 = fftshift(fft(F_Mod_1)/N1);
%psd_2 = fftshift(fft(F_Mod_2)/N2);
%psd_3 = fftshift(fft(F_Mod_3)/N3);
%power_1 = abs(psd_1);
%power_2 = abs(psd_2);
%power_3 = abs(psd_3);

N = length(t);
tl = pow2(nextpow2(N));
F_Mod = horzcat(F_Mod_1,F_Mod_2);
F_Mod = horzcat(F_Mod,F_Mod_3);
psd = fftshift(fft2(F_Mod,tl)/N);
power = abs(psd);


% --- PLOTS ---
figure
subplot(4,1,1)
plot(t1,Fm_1)
hold on;
plot(t2,Fm_2)
plot(t3,Fm_3)
hold off;

subplot(4,1,2)
plot(t1,Fp_1)
hold on;
plot(t2,Fp_2)
plot(t3,Fp_3)
hold off;

subplot(4,1,3)
plot(t1,F_Mod_1)
hold on;
plot(t2,F_Mod_2)
plot(t3,F_Mod_3)
hold off;

subplot(4,1,4)
plot(vf,power)
