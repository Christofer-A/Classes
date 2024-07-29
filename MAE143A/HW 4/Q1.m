% script RR_Ex06_02_cascade_mass_spring
%% Renaissance Repository, https://github.com/tbewley/RR (Renaissance Robotics, Chapter 6)
%% Copyright 2024 by Thomas Bewley, published under BSD 3-Clause License.

clear; syms L1 L2 L3 L4 L5 L6 x1 x2 x3 u
eqn1= L1*x1+L2*x2+L3*x3==u;
eqn2= L4*x1+L5*x2+L3*x3==0;
eqn3= L3*x2+L6*x3==0;
sol=solve(eqn1,eqn2,eqn3,x1,x2,x3); G=sol.x3/u

syms m1 m2 m3 mu1 mu2 mu3 g k1 k2 k3 s
G=subs(sol.x2/u,{L1,L2,L3,L4,L5,L6},{m1*s^2+mu1*m1*g*s+k1+k2, -k2+k3, -k3, -k2, m2*s^2+mu2*m2*g*s+k2+k3, m3*s^2+k3+mu3*m3*g*s})
[numG,denG] = numden(G);      % this extracts out the num and den of G
numG=coeffs(numG,s);          % this extracts the powers of s in the num and den
denG=coeffs(denG,s);
numG=simplify(numG/denG(end)); % this makes the den monic
denG=simplify(denG/denG(end));

numG=numG(end:-1:1)   % this reverses the order of the vector of coefficients.
denG=denG(end:-1:1)