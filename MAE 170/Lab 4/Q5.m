T = @(f) 2./(sqrt(1 + (f./17.017).^2));

plot(f_vec, transfer_vec);
hold on;
plot(f_vec, T(f_vec));

title('Measured vs Analytically Predicted Transfer Functions for an Amplified Low Pass Filter');
ylabel('Gain');
xlabel('Frequency (Hz)');
legend('Measured Transfer Function', 'Analytical Transfer Function');