% MeanVelocityToAcceleration.m
% File defining one of the methods of class BallisticDataAnalysis.
% =========================================================================
% Write something short.
% This function take input from "AvgVar" to find average acceleration due
% to gravity and compare with the acceleration with output from function
% "AccelerationDueToGravity" 
% Describe what this function does and what it assumes
% =========================================================================
% modified (10/4/2021)
% by (Zhiyu Zhang)
% =========================================================================
function success = MeanVelocityToAcceleration(avgvar,acceleration_due_to_gravity)
    try
        disp(obj.SillyMessage);
        %Getting all the average data and time data
        avg_x = obj.meanx;
        avg_y = obj.meany;
        avg_z = obj.meanz;
        time = Analysis.A(:,1);
        
        %Getting the trajectory expression of average data
        poly_x = polyfit(time,avg_x,2);
        poly_y = polyfit(time,avg_y,2);
        poly_z = polyfit(time,avg_z,2); 
        syms t
        traj_x = poly_x(1)*t^2 + poly_x(2)*t +poly_x(3);
        traj_y = poly_y(1)*t^2 + poly_y(2)*t +poly_y(3);
        traj_z = poly_z(1)*t^2 + poly_z(2)*t +poly_z(3);
        
        %acceleration due to gravity
        accel_z = poly_z(1);
        
        %x y z velocity vs. time
        velocity_x = diff(traj_x,t);
        velocity_y = diff(traj_y,t);
        velocity_z = diff(traj_z,t);
        
        figure()
        hold on
        xlim([time(1),time(end)]);
        fplot(velocity_x)
        fplot(velocity_y)
        fplot(velocity_z)
        xlabel('time(sec)')
        ylabel('velocity(m/s)')
        legend('x velocity','y velocity','z velocity')
        
        success = true;
    catch
        warning('Something went wrong in running AvgVar!');
        success = false;
    end
end
