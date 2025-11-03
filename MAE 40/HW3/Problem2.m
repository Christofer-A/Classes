clear all; close all;
syms R1 R2 R3 R4 iS1 iS2
A = [1 0 -1; 0 1 0; R1+R2 -R2-R3 R3+R4];
b = [iS1; -iS2; 0];
x = simplify(linsolve(A,b))

