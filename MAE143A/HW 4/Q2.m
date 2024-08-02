% G = RR_tf(1,[1 0.2 1])
% RR_bode(G)

% G = RR_tf(100,[1 100])
% RR_bode(G)

 syms s
 ilaplace(1/(s^2-1))

G = RR_tf(1,[1 0 -1])
RR_step(G)