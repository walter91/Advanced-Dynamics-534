function [ phi,theta ] = coe_adamson( phi0,theta0,phi_dot0,theta_dot0, t)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

	OPTIONS = odeset('RelTol',1e-2,'AbsTol',1e-5);

	initCond = [phi0; theta0; phi_dot0; theta_dot0];

	N = length(t);

	[t, state] = ode15s(@coe_adamson_solver, t, initCond, OPTIONS);

	phi = state(:,1);
	theta = state(:,2);
	phi_dot = state(:,3);
	theta_dot = state(:,4);

	clear state;

	[peaks] = positive_peaks(theta_dot, theta, t);

	peakTimes = peaks(:,1);
	final_peak = peakTimes(length(peakTimes));

% 
% 	if length(peakTimes)<=4
% 		times = peakTimes(1,1);
% 
% 	elseif length(peakTimes)==5
% 		times = peakTimes(1,1);
% 
% 	elseif length(peakTimes)==6 ||  length(peakTimes)==7
% 		times(1) = peakTimes(1,1);
% 		times(2) = peakTimes(3,1);
% 
% 	elseif length(peakTimes)>=8
% 		times(1) = peakTimes(1,1);
% 		times(2) = peakTimes(3,1);
% 		times(3) = peakTimes(5,1);
% 	end

 	[t, state] = ode15s(@coe_adamson_solver2, t, initCond, OPTIONS, final_peak, theta0);
% 
% 	theta = state(:,2);
% 
	if theta0 > 0
		if abs(theta0)>15
			tStop = 1.75;
			fValue = .1;
		end
		if abs(theta0)>25
			tStop = 2.75;
			fValue = .3;
		end
		if abs(theta0) > 40
			tStop = 2.4;
			fValue = .72;
		else
			tStop = 1;
			fValue = .01;
		end
	elseif theta0 <= 0
		if abs(theta0)>15
			tStop = 1.75;
			fValue = -.1;
		end
		if abs(theta0)>25
			tStop = 2.75;
			fValue = -.3;
		end
		if abs(theta0) > 40
			tStop = 2.4;
			fValue = -.72;
		else
			tStop = 1;
			fValue = -.01;
		end
	end
	 

	 for p = 1:length(t)
		phi(p) = sign(theta0)*(.1163*(abs(theta0))-1.5867)*sin(8*t(p));
		
		if t(p) > tStop
			phi(p) = fValue;
		end
	end

end

%------------------------------------------------------------------------------------------------------------------------------

function ydot = coe_adamson_solver(t, y)

	phi = y(1);
	theta = y(2);
	phi_dot = y(3);
	theta_dot = y(4);

	comp1 = 1;
	comp2 = .0172;

	I1 = [1.1380400e-03  0.0000000e+00 -8.0986162e-04;...
		  0.0000000e+00  2.3295880e-03  0.0000000e+00;...
		  -8.0986162e-04  0.0000000e+00  1.5310735e-03]*comp1;    %(KILOGRAM * M^2)

	I1zz = I1(3,3);
	  
	I2 = [ 1.7983745e-03  1.1934276e-10 -1.0073888e-03;...
		 1.1934276e-10  2.8092221e-03  1.7977219e-10;...
		 -1.0073888e-03  1.7977219e-10  1.0132636e-03]*comp2;    %(KILOGRAM * M^2)

	I2xx = I2(1, 1);
	I2yy = I2(2, 2);
	I2zz = I2(3, 3);
	I2xz = I2(1, 3);
	  
	m2 = .115567*comp1;   %Kg
	m1 = .697353*comp2;   %Kg

	h2 = .090938791;

	g = 9.81;    %M/(Sec)^2

	k1 = 1.171;
	k2 = 1;
	k3 = .00003;
	k4 = .00008;

	Q1 = -k1*phi_dot;
	Q2 = -k3*theta_dot - sign(theta_dot)*k4;

	M = [I1zz + I2zz*(cosd(theta)^2) + I2yy*(sind(theta)^2), -I2xz*cosd(theta) ;...
		 -I2xz*cosd(theta), I2xx ];
	 
	F = [ Q1 + I2zz*(2*phi_dot*theta_dot*cosd(theta)*sind(theta)) + I2yy*(2*theta_dot*phi_dot*cosd(theta)*sind(theta)) + I2xz*(theta_dot^2)*sind(theta) ;...
		  Q2 + I2yy*(phi_dot^2)*sind(theta)*cosd(theta) - I2zz*(phi_dot*phi_dot*cosd(theta)*sind(theta)) - m2*g*h2*sind(theta) ];

	ydot = [[zeros(length(y)/2) eye(length(y)/2)]*y;...
			M\F];

end

%-------------------------------------------------------------------------------------------------------------------

function ydot = coe_adamson_solver2(t, y, end_time, theta0)

    phi = y(1);
	theta = y(2);
	phi_dot = y(3);
	theta_dot = y(4);

	comp1 = 1;
	comp2 = .0172;

	I1 = [1.1380400e-03  0.0000000e+00 -8.0986162e-04;...
		  0.0000000e+00  2.3295880e-03  0.0000000e+00;...
		  -8.0986162e-04  0.0000000e+00  1.5310735e-03]*comp1;    %(KILOGRAM * M^2)

	I1zz = I1(3,3);
	  
	I2 = [ 1.7983745e-03  1.1934276e-10 -1.0073888e-03;...
		 1.1934276e-10  2.8092221e-03  1.7977219e-10;...
		 -1.0073888e-03  1.7977219e-10  1.0132636e-03]*comp2;    %(KILOGRAM * M^2)

	I2xx = I2(1, 1);
	I2yy = I2(2, 2);
	I2zz = I2(3, 3);
	I2xz = I2(1, 3);
	  
	m2 = .115567*comp1;   %Kg
	m1 = .697353*comp2;   %Kg
    
	h2 = .090938791;

	g = 9.81;    %M/(Sec)^2

    if theta0 >= 40;
        if t > end_time*(2/3)
            k1 = 1.171;
			k2 = 1;
			k3 = .00020;
			k4 = .00020;
        elseif t >= end_time*(1/3)
            k1 = 1.171;
			k2 = 1;
			k3 = .00004;
			k4 = .00010;
        else
            k1 = 1.171;
			k2 = 1;
			k3 = .00002;
			k4 = .00007;
        end
    elseif theta0 >= 25;
        if t > end_time*(2/3)
            k1 = .0005171;
			k2 = .1;
			k3 = .00000003;
			k4 = .00000008;
        elseif t >= end_time*(1/3)
            k1 = .0005171;
			k2 = .1;
			k3 = .00000003;
			k4 = .00000008;
        else
            k1 = .0005171;
			k2 = .1;
			k3 = .0000002;
			k4 = .0000007;
        end
    elseif theta0 >= 10;
        if t > end_time*(2/3)
            k1 = 1.171;
            k2 = 1;
            k3 = .00018;
            k4 = .00018;
        elseif t >= end_time*(1/3)
            k1 = 1.171;
            k2 = 1;
            k3 = .00003;
            k4 = .00008;
        else
            k1 = 1.171;
            k2 = 1;
            k3 = .00002;
            k4 = .00007;
        end
    else
        if t > end_time*(2/3)
            k1 = 1.171;
            k2 = 1;
            k3 = .00018;
            k4 = .00018;
        elseif t >= end_time*(1/3)
            k1 = 1.171;
            k2 = 1;
            k3 = .00003;
            k4 = .00008;
        else
            k1 = 1.171;
            k2 = 1;
            k3 = .00002;
            k4 = .00007;
        end
    end
    
        
    Q1 = -k1*phi_dot;
	Q2 = (-k3*theta_dot - sign(theta_dot)*k4*cos(theta));

	M = [I1zz + I2zz*(cosd(theta)^2) + I2yy*(sind(theta)^2), -I2xz*cosd(theta) ;...
		 -I2xz*cosd(theta), I2xx ];
	 
	F = [ Q1 + I2zz*(2*phi_dot*theta_dot*cosd(theta)*sind(theta)) + I2yy*(2*theta_dot*phi_dot*cosd(theta)*sind(theta)) + I2xz*(theta_dot^2)*sind(theta) ;...
		  Q2 + I2yy*(phi_dot^2)*sind(theta)*cosd(theta) - I2zz*(phi_dot*phi_dot*cosd(theta)*sind(theta)) - m2*g*h2*sind(theta) ];

	ydot = [[zeros(length(y)/2) eye(length(y)/2)]*y;...
			M\F];

end

function peaks = positive_peaks(theta_dot, theta, t)

	N = length(theta);
	j = 1;
	for i = 2:N-1
		if ((theta_dot(i)<0) && (theta_dot(i-1)>0))
			peaks(j,1) = t(i);
			peaks(j,2) = theta(i);
			j = j+1;
		end
	end

end











