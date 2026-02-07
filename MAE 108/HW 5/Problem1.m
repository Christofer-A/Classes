clear all; close all;
syms p k
n = 5; l = 3;
f = nchoosek(n, k) * (1-p)^k * p^(n-k);
F3 = symsum(f, k, l, n);
expand(F3)
n = 3; l = 2;
f = nchoosek(n, k) * (1-p)^k * p^(n-k);
F2 = symsum(f, k, l, n);
expand(F2)

assume(0 < p < 1);
inequality = simplify(F3 - F2) > 0;
solve(inequality, p, 'ReturnConditions', true)
