clear all; close all;
syms k
n = 100; p = 0.9;
f = nchoosek(n, k) * (p)^k * (1-p)^(n-k);
F1 = vpasum(f, k, 84, 95)
F2 = 1 - vpasum(f, k, 86, 100)

