clear all; close all;
syms R vS
A = [1 0 0; -10^-3 10^-3+R^-1 -R^-1; 0 10^3 1]
b = [vS; 0; 0]

x = simplify(linsolve(A,b))

vpa(x(3)*10^-4/vS)

eqn = -(0.1*R)/(R + 1001000.0) == -0.002;

vpa(solve(eqn,R))
