clf; syms x;

%y = @(x) ones(size(x));
%plot(0:0.1:10,y(0:0.1:10))
%y(0:0.1:10)

%b(0:0.1:10,10,3)
%c(0:0.1:10,10,5)
%d(0:0.1:10,10,5)
%e(-10:0.1:10,10,5)
%f(-10:0.1:10,10,100)
g(-10:0.1:10,10,5)

function [] = g(x,l,m)
sum = 0;
for i = 1:m
    sum = sum + l*(2*cos(i*pi/2)+i*sin(i*pi/2)*pi-2*(-1)^i)/(2*i^2*pi^2)*cos(i*pi/l*x)-l*(i*cos(i*pi/2)*pi-2*sin(i*pi/2)+2*i*pi*(-1)^i)/(2*i^2*pi^2)*sin(i*pi/l*x)
end
sum = sum + -3*l/16;
f = @(x) 0.*(x>l/2) + (x).*(x<l/2)
plot(x,f(x))
hold on
plot(x,sum)
legend({'f(x) = x x<L/2, 0 x>L/2 ','Fourier Series, l = 10, n = 5'},'Location','northwest')
end

function [] = f(x,l,m)
sum = 0;
for i = 1:m
    sum = sum + ((l*((-1)^i-1))/(i^2*pi^2)*cos(pi*i/l*x))-((l*((-1)^i)+((-1)^i)-1)/(i*pi)*sin(pi*i/l*x))
end
sum = sum + (l+2)/4;
f = @(x) 0.*(x<0) + (x+1).*(x>0)
plot(x,f(x))
hold on
plot(x,sum)
legend({'f(x) = 0 x<0, x+1 x>0 ','Fourier Series, l = 10, n = 5'},'Location','northwest')
end

function [] = e(x,l,n)
sum = 0;
for i = 1:n
    sum = sum + (l*(-1)^i-l)/(i^2*pi^2)*cos(i*pi/l*x) - 3*l*(-1)^i/(i*pi)*sin(i*pi/l*x);
end
sum = sum + l/4;
f = @(x) x.*(x<0) + 2*x.*(x>0)
plot(x,f(x))
hold on
plot(x,sum)
legend({'f(x) = x x<0, 2x x>0 ','Fourier Series, l = 10, n = 5'},'Location','northwest')
end

function [] = d(x,l,n)
sum = 0;
for i = 1:n
    sum = sum + 2*l*sinh(l)*(-1)^i/(l^2+i^2*pi^2)*cos(i*pi/l*x) - 2*i*pi*sinh(l)*(-1)^i/(l^2 + i^2*pi^2)*sin(i*pi/l*x);
end
sum = sum + 1/l*sinh(l);
f = @(x) exp(x);
plot(x,f(x))
hold on
plot(x,sum)
legend({'f(x) = e^x','Fourier Series, l = 10, n = 5'},'Location','northwest')
end

function [] = c(x,l,n)
sum = 0;
for i = 1:n
    sum = sum + -2*l*(-1)^i/(i*pi)*sin(pi*i/l*x);
end
sum = sum + 1;
f = @(x) x + 1;
plot(x,f(x))
hold on
plot(x,sum)
legend({'f(x) = x+1','Fourier Series, l = 5, n = 5'},'Location','northwest')
end

function [] = b(x,l,n)
sum = 0;
for i = 1:n
    sum = sum + 4*l^2*(-1)^i/(i^2*pi^2)*cos(pi*i/l*x);
end
sum = sum + l^2/3;
f = @(x) x.^2;
plot(x,f(x))
hold on
plot(x,sum)
legend({'f(x) = x^2','Fourier Series, l = 5, n = 3'},'Location','northwest')
end
