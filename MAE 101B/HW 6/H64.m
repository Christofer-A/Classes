clc; clear all; close all;

Pd = @(U, Cd, A) 1/2.*Cd.*1.204.*U.^3.*A;
Pr = @(U, m) 0.011.*m.*9.8.*U;

mph = (10:1:100);
U = mph.*0.44704;

figure();
tiledlayout(2,1);
nexttile;

hold on;
plot(mph, Pd(U, 0.29, 2.75)./1000);
plot(mph, Pr(U, 2050)./1000);
plot(mph, (Pd(U, 0.29, 2.75) + Pr(U, 2050))./1000);

title('Speed vs Power Input, Hyundai');
xlabel('Speed (mph)');
ylabel('Power Required (kW)');
legend({'Aerodynamic Drag', 'Rolling Resistance', 'Total Power Required'});

nexttile;

hold on;
plot(mph, Pd(U, 0.23, 2.65)./1000);
plot(mph, Pr(U, 1990)./1000);
plot(mph, (Pd(U, 0.23, 2.65) + Pr(U, 1990))./1000);

title('Speed vs Power Input, Tesla');
xlabel('Speed (mph)');
ylabel('Power Required (kW)');
legend({'Aerodynamic Drag', 'Rolling Resistance', 'Total Power Required'});

energyConsumption = @(P, U) P./U;
range = @(P, e) P./e;

mph1 = 30*0.44704;
mph2 = 60*0.44704;
mph3 = 80*0.44704;

Hyundai = struct;

hPd1 = Pd(mph1, 0.29, 2.75)/1000;
hPd2 = Pd(mph2, 0.29, 2.75)/1000;
hPd3 = Pd(mph3, 0.29, 2.75)/1000;

hPr1 = Pr(mph1, 2050)/1000;
hPr2 = Pr(mph2, 2050)/1000;
hPr3 = Pr(mph3, 2050)/1000;

hP1 = hPd1 + hPr1;
hP2 = hPd2 + hPr2;
hP3 = hPd3 + hPr3;

Hyundai.powerDrag(1) = hPd1;
Hyundai.powerDrag(2) = hPd2;
Hyundai.powerDrag(3) = hPd3;

Hyundai.powerRollingResistance(1) = hPr1;
Hyundai.powerRollingResistance(2) = hPr2;
Hyundai.powerRollingResistance(3) = hPr3;

Hyundai.totalPower(1) = hP1;
Hyundai.totalPower(2) = hP2;
Hyundai.totalPower(3) = hP3;

Hyundai.energyConsumption(1) = energyConsumption(hP1, mph1);
Hyundai.energyConsumption(2) = energyConsumption(hP2, mph2);
Hyundai.energyConsumption(3) = energyConsumption(hP3, mph3);

Hyundai.range(1) = range(hP1, Hyundai.energyConsumption(1));
Hyundai.range(2) = range(hP2, Hyundai.energyConsumption(2));
Hyundai.range(3) = range(hP3, Hyundai.energyConsumption(3));
