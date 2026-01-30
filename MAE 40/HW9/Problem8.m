clear all; close all; 
T = tf([4*10^6 0],[1 41000 4*10^7])
bode(T)