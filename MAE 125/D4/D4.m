% Open the data file
fileID = fopen('gp.txt', 'r');

% Read the data using textscan. 
% 'HeaderLines', 7 skips the introductory text and units.
% The '%f %f' tells MATLAB to look for two columns of numbers. 
% It will automatically stop reading when it hits the "Run 2" text at the end.
data = textscan(fileID, '%f %f', 'HeaderLines', 7);

% Close the file
fclose(fileID);

% Extract time and temperature into separate arrays
time = data{1};
temperature = data{2};

% Create the plot
figure;
plot(time, temperature, '-r', 'LineWidth', 1.5);

% Add labels, title, and a grid
xlabel('Time (s)');
ylabel('Temperature (°C)');
title('Temperature vs. Time (Run 1)');
grid on;