%% MAE 150 Homework Solution Tempate
% 
% Please name your file hwX.m where the X is the homework number.
%  For example homework 1 should be named hw1.m
%
% All homework assignments need to be uploaded to Canvas by midnight on 
%  Saturday the week they are due.  No late assignments will be accepted.
%
% The format for reporting the answers to the assigned problems is given 
%  for both single and multi-part problems.
%
% Make sure you copy your .m file to a seperate directory and re-run them 
%  to ensure that your script runs and your answers have not changed.
%
% If your script does not run, or your answers are not reported in the 
%  correct format, you will be given no credit.

%% The following commands are required at the very top of the homework file
clear all;   % This clears all workspaces
close all;   % This closes all figures 
clc;         % This clears the command window
format long; 

%% Student name, ID number, and homework_number are required
name = 'AAAA AAAA';
id = 'A00000000';
hw_num = 1;

%% This is how to report your answer for a single part question
% Problem 1: 
% Compute sine of 180 degrees and put the answer into p1.
p1 = sind( 180 );

%% This is how to report your answer for a multi-part question
% Problem 2: 
% (a) Create figure 1 to show the function y = sin(x) for x = 0 to 360
% degrees. Set p2a = 'See figure 1'.
x = 0:360;
y = sind(x);
figure(1);
plot(x , y , 'r-');
xlabel( 'x' ); ylabel( 'y' ); box on; grid on;
title( 'y = sin(x) ');
p2a = 'See figure 1';

% (b) Find the maximum value of y and put it in p2b.
p2b = max(y);


