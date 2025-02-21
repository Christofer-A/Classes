syms s j k kd kp ki c b
c = 0.144; b = 0.0144; j = 0.0036; kd = 0.2; ki = 0.01
sys = tf([c 0],[j (b+c*kd) 0 c*ki])
rlocus(sys)