clear; syms Wr Cy Cz Mcx Mcy Mcz Gx Gy Dx Dy Dz Mdz Mdy N Ax Ay Max May Maz Bx By Mbx Mby Mbz
Wcw = 200*9.8; Gz = 0.07*N; T = 2*11246;
fx = Dx + Gx == 0
fy = Cy + Gy + Dy == 0
fz = -Wr + Cz + Gz + Dz - Wcw == 0

rch = [13 0 0]; rcg = [-2 -2.5 0]; rcd = [-4 0 0]; rci = [-12 0 0];
Wr = [0 0 -Wr]; G = [Gx Gy Gz]; D = [Dx Dy Dz]; C = [0 Cy Cz]; Wcw = [0 0 -Wcw]; Mdy = [0 Mdy 0]; Mdz = [0 0 Mdz]; Mcx = [Mcx 0 0]; Mcy = [0 Mcy 0]; Mcz = [0 0 Mcz];

Mc = cross(rch, Wr) + cross(rcg, G) + cross(rcd,D) + Mdz + Mdy + Mcx + Mcy + Mcz + cross(rci, Wcw) == 0

eqMcx = Mc(1)
eqMcy = Mc(2)
eqMcz = Mc(3)

rdh = [17 0 0]; rdg = [2 -2.5 0]; rdc = [4 0 0]; rdi = [-8 0 0];
Md = cross(rdh, Wr) + cross(rdg, G) + cross(rdc,C) + Mcx + Mcy + Mcz + Mdy + Mdz + cross(rdi, Wcw) == 0

eqMdx = Md(1)
eqMdy = Md(2)
eqMdz = Md(3)

f1x = Ax + Dx + Bx == 0
f1y = Ay + Cy + Dy + By == 0
f1z = Cz + T + Dz == 0

rca = [-2 2.5 7.5]; rfa = [-4 5 15]; rda = [-6 2.5 7.5]; rba = [-8 0 0]; 
T = [0 0 T]; B = [Bx By 0]; Mbx = [Mbx 0 0]; Mby = [0 Mby 0]; Mbz = [0 0 Mbz]; A = [Ax Ay 0]; Max = [Max 0 0]; May = [0 May 0]; Maz = [0 0 Maz];

Ma = cross(rca, C) + Mcx + Mcy + Mcz + cross(rfa, T) + cross(rda, D) + Mdy + Mdz + cross(rba, B) + Mbx + Mby + Mbz + Max + May + Maz == 0

eqMax = Ma(1)
eqMay = Ma(2)
eqMaz = Ma(3)

rcb = [6 2.5 7.5]; rfb = [4 5 15]; rdb = [2 2.5 7.5]; rab = [8 0 0]; 

Mb = cross(rcb, C) + Mcx + Mcy + Mcz + cross(rfb, T) + cross(rdb, D) + Mdy + Mdz + cross(rab, A) + Max + May + Maz + Mbx + Mby + Mbz == 0

eqMbx = Mb(1)
eqMby = Mb(2)
eqMbz = Mb(3)

rca = [2 -2.5 -7.5]; rcf = [-2 2.5 7.5]; rcb = [-6 -2.5 -7.5];

Mc1 = cross(rca, A) + Max + May + Maz + Mcx + Mcy + Mcz + cross(rcf, T) + cross(rcd, D) + Mdy + Mdz + cross(rcb, B) + Mbx + Mby + Mbz == 0

eqMc1x = Mc1(1)
eqMc1y = Mc1(2)
eqMc1z = Mc1(3)

rda = [6 -2.5 -7.5]; rdf = [2 2.5 7.5]; rdb = [-2 -2.5 -7.5];

Md1 = cross(rda, A) + Max + May + Maz + Mcx + Mcy + Mcz + cross(rdf, T) + cross(rdc, C) + Mdy + Mdz + cross(rdb, B) + Mbx + Mby + Mbz == 0

eqMd1x = Md1(1)
eqMd1y = Md1(2)
eqMd1z = Md1(3)

% f2x = Ax + Dx + Bx + Gx == 0
% f2y = Ay + Cy + Gy + Dy + By == 0
% f2z = Wr(3) + Cz + Gz + T(3) + Dz + Wcw(3)

sol = solve(Gz, fx, fy, fz, f1x, f1y, f1z, eqMcx, eqMcy, eqMcz, eqMdx, eqMdy, eqMdz, eqMax, eqMay, eqMaz, eqMbx, eqMby, eqMbz, eqMc1x, eqMc1y, eqMc1z, eqMd1x, eqMd1y, eqMd1z)