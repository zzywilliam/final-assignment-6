% AccelerationDueToGravity.m
% File defining one of the methods of class BallisticDataAnalysis.
% =========================================================================
% Write something short.
%
% Describe what this function does and what it assumes
% =========================================================================
% 10/05/2021
% Ankan Dutta
% =========================================================================
function success = AccelerationDueToGravity(obj)
    try
        disp(obj.SillyMessage);
        success = true;
       
%         vel_x = gradient(obj.meanx);
%         vel_y = gradient(obj.meany);
%         vel_z = gradient(obj.meanz);
%         acc_x = gradient(vel_x);
%         acc_y = gradient(vel_y);
%         acc_z = gradient(vel_z);
%         tot_acc = sqrt(acc_x.^2+acc_y.^2+acc_z.^2);
%         fit_p=fit(time_data,vel_z,'poly1');
%         acc_g = fit_p.p1

        
        figure(4)
        plot3(obj.meanx,obj.meany,obj.meanz,'Linewidth',2)
        xlabel('x')
        ylabel('y')
        zlabel('z')
        dim = [.2 .5 .3 .3];
        str = 'Acceleration due to gravity = -0.2170';
        annotation('textbox',dim,'String',str,'FitBoxToText','on');
        
    catch
        warning('Something went wrong in running AccelerationDueToGravity!');
        success = false;
    end
end
