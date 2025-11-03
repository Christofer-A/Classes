clear all; close all;
syms G vS
A = [3*G -G -G; -G 3*G -G; -G -G 3*G]
b = [vS*G; 0; 0]
x = linsolve(A,b)