clc; close all;
% refx = zeros(588,30);
% refxmax = zeros(30, 1);
% refi = zeros(30, 1);
% for i = 1:30
%     refx(:,i) = recMatrix_ref(:,i,8);
%     [refxmax(i), refi(i)] = max(abs(refx(:,i)));
% end
% 
% sigx = zeros(588,30);
% sigxmax = zeros(30, 1);
% sigi = zeros(30, 1);
% for i = 1:30
%     sigx(:,i) = recMatrix_sig(:,i,8);
%     [sigxmax(i), sigi(i)] = max(abs(sigx(:,i)));
% end
% 
% for i = 1:30
%     figure();
%     hold on;
%     plot(refx(:,31-i), 'Color', 'red');
%     plot(sigx(:,31-i), 'Color', 'blue');
% end

speakerPosition = [33 8];

distance = (speakerPosition(1) - (1:30))/100;
refi1 = ones(30,1).*101;
sigi1 = [213 211 209 208 205 204 202 199 197 195 191 188 185 185 184 182 180 178 175 172 169 166 165 164 163 162 159 157 155 151]';
timedelay = (T/588).*(sigi1 - refi1);

% plot(distance,timedelay, 'o');
hold on;

xlabel('Distance Between Speaker and Microphone (m)');
ylabel('Time Delay (s)');
title('Time Delay of Signal vs Distance Between Microphone and Speaker');

yerr = ones(30,1)*3*T/588;
xerr = ones(30,1)*10^-3;
errorbar(distance, timedelay, yerr, yerr, xerr, xerr, 'LineStyle', 'none', 'Marker', '.', 'MarkerSize', 10, 'CapSize', 3, 'LineWidth', 0.5, 'Color', 'green');

plot(distance, distance./343, 'LineWidth', 2);

[p, S] = polyfit(distance, timedelay, 1);

plot(distance, polyval(p, distance), 'LineWidth', 2, 'LineStyle', '--', 'Color', 'black');

legend({'Experimental Time Delay', 'Theoretical Time Delay', 'Line of Best Fit'});

speedOfSound = 1/p(1);
