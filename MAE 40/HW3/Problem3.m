clear all; close all;
syms R1 R2 R3 R4 Rx iS1 iS2 Vs
R1 = 10^3; R4 = 10^3; R2 = 1.5*10^3; R3 = 1.5*10^3; Rx = 680; vS = 12;
A = [R1+R3 -R1 -R3; -R1 R1+R2+Rx -Rx; -R3 -Rx Rx+R3+R4];
b = [vS; 0; 0];
x = linsolve(A,b)

