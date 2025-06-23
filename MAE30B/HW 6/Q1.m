mD = 8; mAB = 4; mBC = 4; g = 9.8; hD = -0.25; hBC = 0.125; hABf = -0.125; R = 0.2; LAB = 0.5; LBC = 0.5; PA = 0.25; PB = 0.433; PABG = 0.25; PBCG = 0.683; JDG = 1/2*mD*R^2; JABG = 1/12*mAB*LAB^2; JBCG = 1/12*mBC*LBC^2;
syms vDGf wDf vABGf wABf vBCGf wBCf vBf

eqn1 = mD*g*hD + mBC*g*hBC == 1/2*mD*vDGf^2 + 1/2*JDG*wDf^2 + 1/2*mAB*vABGf^2 + 1/2*JABG*wABf^2 + 1/2*mBC*vBCGf^2 + 1/2*JBCG*wBCf^2 + mD*g*hD + mAB*g*hABf
eqn2 = vDGf == R*wDf
eqn3 = LBC*wBCf == PB*wABf
eqn4 = R*wDf == PA*wABf
eqn5 = vABGf == PABG*wABf
eqn6 = vBCGf == 0.5*vBf
eqn7 = vBf == LBC*wBCf

G = solve([eqn1,eqn2,eqn3,eqn4,eqn5,eqn6,eqn7],[vDGf wDf vABGf wABf vBCGf wBCf vBf])
vpa(G.vDGf)
vpa(G.wDf)
vpa(G.wABf) 
vpa(G.wBCf) 