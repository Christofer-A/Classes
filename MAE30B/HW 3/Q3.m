clear; format short; syms c c1
va = 4; vaf = 1.92; vbfy = 1.92; vbfx = 1.44; vcfx = 2.56;

eqn1 = -0.75*va == -1.65*vaf + 1.8*vbfy - 1.5*vbfx - (2*0.75 - c)*vcfx; 

vpa(eqn1)

G = solve([eqn1],[c]);
vpa(G)

vbfx = 2.56; vcfx = 1.44;
eqn2 = -0.75*va == -1.65*vaf + 0.75*vbfy - 1.8*vbfx - (2*0.75 - c1)*vcfx; 

vpa(eqn2)

H = solve([eqn2],[c1]);
vpa(H)