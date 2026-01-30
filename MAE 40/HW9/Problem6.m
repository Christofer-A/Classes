clear all; close all; 
T = tf([5*10^-2 0],[10^-2 10^3])
bode(T)