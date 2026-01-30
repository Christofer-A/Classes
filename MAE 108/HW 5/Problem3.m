clear all; close all;
syms k;
n = 10; p = 0.25;
f = nchoosek(n,k) * p^k * (1-p)^(n-k);
F1 = vpasum(f,k,1,1)