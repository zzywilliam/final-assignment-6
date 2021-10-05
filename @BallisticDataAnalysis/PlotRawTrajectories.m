% PlotRawTrajectories.m
% File defining one of the methods of class BallisticDataAnalysis.
% =========================================================================
% Write something short.
%
% Describe what this function does and what it assumes
% =========================================================================
% modified (date)
% by (who)
% =========================================================================
function success = PlotRawTrajectories(obj)
    try
         %disp(obj.SillyMessage);
         
         time_data = obj.A(:,1);
         xdata = obj.A(:,2:3:31);
         ydata = obj.A(:,3:3:31);
         zdata = obj.A(:,4:3:31);
         
         for i = 1:10
            subplot(2,2,1)
            plot(time_data,xdata(:,i), 'linewidth', 2)
            xlabel('t')
            ylabel('x')
            hold on
            subplot(2,2,2)
            plot(time_data,ydata(:,i), 'linewidth', 2)
            xlabel('t')
            ylabel('y')
            hold on
            subplot(2,2,3)
            plot(time_data,zdata(:,i), 'linewidth', 2)
            xlabel('t')
            ylabel('z')
            hold on

        end
         success = true;

    catch
        warning('Something went wrong in running PlotRawTrajectories!');
        success = false;
    end
end

