temp_lead = [400, 600, 800, 1000];
visc_lead = [1e14, 31622776.6, 31622.7766, 1000];
temp_lead = 1./(temp_lead);
visc_lead = log(visc_lead);

temp_soda = [600, 800, 1000, 1200, 1400, 1600];
visc_soda = [1e11, 3162277.66, 31622.7766, 3162.27766, 501.1872336, 125.8925412];
visc_soda = log(visc_soda);

temp_silica = [1200, 1400, 1600];
visc_silica = [3.16228e12, 10000000000, 125892541.2];
visc_silica = log(visc_silica);

grid on;
xlabel('Temperature (^\circ C)');
ylabel('Viscosity (Pa\cdot s)');
title('Viscosity vs. Temperature for Various Glass Types');
legend('Location', 'northeast');

ylim([1e2, 1e15]);