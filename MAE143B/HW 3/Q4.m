clear all; close all; c = 0.144; f = 40; g = 4; j = c/f; b = g*j; opt = stepDataOptions('StepAmplitude',1);
% j
% H2=tf([0.5*c],[j b 0.5*c])
% [Theta_H2,T_H2] = step(H2,opt);

H3=tf([c],[j b c])
[Theta_H3,T_H3] = step(H3,opt);

% H4=tf([2*c],[j b 2*c])
% [Theta_H4,T_H4] = step(H4,opt);
% 
% H5=tf([5*c],[j b 5*c])
% [Theta_H5,T_H5] = step(H5,opt);
% 
% H6=tf([8*c],[j b 8*c])
% [Theta_H6,T_H6] = step(H6,opt);

% k = b^2/(4*j*c)
% H7=tf([k*c],[j b k*c])
% [Theta_H7,T_H7] = step(H7,opt);

figure();
% plot(T_H2,Theta_H2,'LineWidth',2);
hold on;
plot(T_H3,Theta_H3,'LineWidth',2);
% plot(T_H4,Theta_H4,'LineWidth',2);
% plot(T_H5,Theta_H5,'LineWidth',2);
% plot(T_H6,Theta_H6,'LineWidth',2);
% plot(T_H7,Theta_H7,'LineWidth',2);
% 'K=0.5','K=2','K=5','K=8' ,'Critical Damping' ,
legend('K=1');
xlabel('Time (sec)');
ylabel('\theta (rad)');