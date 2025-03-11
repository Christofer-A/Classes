close all;
sys = tf([50000],[1 60 500 0])
% step(sys);
% rlocus(sys);
% figure;
bode(sys);
% figure;
% margin(sys);
% figure;
% nyquist(sys);
