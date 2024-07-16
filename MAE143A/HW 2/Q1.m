%Written by Christofer Azadian
syms s l a v g
% ilaplace((2*l)/(2*l*s + a^2*v^2 + 2*g))
% y = @(a,v,t) exp(-(t.*(a.^2.*v.^2 + 2*9.8))/(2*5))
% plot(0:0.1:10,y(1,1,0:0.1:10))
% hold on
% plot(0:0.1:10,y(5,5,0:0.1:10))
% plot(0:0.1:10,y(0.005,0.005,0:0.1:10))
ilaplace((2*l)/(2*l*s + a^2*v^2 - 2*g))
y = @(a,v,t) exp((t.*(- a.^2.*v.^2 + 2*9.8))/(2*5))
plot(0:0.1:10,y(1,1,0:0.1:10))
hold on
plot(0:0.1:10,y(5,5,0:0.1:10))
plot(0:0.1:10,y(0.005,0.005,0:0.1:10))