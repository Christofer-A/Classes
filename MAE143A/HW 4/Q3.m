clear; syms w h z K p f a a0 a1 b0 z1
%f = (2*(1-cos(w*h)))/(w*h*sin(w*h));
s = (2/(f*h)) * ((z-1)/(z+1));
D = K*((s+z1)/(s+p));
D = simplifyFraction(D)
D = subs(D,f*h,a)
D = subs(D,a*z1,a0)
D = subs(D,a*p,b0)
[numD,denD] = numden(D)

a1 = -(b0-2)/(b0+2);
a1 = subs(a1,b0,a*p);
a1 = subs(a1,a,f*h);
a1 = simplify(subs(a1,f,(2*(1-cos(w*h)))/(w*h*sin(w*h))))

b1 = K*(a0+2)/(b0+2);
b1 = subs(b1,b0,a*p);
b1 = subs(b1,a0,a*z1);
b1 = subs(b1,a,f*h);
b1 = simplify(subs(b1,f,(2*(1-cos(w*h)))/(w*h*sin(w*h))))


b2 = K*(a0-2)/(b0+2);
b2 = subs(b2,b0,a*p);
b2 = subs(b2,a0,a*z1);
b2 = subs(b2,a,f*h);
b2 = simplify(subs(b2,f,(2*(1-cos(w*h)))/(w*h*sin(w*h))))
