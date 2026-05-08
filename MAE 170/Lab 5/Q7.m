%setup an adjusted angle vector (for total accumulated angle)

angled=angled1+180;
adjustedangle=angled;
frames = 167;
for i=2:frames
    if angled(i)<180 && angled(i-1)>180 % check for crossing from 360 to 0

        adjustedangle(i:frames)=adjustedangle(i:frames)+360;
    end
    % check for >180 degree motion
    if adjustedangle(i)-adjustedangle(i-1)>180
        % if so, undo the prior addition

        adjustedangle(i:frames)=adjustedangle(i:frames)-360;
    end
end

t = 0.0333:0.0333:0.0333*167;

tiledlayout(3,1);
nexttile;
plot(t,angled);
title('Angle Measured vs Time');
xlabel('Time (s)');
ylabel('Angle Measured (degrees)');

nexttile;
plot(t,adjustedangle);
title('Total Angle Traversed vs Time');
xlabel('Time (s)');
ylabel('Total Angle Traversed (degrees)');

nexttile;
delta_angle = diff(adjustedangle);
delta_t = diff(t);

deg_per_sec = delta_angle ./ delta_t;

rpm = deg_per_sec / 6;

t_rpm = t(2:end);

plot(t_rpm, rpm);
xlabel('Time (s)');
ylabel('Angular Velocity (RPM)');
title('Revolutions per Minute vs. Time');