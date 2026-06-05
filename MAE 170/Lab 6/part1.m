%note: recMatrix holds averaged signal and wave_sig is the most data from
%the most recent acquisition

avg_sig = recMatrix_sig(:, 1, 1);
avg_ref = recMatrix_ref(:, 1, 1);


figure;
plot(t, wave_sig, 'r-');
hold on;
plot(t, avg_sig, 'b-');
legend('64th Signal', 'Average Signal');
xlabel('Time (s)');
ylabel('Amplitude (V)');
title('64th Acquisition and Average Signal for Stationary Microphone');
hold off;

figure;
plot(t, avg_ref, 'r-');
hold on;
plot(t, avg_sig, 'b-');
legend('Average Reference Signal', 'Average Microphone Signal');
xlabel('Time (s)');
ylabel('Amplitude (V)');
title('Average Reference Signal and Average Microphone Signal');
hold off;
