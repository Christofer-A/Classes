close all; sys = tf([1 5],[1 20])
bode(sys)
figure;
nyquist(sys)
margin(sys)