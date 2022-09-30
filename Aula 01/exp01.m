%Valores iniciais
f = 10*10^3;
t = linspace(-2,2);
Amp = 1;

s = Amp*sin(2*pi*f*t);
%plot(t,s);
stem(t,s);