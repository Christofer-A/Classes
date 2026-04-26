clear all; close all; clc; format long;

name = 'Christofer Azadian';
id = 'A17889763';
hw_num = 3;

% Problem 1
% Work shown on paper

syms b;

A = [1 0 0 0 0 0 0 0; 0 1/b 0 0 0 0 0 0; 0 0 2/(b^2) 0 0 0 0 0; 0 0 0 6/b^3 0 0 0 0; 1 1 1 1 1 1 1 1; 0 1/b 2/b 3/b 4/b 5/b 6/b 7/b; 0 0 2/(b^2) 6/(b^2) 12/(b^2) 20/(b^2) 30/(b^2) 42/(b^2); 0 0 0 6/(b^3) 24/(b^3) 60/(b^3) 120/(b^3) 210/(b^3)];
B = [0; 0; 0; 0; 1; 0; 0; 0];
p1a = A\B;

% Problem 2
% (a) Construct four curves

syms x1 x2 y1 y2 y1p y2p t d;

curve1.x = [-5 0];
curve1.y = [0 5];
curve1.dydx = [1 -2];

curve2.x = [0 4];
curve2.y = [5 3];
curve2.dydx = [-2 1];

curve3.x = [4 7];
curve3.y = [3 -2];
curve3.dydx = [1 -5];

curve4.x = [7 9];
curve4.y = [-2 1];
curve4.dydx = [-5 0];

y = @(t, curve) (2.*t.^3 - 3.*t.^2 + 1).*curve.y(1) + (-2.*t.^3 + 3.*t.^2).*curve.y(2) + (t.^3 - 2.*t.^2 + t).*curve.dydx(1).*(curve.x(2) - curve.x(1)) + (t.^3 - t.^2).*curve.dydx(2).*(curve.x(2) - curve.x(1));

x = @(t, curve) (curve.x(2) - curve.x(1)).*t + curve.x(1);

c = [(x2 - x1)*t + x1; (2*t^3 - 3*t^2 + 1)*y1 + (-2*t^3 + 3*t^2)*y2 + (t^3 - 2*t^2 + t)*y1p + (t^3 - t^2)*y2p];

dcdt = diff(c,t);

s = norm(dcdt);

T = 1/s*dcdt;

N = [0 -1; 1 0]*T;

O = c + d*N;

Ot = matlabFunction(O, 'Vars', [t, x1, x2, y1, y2, y1p, y2p, d]);

t = 0:0.05:1;

hold on;
bplot = plot(x(t, curve1), y(t, curve1), 'Color', 'b');
plot(x(t, curve2), y(t, curve2), 'Color', 'b');
plot(x(t, curve3), y(t, curve3), 'Color', 'b');
plot(x(t, curve4), y(t, curve4), 'Color', 'b');

Ot1 = Ot(t, curve1.x(1), curve1.x(2), curve1.y(1), curve1.y(2), curve1.dydx(1)*(curve1.x(2) - curve1.x(1)), curve1.dydx(2)*(curve1.x(2) - curve1.x(1)), -0.3);
Ot2 = Ot(t, curve2.x(1), curve2.x(2), curve2.y(1), curve2.y(2), curve2.dydx(1)*(curve2.x(2) - curve2.x(1)), curve2.dydx(2)*(curve2.x(2) - curve2.x(1)), -0.3);
Ot3 = Ot(t, curve3.x(1), curve3.x(2), curve3.y(1), curve3.y(2), curve3.dydx(1)*(curve3.x(2) - curve3.x(1)), curve3.dydx(2)*(curve3.x(2) - curve3.x(1)), -0.3);
Ot4 = Ot(t, curve4.x(1), curve4.x(2), curve4.y(1), curve4.y(2), curve4.dydx(1)*(curve4.x(2) - curve4.x(1)), curve4.dydx(2)*(curve4.x(2) - curve4.x(1)), -0.3);

rplot = plot(Ot1(1,:), Ot1(2,:), 'Color', 'r');
plot(Ot2(1,:), Ot2(2,:), 'Color', 'r');
plot(Ot3(1,:), Ot3(2,:), 'Color', 'r');
plot(Ot4(1,:), Ot4(2,:), 'Color', 'r');

Ot21 = Ot(t, curve1.x(1), curve1.x(2), curve1.y(1), curve1.y(2), curve1.dydx(1)*(curve1.x(2) - curve1.x(1)), curve1.dydx(2)*(curve1.x(2) - curve1.x(1)), 0.3);
Ot22 = Ot(t, curve2.x(1), curve2.x(2), curve2.y(1), curve2.y(2), curve2.dydx(1)*(curve2.x(2) - curve2.x(1)), curve2.dydx(2)*(curve2.x(2) - curve2.x(1)), 0.3);
Ot23 = Ot(t, curve3.x(1), curve3.x(2), curve3.y(1), curve3.y(2), curve3.dydx(1)*(curve3.x(2) - curve3.x(1)), curve3.dydx(2)*(curve3.x(2) - curve3.x(1)), 0.3);
Ot24 = Ot(t, curve4.x(1), curve4.x(2), curve4.y(1), curve4.y(2), curve4.dydx(1)*(curve4.x(2) - curve4.x(1)), curve4.dydx(2)*(curve4.x(2) - curve4.x(1)), 0.3);

gplot = plot(Ot21(1,:), Ot21(2,:), 'Color', 'g');
plot(Ot22(1,:), Ot22(2,:), 'Color', 'g');
plot(Ot23(1,:), Ot23(2,:), 'Color', 'g');
plot(Ot24(1,:), Ot24(2,:), 'Color', 'g');

legend([bplot, rplot, gplot], {'Hermite Spline', 'Offset -0.3', 'Offset 0.3'});
xlabel('x value');
ylabel('y value');
title('Cubic Hermite Splines with Offsets');

p2a = 'See figure 1';

% (b) Determine displacement smoothness

p2b = 'The bottom offset curve is relatively smooth overall, while the top offset curve is not smooth in one area. The curvature of the local minimum of the base Hermite spline causes undercutting for the top displaced curve, which makes it not smooth.';

% Problem 3

% (a) Generate motion profiles for a cam

syms theta L beta;

harmonic = L/2*(1-cos(pi*theta/beta));
d1harmonic = diff(harmonic, theta);
d2harmonic = diff(d1harmonic, theta);
d3harmonic = diff(d2harmonic, theta);

harmonic1 = matlabFunction(harmonic, 'Vars', [theta, beta, L]);
d1harmonic1 = matlabFunction(d1harmonic, 'Vars', [theta, beta, L]);
d2harmonic1 = matlabFunction(d2harmonic, 'Vars', [theta, beta, L]);
d3harmonic1 = matlabFunction(d3harmonic, 'Vars', [theta, beta, L]);

dwell1 = 10;

poly = L*(10/(beta^3)*theta^3 - 15/(beta^4)*theta^4 + 6/(beta^5)*theta^5);
d1poly = diff(poly, theta);
d2poly = diff(d1poly, theta);
d3poly = diff(d2poly, theta);

poly1 = matlabFunction(poly, 'Vars', [theta, beta, L]);
d1poly1 = matlabFunction(d1poly, 'Vars', [theta, beta, L]);
d2poly1 = matlabFunction(d2poly, 'Vars', [theta, beta, L]);
d3poly1 = matlabFunction(d3poly, 'Vars', [theta, beta, L]);

dwell2 = 20;

cycloid = L*(theta/beta - 1/(2*pi)*sin(2*pi*theta/beta));
d1cycloid = diff(cycloid, theta);
d2cycloid = diff(d1cycloid, theta);
d3cycloid = diff(d2cycloid, theta);

cycloid1 = matlabFunction(cycloid, 'Vars', [theta, beta, L]);
d1cycloid1 = matlabFunction(d1cycloid, 'Vars', [theta, beta, L]);
d2cycloid1 = matlabFunction(d2cycloid, 'Vars', [theta, beta, L]);
d3cycloid1 = matlabFunction(d3cycloid, 'Vars', [theta, beta, L]);

dwell3 = 0;

motorspeed = 1000*2*pi/60;

figure();
tiledlayout(4, 1);
nexttile;

theta1 = (0:1:120);
theta2 = (120:1:130);
theta3 = (130:1:210);
theta4 = (210:1:230);
theta5 = (230:1:350);
theta6 = (350:1:360);

hold on;
plot(theta1, harmonic1(deg2rad(theta1), deg2rad(120), 10), 'Color', 'b');
plot(theta2, dwell1*ones(1, size(theta2,2)), 'Color', 'b');
plot(theta3, 10 + poly1(deg2rad(theta3 - 130), deg2rad(210 - 130), 20 - 10), 'Color', 'b');
plot(theta4, dwell2*ones(1, size(theta4,2)), 'Color', 'b');
plot(theta5, 20 + cycloid1(deg2rad(theta5 - 230), deg2rad(350 - 230), 0 - 20), 'Color', 'b');
plot(theta6, dwell3*ones(1, size(theta6,2)), 'Color', 'b');

xlim([0 360]);
ylim([-1 25]);
xlabel('Theta (Degrees)');
ylabel('Displacement (mm)');
title('Displacement Profile');

nexttile;

hold on;
plot(theta1, motorspeed*d1harmonic1(deg2rad(theta1), deg2rad(120), 10), 'Color', 'b');
plot(theta2, motorspeed*dwell1*zeros(1, size(theta2,2)), 'Color', 'b');
plot(theta3, motorspeed*d1poly1(deg2rad(theta3 - 130), deg2rad(210 - 130), 20 - 10), 'Color', 'b');
plot(theta4, motorspeed*dwell2*zeros(1, size(theta4,2)), 'Color', 'b');
plot(theta5, motorspeed*d1cycloid1(deg2rad(theta5 - 230), deg2rad(350 - 230), 0 - 20), 'Color', 'b');
plot(theta6, motorspeed*dwell3*zeros(1, size(theta6,2)), 'Color', 'b');

xlim([0 360]);
% ylim([-30 30]);
xlabel('Theta (Degrees)');
ylabel('Velocity (mm/s)');
title('Velocity Profile');

nexttile;

hold on;
% plot(theta1, d2harmonic1(deg2rad(theta1), deg2rad(120), 10));
% plot(theta2, dwell1*zeros(1, size(theta2,2)));
% plot(theta3, d2poly1(deg2rad(theta3 - 130), deg2rad(210 - 130), 20 - 10));
% plot(theta4, dwell2*zeros(1, size(theta4,2)));
% plot(theta5, d2cycloid1(deg2rad(theta5 - 230), deg2rad(350 - 230), 0 - 20));
% plot(theta6, dwell3*zeros(1, size(theta6,2)));
% Combining them into one plot because the vertical gap is not drawn
plot([theta1 theta2 theta3 theta4 theta5 theta6], motorspeed^2*[d2harmonic1(deg2rad(theta1), deg2rad(120), 10) dwell1*zeros(1, size(theta2,2)) d2poly1(deg2rad(theta3 - 130), deg2rad(210 - 130), 20 - 10) dwell2*zeros(1, size(theta4,2)) d2cycloid1(deg2rad(theta5 - 230), deg2rad(350 - 230), 0 - 20) dwell3*zeros(1, size(theta6,2))], 'Color', 'b');

xlim([0 360]);
% ylim([-40 40]);
xlabel('Theta (Degrees)');
ylabel('Acceleration (mm/s^2)');
title('Acceleration Profile');

nexttile;

hold on;
% plot(theta1, d3harmonic1(deg2rad(theta1), deg2rad(120), 10));
% plot(theta2, dwell1*zeros(1, size(theta2,2)));
% plot(theta3, d3poly1(deg2rad(theta3 - 130), deg2rad(210 - 130), 20 - 10));
% plot(theta4, dwell2*zeros(1, size(theta4,2)));
% plot(theta5, d3cycloid1(deg2rad(theta5 - 230), deg2rad(350 - 230), 0 - 20));
% plot(theta6, dwell3*zeros(1, size(theta6,2)));
% Combining them into one plot because the vertical gap is not drawn
plot([theta1 theta2 theta3 theta4 theta5 theta6], motorspeed^3*[d3harmonic1(deg2rad(theta1), deg2rad(120), 10) dwell1*zeros(1, size(theta2,2)) d3poly1(deg2rad(theta3 - 130), deg2rad(210 - 130), 20 - 10) dwell2*zeros(1, size(theta4,2)) d3cycloid1(deg2rad(theta5 - 230), deg2rad(350 - 230), 0 - 20) dwell3*zeros(1, size(theta6,2))], 'Color', 'b');

xlim([0 360]);
% ylim([-400 400]);
xlabel('Theta (Degrees)');
ylabel('Jerk (mm/s^3)');
title('Jerk Profile');

p3a = 'See figure 2';

% (b) Plot cam profile

figure();
hold on;
axis equal;

thetaall = 0:1:360;

rprime = 20;
rfollower = 6;

xr = @(theta, r) r*cos(theta);

yr = @(theta, r) r*sin(theta);

% Prime Circle
plot(xr(deg2rad(thetaall), rprime), yr(deg2rad(thetaall), rprime), 'LineStyle', '--');

% Base Circle
plot(xr(deg2rad(thetaall), rprime - rfollower), yr(deg2rad(thetaall), rprime - rfollower), 'LineStyle', ':');

% Pitch Curve
xpitch = @(y, theta) (y + 20).*sin(theta);
ypitch = @(y, theta) (y + 20).*cos(theta);

x1c = xpitch(harmonic1(deg2rad(theta1), deg2rad(120), 10), deg2rad(theta1));
y1c = ypitch(harmonic1(deg2rad(theta1), deg2rad(120), 10), deg2rad(theta1));
x2c = xpitch(dwell1*ones(1, size(theta2,2)), deg2rad(theta2));
y2c = ypitch(dwell1*ones(1, size(theta2,2)), deg2rad(theta2));
x3c = xpitch(10 + poly1(deg2rad(theta3 - 130), deg2rad(210 - 130), 20 - 10), deg2rad(theta3));
y3c = ypitch(10 + poly1(deg2rad(theta3 - 130), deg2rad(210 - 130), 20 - 10), deg2rad(theta3));
x4c = xpitch(dwell2*ones(1, size(theta4,2)), deg2rad(theta4));
y4c = ypitch(dwell2*ones(1, size(theta4,2)), deg2rad(theta4));
x5c = xpitch(20 + cycloid1(deg2rad(theta5 - 230), deg2rad(350 - 230), 0 - 20), deg2rad(theta5));
y5c = ypitch(20 + cycloid1(deg2rad(theta5 - 230), deg2rad(350 - 230), 0 - 20), deg2rad(theta5));
x6c = xpitch(dwell3*ones(1, size(theta6,2)), deg2rad(theta6));
y6c = ypitch(dwell3*ones(1, size(theta6,2)), deg2rad(theta6));

plot([x1c x2c x3c x4c x5c x6c], [y1c y2c y3c y4c y5c y6c], 'Color', 'black', 'LineStyle', '-.');

% Contour Curve

phi = @(y, dydtheta) atan(dydtheta./(y + 20));

xcontour = @(xpitch, theta, phi) xpitch - rfollower.*sin(theta - phi);
ycontour = @(ypitch, theta, phi) ypitch - rfollower.*cos(theta - phi);

phi1 = phi(harmonic1(deg2rad(theta1), deg2rad(120), 10), d1harmonic1(deg2rad(theta1), deg2rad(120), 10));
phi2 = phi(dwell1*ones(1, size(theta2,2)), dwell1*zeros(1, size(theta2,2)));
phi3 = phi(10 + poly1(deg2rad(theta3 - 130), deg2rad(210 - 130), 20 - 10), d1poly1(deg2rad(theta3 - 130), deg2rad(210 - 130), 20 - 10));
phi4 = phi(dwell2*ones(1, size(theta4,2)), dwell2*zeros(1, size(theta4,2)));
phi5 = phi(20 + cycloid1(deg2rad(theta5 - 230), deg2rad(350 - 230), 0 - 20), d1cycloid1(deg2rad(theta5 - 230), deg2rad(350 - 230), 0 - 20));
phi6 = phi(dwell3*ones(1, size(theta6,2)), dwell3*zeros(1, size(theta6,2)));

x1contour = xcontour(x1c, deg2rad(theta1), phi1);
y1contour = ycontour(y1c, deg2rad(theta1), phi1);
x2contour = xcontour(x2c, deg2rad(theta2), phi2);
y2contour = ycontour(y2c, deg2rad(theta2), phi2);
x3contour = xcontour(x3c, deg2rad(theta3), phi3);
y3contour = ycontour(y3c, deg2rad(theta3), phi3);
x4contour = xcontour(x4c, deg2rad(theta4), phi4);
y4contour = ycontour(y4c, deg2rad(theta4), phi4);
x5contour = xcontour(x5c, deg2rad(theta5), phi5);
y5contour = ycontour(y5c, deg2rad(theta5), phi5);
x6contour = xcontour(x6c, deg2rad(theta6), phi6);
y6contour = ycontour(y6c, deg2rad(theta6), phi6);

plot([x1contour x2contour x3contour x4contour x5contour x6contour], [y1contour y2contour y3contour y4contour y5contour y6contour], 'Color', 'black');

title('Cam Contour Plot');
xlabel('Length (mm)');
ylabel('Height (mm)');
legend('Prime Circle', 'Base Circle', 'Pitch Curve', 'Cam Contour');
p3b = 'See figure 3';

% (c) Show pressure angle as a function of theta

figure();
hold on;
plot([theta1 theta2 theta3 theta4 theta5 theta6], rad2deg([phi1 phi2 phi3 phi4 phi5 phi6]));

title('Pressure Angle vs Theta');
xlabel('Theta (Degrees)');
ylabel('Pressure Angle (Degrees)');

p3c = 'See figure 4';

% (d) Cam design analysis

p3d = 'The cam design is not good, because of large acceleration, jerk, and pressure angles. There are vertical portions of the acceleration and jerk profile, which can cause equipment damage due to the excessive and sudden force change. Additionally, the pressure angle is more than 30 degrees at a point, which also could damage equipment. Allowing for less dwell and more time to rise or fall would create smoother profiles and reduce the amount of jerk and acceleration. Additionally, slightly offsetting the follower and introducing some eccentricity would make it where the pressure angle does not exceed 30 degrees';

