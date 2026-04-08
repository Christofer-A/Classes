close all; clear; clc;
values = [321 389 411 423 438 454 475 489 497 501];
N = size(values,2);
i = 1:N;
P = (N + 1 - i)./(N + 1);

x = log(values);
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