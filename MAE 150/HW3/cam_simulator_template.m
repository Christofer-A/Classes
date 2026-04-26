% Cam simulator
% MAE 150 SP26
% graphics set up for MATLAB v2024b
% Will take a few minutes to terminate graphics in v2025a,b

clear all; close all; clc;

%% Simulation parameters:
export_cam_contour = false;
cam_contour_filename = 'cam_profile.txt';
export_animation = false;
animation_filename = 'cam_animation.gif';

%% Set up motion equation for displacement
syms theta beta L
dwell =  0;
% harmonic = ...
% cycloidal =  ...
% poly345 = ...

%% Cam parameters
% r_follower = ...               % [m] follower radius
% r_prime = ...                  % [m] radius of prime circle
% omega = ...                    % [rad/sec] 
r_base = r_prime - r_follower;
% dt = ...                       % radial resolution [rad];


%% Setup cam sections
% Section 1: 
n = 1;
% cam(n).c_type = ...          % curve type
% cam(n).L_range = ...         % [start_value end_value]          
% cam(n).theta_range = ...     % [start_theta end_theta]

% Section 2:  
n = 2;
% cam(n).c_type = ...
% cam(n).L_range = ...
% cam(n).theta_range = ...

% Section 3:  
n = 3;
% cam(n).c_type = ...
% cam(n).L_range = ...
% cam(n).theta_range = ...

%% Evaluate DVAJ functions for each section:

for n = 1:length(cam) 

    % Set up theta with radial resolution dt
    if n == length(cam)
        t = cam(n).theta_range(1) : dt : cam(n).theta_range(2); 
    else
        t = cam(n).theta_range(1) : dt : cam(n).theta_range(2)-dt; 
    end

    % Compute displacement function y
    % y = ...
        
    % Compute velocity function v = dy/dtime = dy/dtheta * omega
    % v = ...

    % Compute acceleration function  a = d2y/dtime2 = d2y/dtheta2 * omega^2
    % a = ...
    
    % Compute jerk function j = d3y/dtime3 = d3y/dtheta3 * omega^3
    % j = ...
    
    % Compute pressure angle function with eccentricity e = 0;
    e = 0; % no eccentricity
    %phi = ...

    % Evaluate DVSJ and phi at theta values:
    cam(n).theta = t;
    cam(n).dis = double(y);
    cam(n).vel = double(v);
    cam(n).acc = double(a);
    cam(n).jerk = double(j);
    cam(n).phi = double(phi);
end

%% Assemble all sections and compute cam surface
t = [cam.theta];
dis = [cam.dis];
vel = [cam.vel];
acc = [cam.acc];
jerk = [cam.jerk];
phi = [cam.phi];

% Pitch curve
% x_pitch = ...
% y_pitch = ...

% Cam contour
% x_cam = ...
% y_cam = ...

% Base circle
% x_base = ...
% y_base = ...

% Prime circle
% x_prime = ...
% y_prime = ...

%% Plot motion profiles and animate cam motion
cam_in(1,:) = x_cam;
cam_in(2,:) = y_cam;
pitch_in(1,:) = x_pitch;
pitch_in(2,:) = y_pitch;

cam_in(:,end) = cam_in(:,1);            % enforce periodicity
pitch_in(:,end) = pitch_in(:,1);

if export_cam_contour
    csvwrite(cam_contour_filename,1000*[cam_in; zeros(1,length(t))]');
end

figure('Units','inches','Position',[0.5 1 12 7]);
ax(1) = axes('Unit','inch','Position',[6.25 5.5 5.25 1]);
ax(2) = axes('Unit','inch','Position',[6.25 4.25 5.25 1]);
ax(3) = axes('Unit','inch','Position',[6.25 3.0 5.25 1]);
ax(4) = axes('Unit','inch','Position',[6.25 1.75 5.25 1]);
ax(5) = axes('Unit','inch','Position',[6.25 0.5 5.25 1]);
ax(6) = axes('Unit','inch','Position',[0.75 1 4.5 4.5]);

for nt = 1:length(t)
     
    axes(ax(1)); % displacement
    plot(rad2deg(t(1:nt)), dis(1:nt)*1000,'k');              
    hold on;
    plot(rad2deg(t(nt)), dis(nt)*1000,'ko','MarkerFaceColor','k');
    ylabel({'displacement','[mm]'});
    box on; grid on; 
    axis([min(rad2deg(t)) max(rad2deg(t)) min(dis)*1e3 max(dis)*1e3]);
    set(gca,'XTick',0:30:360,'XTickLabel',[]); hold off;


    axes(ax(2));  % velocity
    plot(rad2deg(t(1:nt)), vel(1:nt)*1000,'k');             
    hold on;
    plot(rad2deg(t(nt)), vel(nt)*1000,'ko','MarkerFaceColor','k'); 
    ylabel({'velocity','[mm/s]'}); 
    box on; grid on;
    axis([min(rad2deg(t)) max(rad2deg(t)) min(vel)*1e3 max(vel)*1e3]);
    set(gca,'XTick',0:30:360,'XTickLabel',[]); hold off;


    axes(ax(3)); % acceleration
    plot(rad2deg(t(1:nt)), acc(1:nt)*1000,'k');                     
    hold on;
    plot(rad2deg(t(nt)), acc(nt)*1000,'ko','MarkerFaceColor','k'); 
    ylabel({'acceleration', '[mm/s^2]'});
    box on; grid on; 
    axis([min(rad2deg(t)) max(rad2deg(t)) min(acc)*1e3 max(acc)*1e3]);    
    set(gca,'XTick',0:30:360,'XTickLabel',[]); hold off;

    axes(ax(4)); % jerk
    plot(rad2deg(t(1:nt)), jerk(1:nt)*1000,'k');                        
    hold on; 
    plot(rad2deg(t(nt)), jerk(nt)*1000,'ko','MarkerFaceColor','k'); 
    ylabel({'jerk', '[mm/s^3]'});
    axis tight;box on; grid on;
    axis([min(rad2deg(t)) max(rad2deg(t)) min(jerk)*1e3 max(jerk)*1e3]);
    set(gca,'XTick',0:30:360,'XTickLabel',[]); hold off;
  
   
    axes(ax(5));
    plot(rad2deg(t(1:nt)), rad2deg(phi(1:nt)),'k');             % pressure angle
    hold on;
    plot(rad2deg(t(nt)), rad2deg(phi(nt)),'ko','MarkerFaceColor','k'); 
    
    tmp = [rad2deg(t) fliplr(rad2deg(t))];
    patch(tmp,[-30*ones(1,numel(t)) 30*ones(1,numel(t))],'b','FaceAlpha',0.2);
    ylabel({'\phi', '[degree]'});
    xlabel('\theta [degree]');    
    box on; grid on; 
    axis([min(rad2deg(t)) max(rad2deg(t)) min(rad2deg(phi)) max(rad2deg(phi))]);
    set(gca,'XTick',0:30:360,'XTickLabel',0:30:360); hold off;


    axes(ax(6)); % cam 

    plot(x_prime*1000,y_prime*1000,'b-'); hold on;   % prime circle
    plot(x_base*1000,y_base*1000,'b--');             % base circle

    % Animate cam motion by rotating cam contour and pitch curve around cam center
    rot_angle = t(nt);                               
    R = [cos(rot_angle)  -sin(rot_angle); ...        % rotation matrix
         sin(rot_angle)  cos(rot_angle) ]; ...

    for n = 1:size(cam_in,2)
        cam_out(:,n) = R*cam_in(:,n);              % rotated cam contour
        pitch_out(:,n) = R*pitch_in(:,n);          % rotatated pitch curve
    end

    patch(cam_out(1,:)*1000, cam_out(2,:)*1000,'r','FaceAlpha',0.5);
    plot(pitch_out(1,:)*1000,pitch_out(2,:)*1000,'--k');

    tt = deg2rad(0:360);
    x_follower = r_follower*cos(tt);
    y_follower = r_follower*sin(tt) + dis(nt) + r_prime;  % translate follower motion
    patch(x_follower*1000,y_follower*1000,'k','FaceAlpha',0.5);

    axis equal; box on; grid on;
    xlabel('x [mm]');
    ylabel('y [mm]');
    title(sprintf('theta = %4.1f degree',rad2deg(t(nt))));

    tmp = max(sqrt(x_pitch.^2 + y_pitch.^2)) + 2*r_follower;
    axis([-1 1 -1 1]*tmp*1000);
    
    x_center = 0.5*r_base*cos(tt);       % cam center
    y_center = 0.5*r_base*sin(tt);         
    patch(x_center*1000,y_center*1000,'r','FaceAlpha',0.5);
    text(0.25,1.1,'Cam Design Simulator','Units','normalized','FontSize',20);

    if nt == 1 % pause at first step
        text(0.05,-0.15,'Hit any key to start the simulation ...', ...
                        'Units','normalized','FontSize',16);
        pause; 
    end 

    % Animation: get frames
    if export_animation
        frame = getframe(gcf);
        im{nt} = frame2im(frame);
    end
    
    drawnow
    for n_ax = 1:6; axes(ax(n_ax)); hold off; end
end

%% Export frames
if export_animation
    for nt = 1:numel(im)
        [A,map] = rgb2ind(im{nt},256);
        if nt == 1
            imwrite(A,map,animation_filename,'gif','LoopCount',Inf,'DelayTime',0.1);
        else
            imwrite(A,map,animation_filename,'gif','WriteMode','append','DelayTime',0.1);
        end
    end
end