clear all; close all;
syms R1 R2 R3 R4 iS
A = [1 0 0; -R1 R1+R2+R3 -R3; 0 -R3 R3+R4]
b = [iS; 0; 0]
x = simplify(linsolve(A,b))

