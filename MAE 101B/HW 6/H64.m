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
range = @(Cap, e) Cap./e;

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

Hyundai.powerDrag_kW(1) = hPd1;
Hyundai.powerDrag_kW(2) = hPd2;
Hyundai.powerDrag_kW(3) = hPd3;

Hyundai.powerRollingResistance_kW(1) = hPr1;
Hyundai.powerRollingResistance_kW(2) = hPr2;
Hyundai.powerRollingResistance_kW(3) = hPr3;

Hyundai.totalPower_kW(1) = hP1;
Hyundai.totalPower_kW(2) = hP2;
Hyundai.totalPower_kW(3) = hP3;

Hyundai.energyConsumption_kWh_mi(1) = energyConsumption(hP1, 30);
Hyundai.energyConsumption_kWh_mi(2) = energyConsumption(hP2, 60);
Hyundai.energyConsumption_kWh_mi(3) = energyConsumption(hP3, 80);

Hyundai.range_mi(1) = range(77.4, Hyundai.energyConsumption_kWh_mi(1));
Hyundai.range_mi(2) = range(77.4, Hyundai.energyConsumption_kWh_mi(2));
Hyundai.range_mi(3) = range(77.4, Hyundai.energyConsumption_kWh_mi(3));

Hyundai.powerDrag_kW = Hyundai.powerDrag_kW';
Hyundai.powerRollingResistance_kW = Hyundai.powerRollingResistance_kW';
Hyundai.totalPower_kW = Hyundai.totalPower_kW';
Hyundai.energyConsumption_kWh_mi = Hyundai.energyConsumption_kWh_mi';
Hyundai.range_mi = Hyundai.range_mi';

hTable = struct2table(Hyundai);
hTable.Properties.RowNames = {'30 mph', '60 mph', '80 mph'};

disp('Hyundai Performance Data')
disp(hTable)

Tesla = struct;

tPd1 = Pd(mph1, 0.23, 2.65)/1000;
tPd2 = Pd(mph2, 0.23, 2.65)/1000;
tPd3 = Pd(mph3, 0.23, 2.65)/1000;

tPr1 = Pr(mph1, 1990)/1000;
tPr2 = Pr(mph2, 1990)/1000;
tPr3 = Pr(mph3, 1990)/1000;

tP1 = tPd1 + tPr1;
tP2 = tPd2 + tPr2;
tP3 = tPd3 + tPr3;

Tesla.powerDrag_kW(1) = tPd1;
Tesla.powerDrag_kW(2) = tPd2;
Tesla.powerDrag_kW(3) = tPd3;

Tesla.powerRollingResistance_kW(1) = tPr1;
Tesla.powerRollingResistance_kW(2) = tPr2;
Tesla.powerRollingResistance_kW(3) = tPr3;

Tesla.totalPower_kW(1) = tP1;
Tesla.totalPower_kW(2) = tP2;
Tesla.totalPower_kW(3) = tP3;

Tesla.energyConsumption_kWh_mi(1) = energyConsumption(tP1, 30);
Tesla.energyConsumption_kWh_mi(2) = energyConsumption(tP2, 60);
Tesla.energyConsumption_kWh_mi(3) = energyConsumption(tP3, 80);

Tesla.range_mi(1) = range(75, Tesla.energyConsumption_kWh_mi(1));
Tesla.range_mi(2) = range(75, Tesla.energyConsumption_kWh_mi(2));
Tesla.range_mi(3) = range(75, Tesla.energyConsumption_kWh_mi(3));

Tesla.powerDrag_kW = Tesla.powerDrag_kW';
Tesla.powerRollingResistance_kW = Tesla.powerRollingResistance_kW';
Tesla.totalPower_kW = Tesla.totalPower_kW';
Tesla.energyConsumption_kWh_mi = Tesla.energyConsumption_kWh_mi';
Tesla.range_mi = Tesla.range_mi';

tTable = struct2table(Tesla);
tTable.Properties.RowNames = {'30 mph', '60 mph', '80 mph'};

disp('Tesla Performance Data')
disp(tTable)
