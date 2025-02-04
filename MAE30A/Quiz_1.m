% syms LE1 LE2 Ls F1 F2 phi theta thetax thetay thetaz
syms F1
Ls = 0.15; LE1 = 0.25; LE2 = 0.15; phi = 15.0; theta = 75.0; thetay = 105.0; thetaz = 75.0; thetax = rad2deg(acos(sqrt(1-cos(deg2rad(thetay))^2-cos(deg2rad(thetaz))^2))); F2 = 15.0; M = 1600; thetax
rca = [-LE1 Ls*cos(deg2rad(30)) Ls*sin(deg2rad(30))]
rda = [-LE1 (Ls*cos(deg2rad(30)) + LE2) Ls*sin(deg2rad(30))]
Force1 = [-F1*cos(deg2rad(phi))*sin(deg2rad(theta)) -F1*cos(deg2rad(phi))*cos(deg2rad(theta)) -F1*sin(deg2rad(phi))]
Force2 = [-F2*cos(deg2rad(thetax)) F2*cos(deg2rad(thetay)) F2*cos(deg2rad(thetaz))]

M1 = cross(rca,Force2)
M2 = cross(rda,Force1)

Moment = M1 + M2
MMag = sqrt(Moment(1)^2 + Moment(2)^2 + Moment(3)^2)
MMag = simplify(vpa(MMag))

eqn = M==MMag
G = solve(eqn,F1)
F1 = G(2)
Force1 = [-F1*cos(deg2rad(phi))*sin(deg2rad(theta)) -F1*cos(deg2rad(phi))*cos(deg2rad(theta)) -F1*sin(deg2rad(phi))]; vpa(Force1)