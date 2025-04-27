clear; ma = 5; mb = 2; m = ma + mb; va = [3 0 0]; vb = [0 0 0]; ra = [0 0.18 0]; rb = [0 0 0]; raf = [0 0 0]; rbf = [0 0.18 0];
syms vafx vafy vafz vbfx vbfy vbfz
vaf = [vafx vafy vafz]; vbf = [vbfx vbfy vbfz];

rg = ma*ra/(ma + mb)

L = ma*va + mb*vb   

vg = L/(ma + mb)

Hg = cross((ra - rg),ma*(va - vg)) + cross((rb - rg),mb*(vb - vg))

rgf = mb*rbf/(ma + mb)

eqn1 = L == ma*vaf + mb*vbf
eqn2 = Hg == cross((raf - rgf),ma*(vaf - vg)) + cross((rbf - rgf),mb*(vbf - vg))

G = solve([eqn1,eqn2],[vafx,vafy,vafz,vbfx,vbfy,vbfz])
