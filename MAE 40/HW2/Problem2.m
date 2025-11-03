clear all; close all;
syms G1 G2 G3 G4 vA vB vC iS1 iS2
A = [G1+G4 -G1 -G4; -G1 G1+G2 0; -G4 0 G3+G4]
b = [iS1; iS2; 0]
x = simplify(linsolve(A,b))