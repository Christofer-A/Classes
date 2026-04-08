clear all; close all;
T = readtable("One Day.csv")
plot(T.Var1, T.Var3) 

% T = readtable("One Week.csv")
% plot(T.Var1, T.Var3) 

% T = readtable("One Year.csv")
% plot(T.Var1, T.Var3)


ylabel('Energy (kWh)');
xlabel('Time and Date');