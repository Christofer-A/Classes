clear all; close all;
data = readmatrix('SD_temperature.dat');
temperatures1 = data(:, 2:end);
temperatures = temperatures1(:);

histogram(temperatures, 'Normalization', 'probability', 'BinWidth', 1);

E = temperatures(temperatures < 55);

for i = 1:12
    probabilities(i) = size(intersect(E,temperatures1(:,i)),1)/size(temperatures1,1);
end

months = {'January', 'Febuary', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'};
bar(months, probabilities)

for i = 1:12
    probabilities1(i) = probabilities(i)*(1/12)/(sum(probabilities)*(1/12));
end

bar(months, probabilities1)