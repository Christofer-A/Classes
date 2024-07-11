%GCD
rNOne = RR_poly([-1 1 -3 3],1);
rZero = RR_poly([2 2 -2 -2], 1);
[q(1),remOne] = rNOne/rZero
remOne=trim(remOne);
[q(2),remTwo] = rZero/remOne
remTwo=trim(remTwo);
[q(3),remThree] = remOne/remTwo

%Bezout
x0 = RR_poly([(0.5/56.25) 0 (-5.75/56.25)]);
y0 = RR_poly([(-0.5/56.25) 0 (6.75/56.25)]);

%Diophantine
c = RR_poly([-1 -1 -3 -3],1);
k = c*y0/rNOne;
x = c*x0 + k*rZero;
y = c*y0 - k*rNOne;
x = trim(x)
y = trim(y)
D = y/x

c = RR_poly([-1 -1 -3 -3 -30 -30 -30 -30],1);
k = c*y0/rNOne;
x = c*x0 + k*rZero;
y = c*y0 - k*rNOne;
x = trim(x)
y = trim(y)
D = y/x