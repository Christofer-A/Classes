AB = 0.2; wab = -19; BD = sqrt((0.38+0.1)^2 + (0.1 + 0.1)^2); theta = atan(0.2/0.48); phi = (90-22.6) * pi/180; DE = 0.38;
syms vd wed wdb;

vb = AB*wab

eqn1 = vd == DE*wed;
eqn2 = -vd*sin(theta) == vb*cos(theta)
eqn3 = vd*cos(theta) == vb*sin(theta) + wdb*BD

G = solve([eqn1,eqn2,eqn3],[vd,wed,wdb])

vd = double(G.vd)
wed = double(G.wed)
wdb = double(G.wdb)

ab = AB*wab^2; 
syms adut adun abd ade; 

eqn4 = adut == ab*cos(theta) + BD*abd
eqn5 = adun == ab*sin(theta) + BD*wdb^2
eqn6 = adun*sin(theta) + adut*sin(phi) == DE*ade
eqn7 = adun*cos(theta) - adut*cos(phi) == DE*wed^2

G1 = solve([eqn4,eqn5,eqn6,eqn7],[adut,adun,abd,ade])
adut = double(G1.adut)
adun = double(G1.adun)
abd = double(G1.abd)
ade = double(G1.ade)
% ad = sqrt(adut^2 + adun^2)

