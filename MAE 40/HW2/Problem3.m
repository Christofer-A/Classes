clear all; close all;
syms vx ix
G1 = 1/10^3; G4 = 1/10^3; G2 = 1/(1.5*10^3); G3 = 1/(1.5*10^3); Gx = 1/680; vS = 12;
A = [G1 + G3 + Gx -Gx; -Gx G2 + G4 + Gx]
b = [vS*G1; vS*G2]
x = linsolve(A,b)

vx = x(1) - x(2)

ix = (vS - x(1))*G1 + (vS - x(2))*G2