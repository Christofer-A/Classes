clear all; close all;
syms RS RF vS u
RS = 10^3; RL = 100; u = 50;
A = [1 0 0; -RS^-1, RS^-1 + RF^-1, -RF^-1; 0, -u, 1+u]
b = [vS; 0; 0]

x = linsolve(A,b)

vpa(x(3)/vS)

vpa(limit((50.0*RF)/(51.0*RF + 1000.0), RF, inf)) %Open circuit

(50.0*0)/(51.0*0 + 1000.0) %Short circuit

(50.0*100)/(51.0*100 + 1000.0) %100 ohms



