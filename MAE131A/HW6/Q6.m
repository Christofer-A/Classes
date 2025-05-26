syms b L x
w = 12.5; P = 500;  
Ay = w*L + P; Ma = L^2/2*w + L*P;

S = 1/6*b*(8*b)^2; A = b*8*b;

eqn1 = 1.8*10^3 == Ma/S
eqn2 = 120 == 3/2*(Ay/A)

assume(b > 0)
assume(L > 0)
G1 = solve([eqn1,eqn2],[b,L],'Real',true)
vpa(G1.b)
vpa(G1.L)