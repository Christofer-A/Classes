Ay = zeros(17,1);
By = zeros(17,1);
x = 0;
for i = 1:17
    if x < 6
        By(i) = x*25/18;
        Ay(i) = 25 - By(i);
    elseif x >= 6 & x <= 18 
        By(i) = (x*25 + (x-6)*25)/18;
        Ay(i) = 50 - By(i);
    elseif x > 18
        By(i) = ((x-6)*25)/18;
        Ay(i) = 25 - By(i);
    end
    x = x + 1.5;
end

M1 = zeros(17,1);
M2 = zeros(17,1);
Mc = zeros(17,1);
i = 0;
x = 0;
for i = 1:17
    if x < 6
        M1(i) = x*Ay(i);
        Mc(i) = 25*x + 9*(Ay(i) - 25);
    elseif x >= 6 & x <= 9
        M2(i) = (x-6)*Ay(i);
        M1(i) = (x-6)*25 + x*(Ay(i) - 25);
        Mc(i) = (x-6)*25 + 25*x + 9*(Ay(i) - 50);
    elseif x > 9 & x <= 15 
        M2(i) = (x-6)*Ay(i);
        M1(i) = (x-6)*25 + x*(Ay(i) - 25);
        Mc(i) = (x-6)*25 + 9*(Ay(i) - 25);
    elseif x > 15 & x <= 18
        M2(i) = (x-6)*Ay(i);
        M1(i) = (x-6)*25 + x*(Ay(i) - 25);
        Mc(i) = 9*(Ay(i));
    elseif x > 18
        M2(i) = (x-6)*Ay(i);
        Mc(i) = 9*(Ay(i));
    end
    x = x + 1.5;
end
Solution = [M1 M2 Mc]