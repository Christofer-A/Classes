P = 300; T = 0.35; L = 0.16; d = 0.018; t = 0.002;
E = 70*10^9; G = 26*10^9; sigmay = 240*10^6; tauy = 140*10^6;
E1 = 113*10^9; G1 = 44*10^9; sigmay1 = 880*10^6; tauy1 = 550*10^6;
ro = d/2; ri = ro - t; A = pi*(ro^2 - ri^2); J = pi/2*(ro^4 - ri^4); 

sigma = P/A 
tau = T*ro/J

sigma1 = sigma/2 + sqrt((sigma/2)^2 + tau^2)
sigma2 = sigma/2 - sqrt((sigma/2)^2 + tau^2)

sigmav = sqrt(sigma1^2 + sigma2^2 - sigma1*sigma2)

phi = T*L/(J*G)*(180/pi)

phi1 = T*L/(J*G1)*(180/pi)

FS = sigmay/sigmav

FS1 = sigmay1/sigmav

1/sqrt(3)