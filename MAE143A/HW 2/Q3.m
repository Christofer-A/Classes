%Written by Christofer Azadian
syms s
ilaplace((-3*s-2)/(s^2+2*s+2))
ilaplace((-3*s-2)/(s*(s^2+2*s+2)))
y = @(t) exp(-t).*(cos(t) - 2*sin(t)) - 1;
plot(0:0.1:10,y(0:0.1:10))