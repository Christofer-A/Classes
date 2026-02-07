clear all; close all;
syms k;
n = 7; p = 9*10^-5;
f = nchoosek(n,k) * p^k * (1-p)^(n-k);
F1 = 1 - vpasum(f,k,0,1)