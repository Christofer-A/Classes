clear all; close all; clc; format long;

name = 'Christofer Azadian';
id = 'A17889763';
hw_num = 7;

% Problem 1

l1 = 4; l2 = 3; l3 = 5.1; l4 = 4.2; l5 = 30;

% (a) Calculate DOF of linkage system

p1a = 3*(4-4-1) + 4*1;

% (b) Determine four bar linkage type

p1bans = l3 + l2 <= l1 + l4;

p1b = 'Crank-Rocker, linkage is suitable for a windshield wiper design because the wiper has a defined range of motion and the crank can be powered with a motor';

w2 = 45*2*pi/60;

% (c) Find theta4 in folded and dead center positions

thmax = acosd(((l2-l3)^2-l1^2-l4^2)/(2*l1*l4));

thmin = acosd(((l2+l3)^2-l1^2-l4^2)/(2*l1*l4));

p1c = [thmax thmin];

% (d) Obtain the swing angle

thswing = -diff(p1c);

p1d = thswing;

% (e) Determine extreme transmission angles

mumax = acosd((l3^2 + l4^2 - (l1 + l2)^2)/(2*l3*l4));

mumin = acosd((l3^2 + l4^2 - (l1 - l2)^2)/(2*l3*l4));

p1e = [mumax mumin];

% (f) Plot trace paths of crank, rocker, and point P

L1 = l1/l4; L2 = l1/l2; L3 = (l1^2 + l2^2 - l3^2 + l4^2)/(2*l2*l4);

Afunc = @(th2) cosd(th2) - L2 + L3 - L1.*cosd(th2);

Bfunc = @(th2) -2.*sind(th2);

Cfunc = @(th2) L2 + L3 - (1 + L1).*cosd(th2);

th4maxfunc = @(A, B, C) 2.*atand((-B + sqrt(B.^2 - 4.*A.*C))./(2.*A));

th4minfunc = @(A, B, C) 2.*atand((-B - sqrt(B.^2 - 4.*A.*C))./(2.*A));

th2 = 0:1:360;

% th4max = th4maxfunc(Afunc(th2), Bfunc(th2), Cfunc(th2));

th4 = th4minfunc(Afunc(th2), Bfunc(th2), Cfunc(th2));

xcrankfunc = @(th2) l2.*cosd(th2);

ycrankfunc = @(th2) l2.*sind(th2);

xrockerfunc = @(th4) l1 + l4.*cosd(th4);

yrockerfunc = @(th4) l4.*sind(th4);

xQ = l1 + (l4 + l5).*cosd(th4);

yQ = (l4 + l5).*sind(th4);

xcrank = xcrankfunc(th2);

ycrank = ycrankfunc(th2);

xrocker = xrockerfunc(th4);

yrocker = yrockerfunc(th4);

hold on;
axis equal;
plot(xcrank, ycrank, 'LineWidth', 1.5, 'LineStyle', '--');
plot(xrocker, yrocker, 'LineWidth', 1.5, 'LineStyle', '--');
plot(xQ, yQ, 'LineWidth', 1.5);
xlabel('x (cm)');
ylabel('y (cm)');
title('Trace Paths of Crank, Rocker, and Wiper');
legend({'Crank', 'Rocker', 'Wiper'});

p1f = 'See figure 1';

% (f) Plot motion quantity profiles

figure();
tiledlayout(5,1);
nexttile;

th3func = @(th4, th2) atan2d((l4.*sind(th4) - l2.*sind(th2)),(l4.*cosd(th4)) + l1 - l2.*cosd(th2));

th3 = th3func(th4, th2);

hold on;
plot(th2, th3);
plot(th2, th4);
xlim([0 360]);
xlabel('Input Angle (degrees)');
ylabel('Output Angle (degrees)');
title('Input Angle vs Output Angle');
legend({'theta3', 'theta4'});
nexttile;

% syms t; syms th2s(t) th3s(t) th4s(t);
% 
% loopeqnx = l2.*cos(th2s) + l3.*cos(th3s) - l4.*cos(th4s) - l1 == 0;
% loopeqny = l2.*sin(th2s) + l3.*sin(th3s) - l4.*sin(th4s) == 0;
% 
% velocityeqnx = diff(loopeqnx, t);
% velocityeqny = diff(loopeqny, t);
% 
% accelerationeqnx = diff(velocityeqnx, t);
% accelerationeqny = diff(velocityeqny, t);
% 
% jerkeqnx = diff(accelerationeqnx, t);
% jerkeqny = diff(accelerationeqny, t);

w3 = zeros(1, length(th2));
w4 = zeros(1, length(th2));

for i = 1:length(th2)
    Bv = [l2*w2*sind(th2(i)); -l2*w2*cosd(th2(i))];
    A = [-l3*sind(th3(i)) l4*sind(th4(i)); l3*cosd(th3(i)) -l4*cosd(th4(i))];
    w = A \ Bv;
    w3(i) = w(1);
    w4(i) = w(2);
end

hold on;
plot(th2, w3);
plot(th2, w4);
xlim([0 360]);
xlabel('Input Angle (degrees)');
ylabel('Angular Velocity (rad/s)');
title('Input Angle vs Angular Velocity');
legend({'w3', 'w4'});
nexttile;

a3 = zeros(1, length(th2));
a4 = zeros(1, length(th2));

for i = 1:length(th2)
    Ba = [l2*w2^2*cosd(th2(i)) + l3*w3(i)^2*cosd(th3(i)) - l4*w4(i)^2*cosd(th4(i)); l2*w2^2*sind(th2(i)) + l3*w3(i)^2*sind(th3(i)) - l4*w4(i)^2*sind(th4(i))];
    a = A \ Ba;
    a3(i) = a(1);
    a4(i) = a(2);
end

hold on;
plot(th2, a3);
plot(th2, a4);
xlim([0 360]);
xlabel('Input Angle (degrees)');
ylabel('Angular Acceleration (rad/s^2)');
title('Input Angle vs Angular Acceleration');
legend({'a3', 'a4'});
nexttile;

j3 = zeros(1, length(th2));
j4 = zeros(1, length(th2));

for i = 1:length(th2)
    Bj = [-l2*w2^3*sind(th2(i)) + 3*l3*a3(i)*w3(i)*cosd(th3(i)) - l3*w3(i)^3*sind(th3(i)) - 3*l4*w4(i)*a4(i)*cosd(th4(i)) + l4*w4(i)^3*sind(th4(i)); 
        l2*w2^3*cosd(th2(i)) + 3*l3*w3(i)*a3(i)*sind(th3(i)) + l3*w3(i)^3*cosd(th3(i)) - 3*l4*w4(i)*a4(i)*sind(th4(i)) - l4*w4(i)^3*cosd(th4(i))];
    j = A \ Bj;
    j3(i) = j(1);
    j4(i) = j(2);
end

hold on;
plot(th2, j3);
plot(th2, j4);
xlim([0 360]);
xlabel('Input Angle (degrees)');
ylabel('Angular Jerk (rad/s^3)');
title('Input Angle vs Angular Jerk');
legend({'j3', 'j4'});
nexttile;

mufunc = @(th2) acosd((l3.^2 + l4.^2 - l1.^2 - l2.^2 + 2.*l1.*l2.*cosd(th2))./(2.*l3.*l4));

mu = mufunc(th2);

hold on;
plot(th2, mu);
xlim([0 360]);
xlabel('Input Angle (degrees)');
ylabel('Transmission Angle (degrees)');
title('Input Angle vs Transmission Angle');

p1g = 'See Figure 2';

% (h) Determine if the wiper is a good design

p1h = 'While the wiper has the range to wipe away rain from a windshield, it suffers from jamming due to its minimum transmission angle. Near 0 degrees, there is exceptionally high angular acceleration and jerk, which can cause damage to the wiper. Additionally, the torque transfer is not optimized as the transmission angle is below 45 degrees for a significant amount of the cycle.';

% Problem 2

% (a) Plot rocker angle relative to crank angle

l2 = 7; l3 = 12; l4 = 15; l5 = 4; l6 = 5; l8 = 5; l9 = 18; l1 = sqrt(l8^2 + l9^2);

L1 = l1/l4; L2 = l1/l2; L3 = (l1^2 + l2^2 - l3^2 + l4^2)/(2*l2*l4);

th4 = th4minfunc(Afunc(th2), Bfunc(th2), Cfunc(th2));

th1 = atand(l8/l9);

th4new = th4 - th1;

figure();
plot(th2, th4new);
xlim([-5 365]);
xlabel('Crank Angle (degrees)');
ylabel('Rocker Angle (degrees)');
title('Rocker Angle vs Crank Angle Relative to the Horizontal');

p2a = 'See figure 3';

% (b) Plot path of point P

th3 = th3func(th4, th2);

xP = l2.*cosd(th2 - th1) + l6.*cosd(90 + th3 - th1);
yP = l2.*sind(th2 - th1) + l6.*sind(90 + th3 - th1);

figure();
plot(xP, yP);
xlabel('x (cm)');
ylabel('y (cm)');
title('Position of Point P for One Revolution');

p2b = 'See figure 4';

% (c) Plot distance between point P and Q

xQ = l9 + (l4 + l5).*cosd(th4new);

yQ = -l8 + (l4 + l5).*sind(th4new);

distance = sqrt((xP - xQ).^2 + (yP - yQ).^2);

figure();
plot(th2, distance);
xlabel('Crank Angle (degrees)');
ylabel('Distance between P and Q (cm)');
title('Distance between P and Q Over One Revolution of the Crank');

p2c = 'See figure 5';

% (d) Find the crank angle where maximum separation occurs

[maxSeparation, index] = max(distance);

p2d = th2(index);

% (e) Plot angular velocity of long rocker link

