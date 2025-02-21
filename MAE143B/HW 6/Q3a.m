syms s j k c b z
c = 0.144; b = 0.0144; j = 0.0036; z = 13.75;
sys = tf([c c*z],[j (b+40*j) 40*b 0])
rlocus(sys)
