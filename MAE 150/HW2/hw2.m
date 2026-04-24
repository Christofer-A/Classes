clear all; close all; clc; format long;

name = 'Christofer Azadian';
id = 'A17889763';
hw_num = 2;

% Problem 1
% Work shown on paper

% (a) Find nominal value of b with worst case error

p1a = [30 -0.4];

% (b) Find nominal value of b with statistical error

p1b = [30 sqrt(-0.08)];

% Problem 2

a = 25 - 0.3;
b = 25;
c = 25 + 0.5;
list = makedist;
triangularDistribution = makedist('Triangular', 'a', a, 'b', b, 'c', c);

% (a) Find the mean

p2a = mean(triangularDistribution);

% (b) Find the mode

p2b = b;

% (c) Find the median

p2c = median(triangularDistribution);

% (d) Find probability thickness is less than 25 mm

p2d = cdf(triangularDistribution, 25);

% (e) Find 90 percentile thickness 

p2e = icdf(triangularDistribution, 0.9);

% Problem 3

% (a) Find nominal value

p3a = 5*10000*5^4/(32*200*10^9*0.1*0.2^3);

% (b) Find worse case error

dqdl = 4*p3a/5;
dqdh = 3*p3a/0.2;
dqdb = p3a/0.1;

p3b = dqdl*0.02 + dqdh*0.008 + dqdb*0.005;

% (c) Find statistical error

p3c = sqrt(dqdl^2*0.02^2 + dqdh^2*0.008^2 + dqdb^2*0.005^2);

% (d) Perform Monte Carlo Analysis

rng('default');

L = random(makedist('Uniform', 'lower', 5 - 0.02, 'upper', 5 + 0.02), 1, 50000);

h = random(makedist('Normal', 'mu', 0.2, 'sigma', 0.008/3), 1, 50000);

b = random(makedist('Triangular', 'a', 0.1 - 0.005, 'b', 0.1, 'c', 0.1 + 0.005), 1, 50000);

d = 5*10000.*L.^4./(32*200*10^9.*b.*h.^3);

figure();

subplot(2,2,1);

histogram(L, 100);

title('Distribution of L');
xlabel('Length (m)');
ylabel('Number');

subplot(2,2,2);

histogram(h, 100);

title('Distribution of h');
xlabel('Thickness (m)');
ylabel('Number');

subplot(2,2,3);

histogram(b, 100);

title('Distribution of b');
xlabel('Width (m)');
ylabel('Number');

subplot(2,2,4);

histogram(d, 100);

title('Distribution of d');
xlabel('Deflection (m)');
ylabel('Number');

p3d = 'See figure 1';

% (e) Find mean of deflection

phat = mle(d);

p3e = phat(1);

% (f) Find the standard deviation of deflection

p3f = phat(2);

% (g) Find the probability of d <= 5.6 mm

deflection = makedist('Normal', 'mu', p3e, 'sigma', p3f);

p3g = cdf(deflection, 5.6*10^-3);

