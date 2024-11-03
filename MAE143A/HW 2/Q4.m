%Written by Christofer Azadian
syms s
ilaplace(1/(s+5))
ilaplace(1/(s*(s+5)))
y = @(t) 1/5 - exp(-5.*t)/5
plot(0:0.1:10,y(0:0.1:10))