clear all; close all; clc; format long;

name = 'Christofer Azadian';
id = 'A17889763';
hw_num = 3;

% Problem 1

% (c) Design new cam
% Code taken from hw3.m

syms theta L beta;

harmonic = L/2*(1-cos(pi*theta/beta));
d1harmonic = diff(harmonic, theta);
d2harmonic = diff(d1harmonic, theta);
d3harmonic = diff(d2harmonic, theta);

harmonic1 = matlabFunction(harmonic, 'Vars', [theta, beta, L]);
d1harmonic1 = matlabFunction(d1harmonic, 'Vars', [theta, beta, L]);
d2harmonic1 = matlabFunction(d2harmonic, 'Vars', [theta, beta, L]);
d3harmonic1 = matlabFunction(d3harmonic, 'Vars', [theta, beta, L]);

dwell1 = 30;

poly = L*(10/(beta^3)*theta^3 - 15/(beta^4)*theta^4 + 6/(beta^5)*theta^5);
d1poly = diff(poly, theta);
d2poly = diff(d1poly, theta);
d3poly = diff(d2poly, theta);

poly1 = matlabFunction(poly, 'Vars', [theta, beta, L]);
d1poly1 = matlabFunction(d1poly, 'Vars', [theta, beta, L]);
d2poly1 = matlabFunction(d2poly, 'Vars', [theta, beta, L]);
d3poly1 = matlabFunction(d3poly, 'Vars', [theta, beta, L]);

dwell2 = 15;

cycloid = L*(theta/beta - 1/(2*pi)*sin(2*pi*theta/beta));
d1cycloid = diff(cycloid, theta);
d2cycloid = diff(d1cycloid, theta);
d3cycloid = diff(d2cycloid, theta);

cycloid1 = matlabFunction(cycloid, 'Vars', [theta, beta, L]);
d1cycloid1 = matlabFunction(d1cycloid, 'Vars', [theta, beta, L]);
d2cycloid1 = matlabFunction(d2cycloid, 'Vars', [theta, beta, L]);
d3cycloid1 = matlabFunction(d3cycloid, 'Vars', [theta, beta, L]);

dwell3 = 0;

dwell4 = 30;

motorspeed = 100*2*pi/60;

% figure();
% tiledlayout(3, 1);
% nexttile;

theta1 = 0:2:18;
theta2 = 18:2:72;
theta3 = 72:2:108;
theta4 = 108:2:216;
theta5 = 216:2:246;
theta6 = 246:2:340;
theta7 = 340:2:360;

% hold on;
% plot(theta1, dwell1*ones(1, size(theta1,2)), 'Color', 'b');
% plot(theta2, 30 + cycloid1(deg2rad(theta2 - 18), deg2rad(72 - 18), 15 - 30), 'Color', 'b');
% plot(theta3, dwell2*ones(1, size(theta3,2)), 'Color', 'b');
% plot(theta4, 15 + cycloid1(deg2rad(theta4 - 108), deg2rad(216 - 108), 0 - 15), 'Color', 'b');
% plot(theta5, dwell3*ones(1, size(theta5,2)), 'Color', 'b');
% plot(theta6, poly1(deg2rad(theta6 - 246), deg2rad(340 - 246), 30 - 0), 'Color', 'b');
% plot(theta7, dwell4*ones(1, size(theta7,2)), 'Color', 'b');

% xlim([0 360]);
% ylim([-1 35]);
% xlabel('Theta (Degrees)');
% ylabel('Displacement (mm)');
% title('Displacement Profile');

% nexttile;

% hold on;
% plot(theta1, motorspeed*dwell1*zeros(1, size(theta1,2)), 'Color', 'b');
% plot(theta2, motorspeed*d1cycloid1(deg2rad(theta2 - 18), deg2rad(72 - 18), 15 - 30), 'Color', 'b');
% plot(theta3, motorspeed*dwell2*zeros(1, size(theta3,2)), 'Color', 'b');
% plot(theta4, motorspeed*d1cycloid1(deg2rad(theta4 - 108), deg2rad(216 - 108), 0 - 15), 'Color', 'b');
% plot(theta5, motorspeed*dwell3*zeros(1, size(theta5,2)), 'Color', 'b');
% plot(theta6, motorspeed*d1poly1(deg2rad(theta6 - 246), deg2rad(340 - 246), 30 - 0), 'Color', 'b');
% plot(theta7, motorspeed*dwell4*zeros(1, size(theta7,2)), 'Color', 'b');

% xlim([0 360]);
% xlabel('Theta (Degrees)');
% ylabel('Velocity (mm/s)');
% title('Velocity Profile');

% nexttile;

% hold on;
% plot([theta1 theta2 theta3 theta4 theta5 theta6 theta7], motorspeed^2*[dwell1*zeros(1, size(theta1,2)), d2cycloid1(deg2rad(theta2 - 18), deg2rad(72 - 18), 15 - 30), dwell2*zeros(1, size(theta3,2)), d2cycloid1(deg2rad(theta4 - 108), deg2rad(216 - 108), 0 - 15), dwell3*zeros(1, size(theta5,2)), d2poly1(deg2rad(theta6 - 246), deg2rad(340 - 246), 30 - 0), dwell4*zeros(1, size(theta7,2))], 'Color', 'b');

% xlim([0 360]);
% xlabel('Theta (Degrees)');
% ylabel('Acceleration (mm/s^2)');
% title('Acceleration Profile');

% (b) Plot cam profile

% figure();
% hold on;
% axis equal;

thetaall = 0:2:360;

rprime = 20;
rfollower = 6;

xr = @(theta, r) r*cos(theta);

yr = @(theta, r) r*sin(theta);

% Prime Circle
% plot(xr(deg2rad(thetaall), rprime), yr(deg2rad(thetaall), rprime), 'LineStyle', '--');

% Base Circle
% plot(xr(deg2rad(thetaall), rprime - rfollower), yr(deg2rad(thetaall), rprime - rfollower), 'LineStyle', ':');

% Pitch Curve
xpitch = @(y, theta) (y + 20).*sin(theta);
ypitch = @(y, theta) (y + 20).*cos(theta);

x1c = xpitch(dwell1*ones(1, size(theta1,2)), deg2rad(theta1));
y1c = ypitch(dwell1*ones(1, size(theta1,2)), deg2rad(theta1));
x2c = xpitch(30 + cycloid1(deg2rad(theta2 - 18), deg2rad(72 - 18), 15 - 30), deg2rad(theta2));
y2c = ypitch(30 + cycloid1(deg2rad(theta2 - 18), deg2rad(72 - 18), 15 - 30), deg2rad(theta2));
x3c = xpitch(dwell2*ones(1, size(theta3,2)), deg2rad(theta3));
y3c = ypitch(dwell2*ones(1, size(theta3,2)), deg2rad(theta3));
x4c = xpitch(15 + cycloid1(deg2rad(theta4 - 108), deg2rad(216 - 108), 0 - 15), deg2rad(theta4));
y4c = ypitch(15 + cycloid1(deg2rad(theta4 - 108), deg2rad(216 - 108), 0 - 15), deg2rad(theta4));
x5c = xpitch(dwell3*ones(1, size(theta5,2)), deg2rad(theta5));
y5c = ypitch(dwell3*ones(1, size(theta5,2)), deg2rad(theta5));
x6c = xpitch(poly1(deg2rad(theta6 - 246), deg2rad(340 - 246), 30 - 0), deg2rad(theta6));
y6c = ypitch(poly1(deg2rad(theta6 - 246), deg2rad(340 - 246), 30 - 0), deg2rad(theta6));
x7c = xpitch(dwell4*ones(1, size(theta7,2)), deg2rad(theta7));
y7c = ypitch(dwell4*ones(1, size(theta7,2)), deg2rad(theta7));

% plot([x1c x2c x3c x4c x5c x6c x7c], [y1c y2c y3c y4c y5c y6c y7c], 'Color', 'black', 'LineStyle', '-.');

% Contour Curve

phi = @(y, dydtheta) atan(dydtheta./(y + 20));

xcontour = @(xpitch, theta, phi) xpitch - rfollower.*sin(theta - phi);
ycontour = @(ypitch, theta, phi) ypitch - rfollower.*cos(theta - phi);

phi1 = phi(dwell1*ones(1, size(theta1,2)), dwell1*zeros(1, size(theta1,2)));
phi2 = phi(30 + cycloid1(deg2rad(theta2 - 18), deg2rad(72 - 18), 15 - 30), d1cycloid1(deg2rad(theta2 - 18), deg2rad(72 - 18), 15 - 30));
phi3 = phi(dwell2*ones(1, size(theta3,2)), dwell2*zeros(1, size(theta3,2)));
phi4 = phi(15 + cycloid1(deg2rad(theta4 - 108), deg2rad(216 - 108), 0 - 15), d1cycloid1(deg2rad(theta4 - 108), deg2rad(216 - 108), 0 - 15));
phi5 = phi(dwell3*ones(1, size(theta5,2)), dwell3*zeros(1, size(theta5,2)));
phi6 = phi(poly1(deg2rad(theta6 - 246), deg2rad(340 - 246), 30 - 0), d1poly1(deg2rad(theta6 - 246), deg2rad(340 - 246), 30 - 0));
phi7 = phi(dwell4*ones(1, size(theta7,2)), dwell4*zeros(1, size(theta7,2)));

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
x7contour = xcontour(x7c, deg2rad(theta7), phi7);
y7contour = ycontour(y7c, deg2rad(theta7), phi7);

xExport = [x1contour x2contour x3contour x4contour x5contour x6contour x7contour]';
yExport = [y1contour y2contour y3contour y4contour y5contour y6contour y7contour]';
zExport = zeros(1, 187)';

cleanedExport = unique(round([xExport yExport zExport], 5), 'rows', 'stable');
writematrix(cleanedExport, 'newCamProfile.txt', 'Delimiter', 'space');

% plot([x1contour x2contour x3contour x4contour x5contour x6contour x7contour], [y1contour y2contour y3contour y4contour y5contour y6contour y7contour], 'Color', 'black');
% title('Cam Contour Plot');
% xlabel('Length (mm)');
% ylabel('Height (mm)');
% legend('Prime Circle', 'Base Circle', 'Pitch Curve', 'Cam Contour');
% p3b = 'See figure 3';

linearDisplacement = readmatrix('Linear Displacement.csv', 'NumHeaderLines', 3);
tLinearDisplacement = linearDisplacement(:,2);
yLinearDisplacement = linearDisplacement(:,3);
newlinearDisplacement = readmatrix('New Linear Displacement.csv', 'NumHeaderLines', 3);
newtLinearDisplacement = newlinearDisplacement(:,2);
newyLinearDisplacement = newlinearDisplacement(:,3);
linearVelocity = readmatrix('Linear Velocity.csv', 'NumHeaderLines', 3);
tLinearVelocity = linearVelocity(:,2);
yLinearVelocity = linearVelocity(:,3);
newlinearVelocity = readmatrix('New Linear Velocity.csv', 'NumHeaderLines', 3);
newtLinearVelocity = newlinearVelocity(:,2);
newyLinearVelocity = newlinearVelocity(:,3);
linearAcceleration = readmatrix('Linear Acceleration.csv', 'NumHeaderLines', 3);
tLinearAcceleration = linearAcceleration(:,2);
yLinearAcceleration = linearAcceleration(:,3);
newlinearAcceleration = readmatrix('New Linear Acceleration.csv', 'NumHeaderLines', 3);
newtLinearAcceleration = newlinearAcceleration(:,2);
newyLinearAcceleration = newlinearAcceleration(:,3);

figure();
tiledlayout(3,2);
nexttile;

