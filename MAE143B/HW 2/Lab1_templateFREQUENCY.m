%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%% MAE 143b: Lab 1 FREQUENCY %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This code will help you plot your experimental data
% for a FREQUENCY response and compare it to your models
% Code updated April 2024

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Load data 
clear all; close all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%% Edit code %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
load('4V4A.mat'); % update with the filename you saved - should be in the form 'matdata_month-date-year hour-minute.mat'
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Input parameters
c=0.144;             % parameter to convert from voltage to torque 
f = 40;
g = 4;
J = c/f;
b = g*J;

%% Transfer function models
%%%%%%%%%%%%%%%%%%%%%%%%%%%% Edit code %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
H1=tf([f],[1 g])        % Fill in TF for Omega(s)/Voltage(s) (HINT: use command "tf(num,den)")
H2=tf([f],[1 g 0])        % Fill in TF for Theta(s)/Voltage(s)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Use your model to calculate the system response
timeSeconds = timeArduino/1000000;      % Time from the Arduino is in microseconds, so converting to seconds
timeApprox = linspace(0,timeSeconds(1,end),length(timeSeconds)); % Creating a time vector to use with "lsim" command

%%%%%%%%%%%%%%%%%%%%%%%%%%%% Edit code %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
u = 4*cos(4.*timeApprox)                                % Recreate cosine input (you can use the time vector "timeApprox" that we created for you)
Omega_H1 = lsim(H1,u,timeApprox);                          % based on your given transfer function (H1) calculate omega (HINT: use "lsim" function)
Theta_H2 = lsim(H2,u,timeApprox);                         % based on your given transfer function (H2) calculate theta (HINT: use "lsim" function)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Plot Experimental Data and Model on same plots
% Plot position
figure();
plot(timeApprox,Theta_H2,'LineWidth',2);
hold on;
% Also plot your actual measured data
plot(timeSeconds,position,'LineWidth',2);
legend('H2 Model','Measured Data')
xlabel('Time (sec)')
ylabel('\theta (rad)')

% Plot angular velocity
figure();
plot(timeApprox,Omega_H1,'LineWidth',2);
hold on;
% Also plot your actual measured data
plot(timeSeconds,omega,'LineWidth',2);
legend('H1 Model','Measured Data')
xlabel('Time (sec)')
ylabel('\Omega (rad)')