syms c v b j s
c = 0.144; b = 0.0144; j = 0.0036; v = 12;
f = ilaplace(c*v/(s*(j*s+b)))
f = @(t) 120 - 120*exp(-4.*t)
plot(0:0.1:15,f(0:0.1:15))
xlabel("time");
ylabel("angular velocity");