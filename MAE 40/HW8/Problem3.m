clear all; close all;
syms s;
a = vpa(ilaplace(100*s/((s+1)*(s^2+21*s+20))))

b = vpa(ilaplace(100*(s^2 + 100)/(s*(s^2 + 49))))