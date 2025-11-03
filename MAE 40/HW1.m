close all; clear all; 
syms v;
V = sort([0 -0.1 0.1 -0.2 0.2 -0.4 0.4 -0.8 0.8 -1 1]);
i = @(v) 5*10^-17*(exp(40*v) - 1);
plot(V,i(V))
xlabel('i');
ylabel('v');
figure;
plot(V,i(V).*V)
xlabel('i');
ylabel('P');
i(5)
5*i(5)
i(-5)
-5*i(-5)