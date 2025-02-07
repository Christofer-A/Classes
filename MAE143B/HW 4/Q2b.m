clear all; close all; m = 1.1; l = 0.9; g = 9.8; b = 0.7; mb = 1.5; opt = stepDataOptions('StepAmplitude',pi/6);
kp = 35; kd = 15; ki = 100;
H1=tf([kd kp ki],[m*l^2 (b+kd) (m*g*l^2 + kp) ki])
[Theta_H1,T_H1] = step(H1,opt);
stepinfo(H1)

figure();
plot(T_H1,Theta_H1,'LineWidth',2);
legend('Kp=35,kd=15,ki=100');
xlabel('Time (sec)');
ylabel('\theta (rad)');