syms a v alpha beta j s
f = ilaplace((alpha*v*s)/((j*s+beta)*(s^2+a^2)))
alpha = 0.144; beta = 0.0144; j = 0.0036; v = 4; a = 4;
f = @(t) (alpha*beta*v*cos(a*t) + a*alpha*j*v*sin(a*t))/(a^2*j^2 + beta^2) - (alpha*beta*v*exp(-(beta*t)/j))/(a^2*j^2 + beta^2)
plot(0:0.1:15,f(0:0.1:15))
xlabel("time");
ylabel("angular velocity");