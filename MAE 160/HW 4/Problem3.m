close all; clear; clc;
values = [1040 1092 1120 1210 1320 1381 1419 1470 1490 1540];
flexureStrength = 3.*values*50*10^-3/(2*10*10^-3*(5*10^-3)^2);
N = size(values,2);
i = 1:N;
P = (N + 1 - i)./(N + 1);

x = log(flexureStrength);
y = log(log(1./P));

coefficients = polyfit(x,y,1);
m = coefficients(1);
c = coefficients(2);
yfit = polyval(coefficients, x);
sigma0 = exp(-c/m);

plot(x, y, 'ko');
hold on;
plot(x, yfit, 'r-', 'LineWidth', 2);
grid on;
xlabel('ln(\sigma)');
ylabel('ln(ln(1/Pi))');
title('Weibull Plot');
legend('Data Points', 'Line of Best Fit', 'Location', 'SouthEast');