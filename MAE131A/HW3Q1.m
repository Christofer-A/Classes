c = 0.1/sqrt(pi); L = 1; P = 10^5; d = 10^-4; v = 0.25; T = 2*10^3/sqrt(pi);

strain = d/L
stress = P/(pi*c^2)
E = stress/strain
G = E/(2*(1+v))
J = (pi/2)*c^4
phi = T*L/(J*G)
tmax = T*c/J
gammamax = c*phi/L