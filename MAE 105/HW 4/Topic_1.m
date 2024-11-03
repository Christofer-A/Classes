clear figure;

%y = @(x) ones(size(x));
%plot(0:0.1:10,y(0:0.1:10))
%y(0:0.1:10)

%b(0:0.1:10,10,3)
%c(0:0.1:10,10,5)
d(0:0.1:10,10,10)

function [] = d(x,l,n)
sum = 0;
for i = 1:n
    sum = sum + 2*l*sinh(l)*(-1)^n/(l^2+n^2*pi^2)*cos(n*pi/l*x) - 2*n*pi*sinh(l)*(-1)^n/(l^2 + n^2*pi^2)*sin(n*pi/l*x)
end
sum = sum + 1/l*sinh(l)
f = @(x) exp(x);
plot(x,f(x))
hold on
plot(x,sum)
legend({'f(x) = x+1','Fourier Series, l = 5, n = 5'},'Location','northwest')
end

function [] = c(x,l,n)
sum = 0;
for i = 1:n
    sum = sum + -2*l*(-1)^i/(i*pi)*sin(pi*i/l*x)
end
sum = sum + 1
f = @(x) x + 1;
plot(x,f(x))
hold on
plot(x,sum)
legend({'f(x) = x+1','Fourier Series, l = 5, n = 5'},'Location','northwest')
end

function [] = b(x,l,n)
sum = 0;
for i = 1:n
    sum = sum + 4*l^2*(-1)^i/(i^2*pi^2)*cos(pi*i/l*x)
end
sum = sum + l^2/3
f = @(x) x.^2;
plot(x,f(x))
hold on
plot(x,sum)
legend({'f(x) = x^2','Fourier Series, l = 5, n = 3'},'Location','northwest')
end
