clear; syms vbfx vbfy vcfx
va = [4 0]; vam = norm(va); vb = [0 0]; vc = [0 0]; vaf = [0 -1.92]; vafm = norm(vaf); vbf = [vbfx vbfy]; vbfm = norm(vbf); vcf = [vcfx 0]; vcfm = norm(vcf); 

eqn1 = va == vaf + vbf + vcf;
eqn2 = vam^2 == vafm^2 + vbfm^2 + vcfm^2;

vpa(eqn1)
vpa(eqn2)

G = solve([eqn1, eqn2],[vbfx,vbfy,vcfx])