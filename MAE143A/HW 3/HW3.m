%Written by Christofer Azadian Copyright
syms s
% G = RR_tf(1,RR_poly([1 0.1 100]))
% RR_impulse(G)
% y = vpa(simplifyFraction(ilaplace(1/(s^2 + 0.1*s + 100))))

% G = RR_tf(1,RR_poly([1 0.1 149.784]))
% RR_impulse(G)
% y = vpa(simplifyFraction(ilaplace(1/(s^2 + 0.1*s + 149.784))))

G = RR_tf(1,RR_poly([1 0.05 94.5]))
RR_impulse(G)
y = vpa(simplifyFraction(ilaplace(1/(s^2 + 0.05*s + 94.5))))