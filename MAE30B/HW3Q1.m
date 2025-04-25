syms rgx rgy rgz
ma = 4; mb = 6; mc = 8; va = [4 -2 2]; vb = [1 4 0]; vc = [2 2 4]; vg = [2.11 2.67 2.22]; ra = [0 30 0]; rb = [15 25 35]; rc = [40 0 0]; rg = [22.8 15 11.7];
% eqn1 = (ma + mb + mc)*rg == ma*ra + mb*rb + mc*rc

cross((ra),ma*(va)) + cross((rb),mb*(vb)) + cross((rc),mc*(vc))

cross((ra - rg),ma*(va-vg)) + cross((rb - rg),mb*(vb-vg)) + cross((rc - rg),mc*(vc - vg))

cross((ra - rg),ma*(va-vg)) + cross((rb - rg),mb*(vb-vg)) + cross((rc - rg),mc*(vc - vg)) + cross(rg,(ma+mb+mc)*vg)