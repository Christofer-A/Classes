syms s j k kd kp ki c b
c = 0.144; b = 0.0144; j = 0.0036; kp = 10; ki = 0.01
sys = tf([c 0 0],[j b c*kp c*ki])
rlocus(sys)
figure;
rlocus(sys)