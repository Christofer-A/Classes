clear; close all; clc;

filenames = {'nightwall.txt', 'morningwall.txt', 'afternoonwindow.txt', ...
             'afternoonwall.txt', 'nightwindow.txt', 'morningwindow.txt', ...
             'Temperature Measurements.txt'};

surveyData = struct();

for i = 1:length(filenames)
    filename = filenames{i};
    
    fileID = fopen(filename, 'r');
    
    data = textscan(fileID, '%f %f', 'HeaderLines', 7);
    
    fclose(fileID);
    
    [~, name, ~] = fileparts(filename);
    cleanName = strrep(name, ' ', '_'); 
    
    surveyData.(cleanName).time = data{1};
    surveyData.(cleanName).value = data{2};
    
end

weatherData = readtable('Outside Temperature Data.txt');

timeStrings = weatherData.Date_Time;
actualTimes = datetime(timeStrings, 'InputFormat', 'yyyy-MM-dd HH:mm');

elapsedHours = hours(actualTimes - actualTimes(1));

% Extract the temperature column
outsideTemp = weatherData.Temperature_C;

disp('Data extraction complete. The surveyData structure contains:');
disp(surveyData);

% Lighting Graphs
% plot(surveyData.morningwall.time, surveyData.morningwall.value, 'LineWidth', 1);
% hold on;
% plot(surveyData.afternoonwall.time, surveyData.afternoonwall.value, 'LineWidth', 1);
% plot(surveyData.nightwall.time, surveyData.nightwall.value, 'LineWidth', 1);
% legend('Morning, Indirect Sunlight', 'Direct Sunlight', 'Night');
% title('Opposing Wall Light Measurements');
% ylabel('lux');
% xlabel('feet');
% xlim([0 40]);

% plot(surveyData.morningwindow.time, surveyData.morningwindow.value, 'LineWidth', 1);
% hold on;
% plot(surveyData.afternoonwindow.time, surveyData.afternoonwindow.value, 'LineWidth', 1);
% plot(surveyData.nightwindow.time, surveyData.nightwindow.value, 'LineWidth', 1);
% legend('Morning, Indirect Sunlight', 'Direct Sunlight', 'Night');
% title('Window Light Measurements');
% ylabel('lux');
% xlabel('feet');

% Temperature Graphs
plot(surveyData.Temperature_Measurements.time, surveyData.Temperature_Measurements.value, 'LineWidth', 1);
hold on;
plot(elapsedHours, outsideTemp, 'LineWidth', 1);
legend('Indoor Air Temperature', 'Outdoor Air Temperature');
title('Indoor and Outdoor Air Temperatures');
xlabel('hours');
ylabel('°C');
