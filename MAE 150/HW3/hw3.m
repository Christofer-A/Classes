clear all; close all; clc; format long;

name = 'Christofer Azadian';
id = 'A17889763';
hw_num = 3;

% Problem 1
% Work shown on paper

syms b;

A = [1 0 0 0 0 0 0 0; 0 1/b 0 0 0 0 0 0; 0 0 2/(b^2) 0 0 0 0 0; 0 0 0 6/b^3 0 0 0 0; 1 1 1 1 1 1 1 1; 0 1/b 2/b 3/b 4/b 5/b 6/b 7/b; 0 0 2/(b^2) 6/(b^2) 12/(b^2) 20/(b^2) 30/(b^2) 42/(b^2); 0 0 0 6/(b^3) 24/(b^3) 60/(b^3) 120/(b^3) 210/(b^3)];
B = [0; 0; 0; 0; 1; 0; 0; 0];
p1a = A\B;

% Problem 2
% (a) Construct four curves

curve1.x = [-5 0];
curve1.y = [0 5];
curve1.dydx = [1 -2];

curve2.x = [0 4];
curve2.y = [5 3];
curve2.dydx = [-2 1];

curve3.x = [4 7];
curve3.y = [3 -2];
curve3.dydx = [1 -5];

curve4.x = [7 9];
curve4.y = [-2 1];
curve4.dydx = [-5 0];

y = @(t, curve) (2.*t.^3 - 3.*t.^2 + 1)*curve.y(1) + (-2.*t.^3 + 3.*t.^2)*curve.y(2) + (t.^3 - 2.*t.^2 + t)*curve.dydx(1)*(curve.x(2) - curve.x(1)) + (t.^3 - t.^2)*curve.dydx(2)*(curve.x(2) - curve.x(1));

t = 0:0.05:1;

plot(t,y(t))