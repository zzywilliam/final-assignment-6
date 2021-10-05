% AvgVar.m
% File defining one of the methods of class BallisticDataAnalysis.
% =========================================================================
% Write something short.
%
% Describe what this function does and what it assumes
% =========================================================================
% modified (date)
% by (who)
% =========================================================================
function success = AvgVar(obj)
    try
        disp(obj.SillyMessage);
        success = true;
        obj = Analysis;
        time_data = obj.A(:,1);
        xdata = obj.A(:,2:3:31);
        ydata = obj.A(:,3:3:31);
        zdata = obj.A(:,4:3:31);
        meanx = mean(xdata,2);
        meany = mean(ydata,2);
        meanz = mean(zdata,2);
        varx = var(xdata,0,2);
        vary = var(ydata,0,2);
        varz = var(zdata,0,2);
        figure(1)
        subplot(2,2,1)
        plot(time_data,meanx, 'linewidth', 2)
        xlabel('t')
        ylabel('x')
        
        subplot(2,2,2)
        plot(time_data,meany, 'linewidth', 2)
        xlabel('t')
        ylabel('y')
        
        subplot(2,2,3)
        plot(time_data,meanz, 'linewidth', 2)
        xlabel('t')
        ylabel('z')

        figure(2)
        subplot(2,2,1)
        plot(time_data,varx, 'linewidth', 2)
        xlabel('t')
        ylabel('x')
        
        subplot(2,2,2)
        plot(time_data,vary, 'linewidth', 2)
        xlabel('t')
        ylabel('y')
        
        subplot(2,2,3)
        plot(time_data,varz, 'linewidth', 2)
        xlabel('t')
        ylabel('z')
    catch
        warning('Something went wrong in running AvgVar!');
        success = false;
    end
end
