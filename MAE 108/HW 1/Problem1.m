clear all; close all;
temperatures = readmatrix('SD_temperature.dat');
tempNovember = temperatures(:,12);
minimum = min(tempNovember)
maximum = max(tempNovember)
histogram(tempNovember,55:1:67)
mean = 1/size(tempNovember,1)*sum(tempNovember);
standardDeviation = sqrt(1/(size(tempNovember,1) - 1)*sum((tempNovember - mean).^2));
probability = sum(tempNovember >= 65)/size(tempNovember,1);
figure;
boxchart(temperatures(:,2:end))