syms rgx rgy rgz
ma = 4; mb = 6; mc = 8; va = [4 -2 2]; vb = [1 4 0]; vc = [2 2 4]; ra = [0 30 0]; rb = [15 25 35]; rc = [40 0 0]; rg = [22.8 15 11.7];

L = ma*va + mb*vb + mc*vc

vg = L/(ma+mb+mc)

H0 = cross((ra),ma*(va)) + cross((rb),mb*(vb)) + cross((rc),mc*(vc))

Hg = cross((ra - rg),ma*(va-vg)) + cross((rb - rg),mb*(vb-vg)) + cross((rc - rg),mc*(vc - vg))

temp = cross(rg,(ma+mb+mc)*vg)

Hg + temp