syms m1 m2 m3 dt k1 k2 k3 mu1 mu2 mu3 g x1 x2 x3 y u
l1 = m1*dt^2 + k1 + k2 + mu1*m1*g*dt;
l2 = -k2 + k3;
l3 = -k3;
l4 = -k2;
l5 = m2*dt^2 + k2 + k3 + mu2*m2*g*dt;
l6 = m3*dt^2 + k3 + mu3*m3*g*dt;

y*(l6*(l5*l1 - l4*l2) - l3*(l3*l1 - l4*l3))
u*l4*l3