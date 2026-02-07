% Data for High-lead glass
temp_lead = [400, 600, 800, 1000];
visc_lead = [1e14, 31622776.6, 31622.7766, 1000];

% Data for Soda-lime glass
temp_soda = [600, 800, 1000, 1200, 1400, 1600];
visc_soda = [1e11, 3162277.66, 31622.7766, 3162.27766, 501.1872336, 125.8925412];

% Data for Fused silica
temp_silica = [1200, 1400, 1600];
visc_silica = [3.16228e12, 10000000000, 125892541.2];

% Create the plot
figure;
semilogy(temp_lead, visc_lead, '-o', 'LineWidth', 2, 'DisplayName', 'High-lead glass');
hold on;
semilogy(temp_soda, visc_soda, '-s', 'LineWidth', 2, 'DisplayName', 'Soda-lime glass');
semilogy(temp_silica, visc_silica, '-^', 'LineWidth', 2, 'DisplayName', 'Fused silica');

% Formatting the plot
grid on;
xlabel('Temperature (^\circ C)');
ylabel('Viscosity (Pa\cdot s)');
title('Viscosity vs. Temperature for Various Glass Types');
legend('Location', 'northeast');

% Optional: Set y-axis limits to capture the full range
ylim([1e2, 1e15]);