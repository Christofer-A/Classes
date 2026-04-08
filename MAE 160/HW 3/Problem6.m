close all; clear;
% Data for High-lead glass
temp_lead_C = [400, 600, 800, 1000];
visc_lead = [1e14, 31622776.6, 31622.7766, 1000];

% Data for Soda-lime glass
temp_soda_C = [600, 800, 1000, 1200, 1400, 1600];
visc_soda = [1e11, 3162277.66, 31622.7766, 3162.27766, 501.1872336, 125.8925412];

% Data for Fused silica
temp_silica_C = [1200, 1400, 1600];
visc_silica = [3.16228e12, 10000000000, 125892541.2];

% Convert Temperature to Kelvin and calculate 1/T
inv_T_lead = 1 ./ (temp_lead_C + 273.15);
inv_T_soda = 1 ./ (temp_soda_C + 273.15);
inv_T_silica = 1 ./ (temp_silica_C + 273.15);

% Calculate the natural log of viscosity
ln_visc_lead = log(visc_lead);
ln_visc_soda = log(visc_soda);
ln_visc_silica = log(visc_silica);

% Create the Arrhenius plot
figure;
plot(inv_T_lead, ln_visc_lead, 'DisplayName', 'High-lead glass');
hold on;
plot(inv_T_soda, ln_visc_soda, 'DisplayName', 'Soda-lime glass');
plot(inv_T_silica, ln_visc_silica, 'DisplayName', 'Fused silica');

% Formatting the plot
grid on;
xlabel('1/T');
ylabel('ln(\eta)');
title('ln(\eta) vs. 1/T');
legend('Location', 'northwest');