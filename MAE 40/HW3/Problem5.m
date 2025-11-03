clear all; close all;
syms R vS
A = [3*R -R -R; -R 3*R -R; -R -R 3*R];
b = [vS; 0; 0];
x = simplify(linsolve(A,b))

