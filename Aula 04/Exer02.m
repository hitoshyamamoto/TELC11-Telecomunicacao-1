%EXERCICIO 2 DE MODULACAO FREQUENCIA

%limpar imagens, variaveis e janela de comando
clear all
close all
clc

%carregar as bibliotecas
pkg load control
pkg load signal

%Faixas de tempo
t  = [0.00000:0.00001:0.15];

%Sinal da Mensagem
Am = 1;
fm = 25;
Fm = Am*sin(2*pi*fm*t);

%Constantes
mf_1 = 0.5;
Kf_1 = (mf_1*fm)/Am %Kf_1 = (0.5*25)/1 = 12,5

mf_2 = 1.0;
Kf_2 = (mf_2*fm)/Am %Kf_2 = (1*25)/1 = 25

mf_3 = 2.0;
Kf_3 = (mf_3*fm)/Am %Kf_3 = 50

mf_4 = 5.0;
Kf_4 = (mf_4*fm)/Am %Kf_4 = 125

%Sinal da Portadora
Ap = 1;
fp = 200;
Fp = Ap*sin(2*pi*fp*t);

%Equacao Sinal Modulado
%F_Mod_Kf1 = Ap*cos( 2*pi.*Fp + 2*pi*quad(Kf_1.*Fm,0,t) );
%F_Mod_Kf2 = Ap*cos( 2*pi.*Fp + 2*pi*quad(Kf_2.*Fm,0,t) );
%F_Mod_Kf3 = Ap*cos( 2*pi.*Fp + 2*pi*quad(Kf_3.*Fm,0,t) );
%F_Mod_Kf4 = Ap*cos( 2*pi.*Fp + 2*pi*quad(Kf_4.*Fm,0,t) );

fi_1 = fp + Kf_1*Fm;
F_Mod_Kf1 = Ap*cos(2*pi*fi_1.*t);
fi_2 = fp + Kf_2*Fm;
F_Mod_Kf2 = Ap*cos(2*pi*fi_2.*t);
fi_3 = fp + Kf_3*Fm;
F_Mod_Kf3 = Ap*cos(2*pi*fi_3.*t);
fi_4 = fp + Kf_4*Fm;
F_Mod_Kf4 = Ap*cos(2*pi*fi_4.*t);

%Dominio da Frequencia
vf = linspace(-fp/2,fp/2,length(t));
N = length(t);
psd_Kf1 = fftshift(fft(F_Mod_Kf1)/N);
power_Kf1 = abs(psd_Kf1);
psd_Kf2 = fftshift(fft(F_Mod_Kf2)/N);
power_Kf2 = abs(psd_Kf2);
psd_Kf3 = fftshift(fft(F_Mod_Kf3)/N);
power_Kf3 = abs(psd_Kf3);
psd_Kf4 = fftshift(fft(F_Mod_Kf4)/N);
power_Kf4 = abs(psd_Kf4);


% --- PLOTS ---
figure

subplot(4,2,1)
plot(t,F_Mod_Kf1)
subplot(4,2,2)
stem(vf,power_Kf1)

subplot(4,2,3)
plot(t,F_Mod_Kf2)
subplot(4,2,4)
stem(vf,power_Kf2)

subplot(4,2,5)
plot(t,F_Mod_Kf3)
subplot(4,2,6)
stem(vf,power_Kf3)

subplot(4,2,7)
plot(t, F_Mod_Kf4)
subplot(4,2,8)
stem(vf,power_Kf4)
