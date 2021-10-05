% BallisticDataAnalysis.m
% File defining class BallisticDataAnalysis.
% =========================================================================
% Write something short.
%
% Describe what this function does and what it assumes
% =========================================================================
% modified (date)
% by (who)
% =========================================================================
classdef BallisticDataAnalysis
    properties (SetAccess = immutable)
    	%> The data of this class is stored is a matrix @c A, which is
    	%> initialized by the class constructor. @c A cannot be changed
    	%> after initialization.
    	A;  
        xdata;
        ydata;
        zdata;
        meanx;
        meany;
        meanz;
        varx;
        vary;
        varz;
        vel_x;
        vel_y;
        vel_z;
        acc_x;
        acc_y;
        acc_z;
        tot_acc;
        acc_g;
    end
    
    properties (Constant)
        %> A constant string used to verify execution.
        SillyMessage = 'Hello World!';
    end
    methods (Access = public)
        % -----------------------------------------------------------------
        %> @brief Class constructor.
        %>
        %> The function returns an object of class BallisticDataAnalysis
        %> with its data initialized by the @param Data.
        % -----------------------------------------------------------------
		function obj = BallisticDataAnalysis(Data)
			obj.A = Data;
            xdata = obj.A(:,2:3:31);
            ydata = obj.A(:,3:3:31);
            zdata = obj.A(:,4:3:31);
            obj.xdata = xdata;
            obj.ydata = ydata;
            obj.zdata = zdata;
            meanx = mean(xdata,2);
            meany = mean(ydata,2);
            meanz = mean(zdata,2);
            varx = var(xdata,0,2);
            vary = var(ydata,0,2);
            varz = var(zdata,0,2);
            obj.meanx = meanx;
            obj.meany = meany;
            obj.meanz = meanz;
            obj.varx = varx;
            obj.vary = vary;
            obj.varz = varz;
            obj.vel_x = gradient(obj.meanx);
            obj.vel_y = gradient(obj.meany);
            obj.vel_z = gradient(obj.meanz);
            obj.acc_x = gradient(obj.vel_x);
            obj.acc_y = gradient(obj.vel_y);
            obj.acc_z = gradient(obj.vel_z);
            obj.tot_acc = sqrt(obj.acc_x.^2+obj.acc_y.^2+obj.acc_z.^2);
            % fit_p=fit(obj.A(:,1),obj.vel_z,'poly1');
            % obj.acc_g = fit_p.p1;
        end
    end
    
    %> Data Processing Methods Declarations.
    methods (Access = public)
        %> Method to plot the raw trajectories.
        %> The return value of the method can be used to establish
        %> whether or not the execution was successful.
        success = PlotRawTrajectories(obj);
        
        %> Method to compute the average position and the variance.
        %> The return value of the method can be used to establish
        %> whether or not the execution was successful.
        success = AvgVar(obj);
        
        %> Method to compute the acceleration due to gravity.
        %> The return value of the method can be used to establish
        %> whether or not the execution was successful.
        success = AccelerationDueToGravity(obj);
        
        %> Method to determine the speed of the marble.
        %> The return value of the method can be used to establish
        %> whether or not the execution was successful.
        success = Speed(obj);
        
        %> Method to determine the gravitational acceleration from the 
        %> ensemble average velocity (derivative of the ensemble average trajectory).
        %> The return value of the method can be used to establish
        %> whether or not the execution was successful.
        success = MeanVelocityToAcceleration(obj);
        
    end
end
