close all; clear all;
data = readtable('Problem3Table');
plot(data.Time_min_, data.Strain)
xlabel('Time')
ylabel('Strain')
title('Creep Data')
grid on;