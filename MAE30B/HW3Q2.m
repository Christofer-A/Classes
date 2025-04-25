ma = 5; mb = 2; m = ma + mb; vgx = 2.14; vgy = 0
syms vax vay vbx vby
eqn1 = [15 0 0] == ma*[vax vay 0] + mb*[vbx vby 0]
eqn2 = [0 0 -0.77] == cross(([0 0 0] - [0 0.0514 0]),ma*([vax vay 0] - [vgx vgy 0])) + cross(([0 0.18 0] - [0 0.0514 0]),mb*([vbx vby 0] - [vgx vgy 0]))
eqn3 = 22.5 == 0.5*m*dot([vgx vgy 0],[vgx vgy 0]) + 0.5*ma*dot(([vax vay 0] - [vgx vgy 0]),([vax vay 0] - [vgx vgy 0])) + 0.5*mb*dot(([vbx vby 0] - [vgx vgy 0]),([vbx vby 0] - [vgx vgy 0]))

e1 = 15 == 5*vax + 2*vbx
e2 = 0 == 5*vay + 2*vby
e3 = -77/100 == (257*vax)/1000 - (643*vbx)/2500 + vgx/5000
e4 = 45/2 == (5*(conj(vax) - conj(vgx))*(vax - vgx))/2 + (5*(conj(vay) - conj(vgy))*(vay - vgy))/2 + (conj(vbx) - conj(vgx))*(vbx - vgx) + (conj(vby) - conj(vgy))*(vby - vgy) + (7*vgx*conj(vgx))/2 + (7*vgy*conj(vgy))/2

G = solve(e1,e2,e3,e4,vax,vay,vbx,vby)