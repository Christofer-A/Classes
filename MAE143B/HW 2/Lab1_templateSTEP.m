%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%% MAE 143b: Lab 1 STEP %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This code will help you plot your experimental data
% for a STEP response and compare it to your models
% Code updated April 2024

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Load data 
clear all; close all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%% Edit code %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
load('1.5V.mat'); % update with the filename you saved - should be in the form 'matdata_month-date-year hour-minute.mat'
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

%% Use your model to calculate the step response
timeSeconds = timeArduino/1000000;      % Time from the Arduino is in microseconds, so converting to seconds

opt = stepDataOptions('StepAmplitude',1.5);  % set options for step input - input voltage
%%%%%%%%%%%%%%%%%%%%%%%%%%%% Edit code %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[Omega_H1,T_H1] = step(H1,opt);          % calculate modeled omega using H1 (HINT: use "step" function)
[Theta_H2,T_H2] = step(H2,opt);          % calculate modeled theta using H2 (HINT: use "step" function)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Plot Experimental Data and Model on same plots
% Plot position
figure();
plot(T_H2,Theta_H2,'LineWidth',2);
hold on;
% Also plot your actual measured data
plot(timeSeconds,position,'LineWidth',2);
legend('H2 Model','Measured Data');
xlabel('Time (sec)');
ylabel('\theta (rad)');

% Plot angular velocity
figure();
plot(T_H1,Omega_H1,'LineWidth',2);
hold on;
% Also plot your actual measured data
plot(timeSeconds,omega,'LineWidth',2);
legend('H1 Model','Measured Data');
xlabel('Time (sec)');
ylabel('\Omega (rad)');

% figure();
% pzplot(H1);

figure();
pzplot(H2);