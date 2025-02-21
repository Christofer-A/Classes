syms s j k kd kp ki c b
c = 0.144; b = 0.0144; j = 0.0036; kd = 0.2; kp = 10
sys = tf([c],[j (b+c*kd) c*kp 0])
rlocus(sys)