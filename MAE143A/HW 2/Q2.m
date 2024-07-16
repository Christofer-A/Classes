%Written by Christofer Azadian
syms s
F = ilaplace((-3*s-2)/((s+4)*(s+1)))
s*(-3-2/s)*(-3*s-2)/(s^2+5*s+4)
ilaplace((3*s+2)^2/(s*(s^2+5*s+4)))
y = @(t) (25*exp(-4.*t))/3 - exp(-t)/3 + 1
plot(0:0.1:10,y(0:0.1:10))