clc;
t = linspace(-2,2,100); //com 100 amostras
s = 1*sin(2*%pi*10*10^3*t);
//plot(t,s);
plot2d3(t,s);
//verificou se que com 50 amostras resultou-se numa distorção
//então, não é recomendado. Utilize 100 amostras ou um maior valor.
