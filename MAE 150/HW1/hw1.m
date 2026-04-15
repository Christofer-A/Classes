clear all; close all; clc; format long;

name = 'Christofer Azadian';
id = 'A17889763';
hw_num = 1;

%Problem 2
x = @(t) cosd(4.*t).*cosd(t);
y = @(t) cosd(4.*t).*sind(t);

xRed = @(t) 0.1*cosd(4.*t).*cosd(t);
yRed = @(t) 0.1*cosd(4.*t).*sind(t);

t = 0:360;

plot(x(t), y(t), 'black');
xlim([-1.5, 1.5]);
ylim([-1.5, 1.5]);
xlabel('x');
ylabel('y');
title('2D Transformation of a Parametric Curve');
grid on;
hold on;

n = [xRed(t); yRed(t); ones(size(t))];

trans = @(theta) [1 0 cosd(theta); 0 1 sind(theta); 0 0 1];

for i = 1:8
    N = trans(i*45)*n;
    plot(N(1,:), N(2,:), 'red');
end

p2 = 'See figure 1';

%Problem 3
% (a) Show aircraft at different times

aircraft = stlread('aircraft.stl');
connectivity = aircraft.ConnectivityList;
axis equal;
points = aircraft.Points;
points = [points, ones(size(points,1),1)];

%Rotate 90 degrees clockwise, since aircraft points in negative x direction

rotatez = @(theta) [cosd(theta) sind(theta) 0 0; -sind(theta) cosd(theta) 0 0; 0 0 1 0; 0 0 0 1];
rotatey = @(theta) [cosd(theta) 0 sind(theta) 0; 0 1 0 0; -sind(theta) 0 cosd(theta) 0; 0 0 0 1];
translate = @(dx, dy, dz) [1 0 0 dx; 0 1 0 dy; 0 0 1 dz; 0 0 0 1];

N = rotatez(90)*points';

figure();
% aircraftSurface = trimesh(connectivity, N(1,:), N(2,:), N(3,:));
xlabel('x');
ylabel('y');
zlabel('z');
xlim([-2, 2]);
ylim([-10, 90]);
zlim([-2, 2]);
axis equal;
hold on;
view(3);
p3a = 'See figure 2';
title('Aircraft Motion');
colors = ['r', 'g', 'b', 'y', 'm', 'c'];
for t = 0:8:40
    N1 = rotatey(3*t)*translate(0, 2*t, 0)*N;
    legendIndex(t/8 + 1) = trimesh(connectivity, N1(1,:), N1(2,:), N1(3,:), 'EdgeColor', colors(t/8 + 1));
end

legend(legendIndex, 't = 0', 't = 8', 't = 16', 't = 24', 't = 32', 't = 40');

% (b) Find lowest point

[value, index] = min(N1(3,:));
p3b = N1(1:3,index);
