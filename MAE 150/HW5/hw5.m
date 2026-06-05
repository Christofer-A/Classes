clear all; close all; clc; format long;

name = 'Christofer Azadian';
id = 'A17889763';
hw_num = 5;

% Problem 1

kf = @(l) 200*10^9*(0.05^4/12)/(l^3).*[12 6*l -12 6*l; 6*l 4*l^2 -6*l 2*l^2; -12 -6*l 12 -6*l; 6*l 2*l^2 -6*l 4*l^2];

k13 = kf(0.4);
k2 = kf(0.6);

kp1 = zeros(8,8);

kp1(1:4, 1:4) = kp1(1:4, 1:4) + k13;
kp1(3:6, 3:6) = kp1(3:6, 3:6) + k2;
kp1(5:8, 5:8) = kp1(5:8, 5:8) + k13;

kp1f = compose("%.4e", kp1);

var1 = zeros(8,1);
var = kp1([2 3 4 6 7 8], [2 3 4 6 7 8])\[0; -10^4; 0; 0; 0; 0];
var1([2 3 4 6 7 8]) = var;

syms x w1 th1 w2 th2 l

w = w1*(1-3*x^2/(l^2) + 2*x^3/(l^3)) + th1*(x - 2*x^2/l + x^3/(l^2)) + w2*(3*x^2/(l^2) - 2*x^3/(l^3)) + th2*(-x^2/l + x^3/(l^2));
th = diff(w,x);

wf = matlabFunction(w,"Vars",[x, w1, th1, w2, th2, l]);
thf = matlabFunction(th,"Vars",[x, w1, th1, w2, th2, l]);

p1x1 = wf(0.2, var1(1), var1(2), var1(3), var1(4), 0.4);
p1th1 = thf(0.2, var1(1), var1(2), var1(3), var1(4), 0.4);

p1x2 = wf(0.2, var1(5), var1(6), var1(7), var1(8), 0.4);
p1th2 = thf(0.2, var1(5), var1(6), var1(7), var1(8), 0.4);

% Problem 2

p2k1 = kf(1);
p2k2 = kf(0.4);

p2k = zeros(6, 6);
p2k(1:4, 1:4) = p2k(1:4, 1:4) + p2k1;
p2k(3:6, 3:6) = p2k(3:6, 3:6) + p2k2;

p2k2f = compose("%.4e", p2k2);
p2kf = compose("%.4e", p2k);

f = @(q, l) [q*l/2; q*l^2/12; q*l/2; -q*l^2/12];

p2f = zeros(6, 1);

p2f([3 4 5 6]) = f(-5*10^3, 0.4);

p2var = zeros(6,1);
p2var([2 4 5 6]) = p2k([2 4 5 6], [2 4 5 6])\p2f([2 4 5 6]);

p2x1 = wf(0.1, p2var(1), p2var(2), p2var(3), p2var(4), 1);
p2th1 = thf(0.1, p2var(1), p2var(2), p2var(3), p2var(4), 1);

p2x2 = wf(0.2, p2var(3), p2var(4), p2var(5), p2var(6), 0.4);
p2th2 = thf(0.2, p2var(3), p2var(4), p2var(5), p2var(6), 0.4);

% Problem 3

% (a) Determine Local Stiffness Matrices

nodes = 5;

p3kf = @(l) 200*10^9*(0.05^4/12)/(l^3).*[12 6*l -12 6*l; 6*l 4*l^2 -6*l 2*l^2; -12 -6*l 12 -6*l; 6*l 2*l^2 -6*l 4*l^2];

p3k1 = p3kf(0.25);
p3k2 = p3kf(0.25);
p3k3 = p3kf(0.25);
p3k4 = p3kf(0.25);
p3kvec = {p3k1 p3k2 p3k3 p3k4};
p4a = p3k1;

% (b) Find Global Stiffness Matrix

p3k = zeros(nodes*2, nodes*2);
j = 1;
for i = 1:2:(2*(nodes - 1) - 1)
    p3k(i:i+3, i:i+3) = p3k(i:i+3, i:i+3) + p3kvec{j};
    j = j + 1;
end

p4b = p3k;

% (c) Find Reduced Global Stiffness Matrix

p4c = p3k([3 4 5 6 7 8 10], [3 4 5 6 7 8 10]);

% (d) Determine Deflection

p3func = @(q, l) [q*l/2; q*l^2/12; q*l/2; -q*l^2/12];

p3f = zeros(nodes*2, 1);

p3f([7 8 9 10]) = p3func(-2*10^3, 0.25) + p3f([7 8 9 10]);
p3f([5 6 7 8]) = p3func(-2*10^3, 0.25) + p3f([5 6 7 8]);
p3f(5) = p3f(5) - 10000;

p3var = zeros(nodes*2,1);
p3var([3 4 5 6 7 8 10]) = p3k([3 4 5 6 7 8 10], [3 4 5 6 7 8 10])\p3f([3 4 5 6 7 8 10]);

p4d = p3var(1:2:nodes*2 - 1);

% (e) Determine Bending Angle

p4e = p3var(2:2:2*nodes);

% (f) Create figure to display displacement, bending angle, shear force, and bending moment

p4LoadVec = p3k*p3var;

p4w = w1.*(1-3*x^2/(l^2) + 2*x^3/(l^3)) + th1*(x - 2*x^2/l + x^3/(l^2)) + w2*(3*x^2/(l^2) - 2*x^3/(l^3)) + th2*(-x^2/l + x^3/(l^2));
p4th = diff(p4w,x);
p4M = diff(p4th,x);
p4V = diff(p4M, x);

p4M = 200*10^9*(0.05^4/12)*p4M;
p4V = 200*10^9*(0.05^4/12)*p4V;

p4wf = matlabFunction(p4w,"Vars",[x, w1, th1, w2, th2, l]);
p4thf = matlabFunction(p4th,"Vars",[x, w1, th1, w2, th2, l]);
p4Mf = matlabFunction(p4M,"Vars",[x, w1, th1, w2, th2, l]);
p4Vf = matlabFunction(p4V,"Vars",[x, w1, th1, w2, th2, l]);

xPlot = [];
wPlot = [];
thPlot = [];
VPlot = [];
MPlot = [];
xPlot1 = 0:0.025:0.25;

for i = 1:nodes-1
    wPlot1 = p4wf(xPlot1, p4d(i), p4e(i), p4d(i+1), p4e(i+1), 0.25);
    thPlot1 = p4thf(xPlot1, p4d(i), p4e(i), p4d(i+1), p4e(i+1), 0.25);
    VPlot1 = p4Vf(xPlot1, p4d(i), p4e(i), p4d(i+1), p4e(i+1), 0.25);
    MPlot1 = p4Mf(xPlot1, p4d(i), p4e(i), p4d(i+1), p4e(i+1), 0.25);

    if isscalar(MPlot1)
        MPlot1 = MPlot1 * ones(size(xPlot1));
    end
    if isscalar(VPlot1)
        VPlot1 = VPlot1 * ones(size(xPlot1));
    end

    xGlobal = xPlot1 + (i - 1)*0.25;
    xPlot = [xPlot xGlobal];
    wPlot = [wPlot wPlot1];
    thPlot = [thPlot thPlot1];
    VPlot = [VPlot VPlot1];
    MPlot = [MPlot MPlot1];
end

tiledlayout(4,1);
nexttile;

plot(xPlot,wPlot);

xlabel('Distance Along Beam (m)');
ylabel('Deflection (m)');
title('Deflection vs Distance Along Beam');

nexttile;

plot(xPlot,thPlot);

xlabel('Distance Along Beam (m)');
ylabel('Bending Angle (rad)');
title('Bending Angle vs Distance Along Beam');

nexttile;

plot(xPlot,VPlot);

xlabel('Distance Along Beam (m)');
ylabel('Shear Force (N)');
title('Shear Force vs Distance Along Beam');

nexttile;

plot(xPlot,MPlot);

xlabel('Distance Along Beam (m)');
ylabel('Bending Moment (Nm)');
title('Bending Moment vs Distance Along Beam');

p4f = 'See Figure 1';

% (g) Repeat With 16 Elements

nodes = 17;
le = 1/16;

p3gk1 = p3kf(le);

for i = 1:nodes-1
    p3gkvec{i} = p3gk1;
end

p3gk = zeros(nodes*2, nodes*2);
j = 1;
for i = 1:2:(2*(nodes - 1) - 1)
    p3gk(i:i+3, i:i+3) = p3gk(i:i+3, i:i+3) + p3gkvec{j};
    j = j + 1;
end

p3gf = zeros(nodes*2, 1);

for i = 9:16
    p3gf([2*i-1, 2*i, 2*i+1, 2*i+2]) = p3func(-2*10^3, le) + p3gf([2*i-1, 2*i, 2*i+1, 2*i+2]);
end

p3gf(17) = p3gf(17) - 10000;

p3gvar = zeros(nodes*2,1);
p3gvar([3:32 34]) = p3gk([3:32 34], [3:32 34])\p3gf([3:32 34]);

p4gd = p3gvar(1:2:nodes*2 - 1);

p4ge = p3gvar(2:2:2*nodes);

p4gLoadVec = p3gk*p3gvar;

xgPlot = [];
wgPlot = [];
thgPlot = [];
VgPlot = [];
MgPlot = [];
xgPlot1 = 0:le/10:le;

for i = 1:nodes-1
    wgPlot1 = p4wf(xgPlot1, p4gd(i), p4ge(i), p4gd(i+1), p4ge(i+1), le);
    thgPlot1 = p4thf(xgPlot1, p4gd(i), p4ge(i), p4gd(i+1), p4ge(i+1), le);
    VgPlot1 = p4Vf(xgPlot1, p4gd(i), p4ge(i), p4gd(i+1), p4ge(i+1), le);
    MgPlot1 = p4Mf(xgPlot1, p4gd(i), p4ge(i), p4gd(i+1), p4ge(i+1), le);

    if isscalar(MgPlot1)
        MgPlot1 = MgPlot1 * ones(size(xgPlot1));
    end
    if isscalar(VgPlot1)
        VgPlot1 = VgPlot1 * ones(size(xgPlot1));
    end

    xgGlobal = xgPlot1 + (i - 1)*le;
    xgPlot = [xgPlot xgGlobal];
    wgPlot = [wgPlot wgPlot1];
    thgPlot = [thgPlot thgPlot1];
    VgPlot = [VgPlot VgPlot1];
    MgPlot = [MgPlot MgPlot1];
end

figure();
tiledlayout(4,1);
nexttile;

plot(xgPlot,wgPlot);

xlabel('Distance Along Beam (m)');
ylabel('Deflection (m)');
title('Deflection vs Distance Along Beam');

nexttile;

plot(xgPlot,thgPlot);

xlabel('Distance Along Beam (m)');
ylabel('Bending Angle (rad)');
title('Bending Angle vs Distance Along Beam');

nexttile;

plot(xgPlot,VgPlot);

xlabel('Distance Along Beam (m)');
ylabel('Shear Force (N)');
title('Shear Force vs Distance Along Beam');

nexttile;

plot(xgPlot, MgPlot);

xlabel('Distance Along Beam (m)');
ylabel('Bending Moment (Nm)');
title('Bending Moment vs Distance Along Beam');

p4g = 'See Figure 2';

% Problem 4

% (b) Create a Figure to Compare with ANSYS

figure();
hold on;
axis equal;

node1 = [0 0];
node2 = [0.25 0];
node3 = [0.5 0];
node4 = [0.75 0];
node5 = [1 0];

plot([node1(1) node2(1)], [node1(2) node2(2)], 'Color', 'black', 'LineWidth', 1.5);
plot([node2(1) node3(1)], [node2(2) node3(2)], 'Color', 'black', 'LineWidth', 1.5);
plot([node3(1) node4(1)], [node3(2) node4(2)], 'Color', 'black', 'LineWidth', 1.5);
plot([node4(1) node5(1)], [node4(2) node5(2)], 'Color', 'black', 'LineWidth', 1.5);

node1(2) = node1(2) + 100*p3var(1);
node2(2) = node2(2) + 100*p3var(3);
node3(2) = node3(2) + 100*p3var(5);
node4(2) = node4(2) + 100*p3var(7);
node5(2) = node5(2) + 100*p3var(9);

plot([node1(1) node2(1)], [node1(2) node2(2)], 'Color', 'red', 'LineWidth', 1.5, 'LineStyle', '--');
plot([node2(1) node3(1)], [node2(2) node3(2)], 'Color', 'red', 'LineWidth', 1.5, 'LineStyle', '--');
plot([node3(1) node4(1)], [node3(2) node4(2)], 'Color', 'red', 'LineWidth', 1.5, 'LineStyle', '--');
plot([node4(1) node5(1)], [node4(2) node5(2)], 'Color', 'red', 'LineWidth', 1.5, 'LineStyle', '--');

blackPlot = plot(NaN, NaN, 'Color', 'black');
redPlot = plot(NaN, NaN, 'Color', 'red');

legend([blackPlot redPlot], {'Original Beam', 'Deformed Beam'});
xlabel('Length (m)');
ylabel('Height (m)');
title('Original Beam vs Deformed Beam');
