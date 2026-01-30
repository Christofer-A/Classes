clear all; close all;
syms k;
n = 15; p = 0.005; 
f = nchoosek(n,k) * p^k * (1-p)^(n-k);
F1 = 1 - vpasum(f,k,0,0)

n = 25;
f = nchoosek(n,k) * p^k * (1-p)^(n-k);
F2 = vpasum(f,k,0,0)
