function [ phi,theta ] = adamson_coe( phi0,theta0,phi_dot0,theta_dot0, t)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

	OPTIONS = odeset('RelTol',1e-2,'AbsTol',1e-5);

	initCond = [phi0; theta0; phi_dot0; theta_dot0];

	N = length(t);

	[t, state] = ode45(@adamson_coe_solver, t, initCond, OPTIONS);

	phi = state(:,1);
	theta = state(:,2);
	phi_dot = state(:,3);
	theta_dot = state(:,4);

end

%------------------------------------------------------------------------------------------------------------------------------

function ydot = adamson_coe_solver(t, y)

	phi = y(1);
	theta = y(2);
	phi_dot = y(3);
	theta_dot = y(4);

	comp1 = 1;
	comp2 = .00005;

	I1 = [0.00104933  0  -0.00031847;...
		  0  0.00246569  0;...
		  -0.00031847  0  0.00186312]*comp1;    %(KILOGRAM * M^2)

	I1zz = I1(3,3);
	  
	I2 = [ 0.00100730  0  -0.00071042;...
		 0  0.00210405  0;...
		 -0.00071042  0  0.00109763]*comp2;    %(KILOGRAM * M^2)

	I2xx = I2(1, 1);
	I2yy = I2(2, 2);
	I2zz = I2(3, 3);
	I2xz = I2(1, 3);
	
    m1 = 0.70175714*comp1;   %Kg
	m2 = 0.13179413*comp2;   %Kg
	
	h2 = 0.05598872;

	g = 9.81;    %M/(Sec)^2
% 
% 	k1 = 1.171;
% 	k2 = 1;
% 	k3 = .00003;
% 	k4 = .00008;

% 	Q1 = -k1*phi_dot - sign(phi_dot)*k2;
% 	Q2 = -k3*theta_dot - sign(theta_dot)*k4;

    Q1 = 0;
    Q2 = 0;

	M = [I1zz + I2zz*(cosd(theta)^2) + I2yy*(sind(theta)^2), -I2xz*cosd(theta) ;...
		 -I2xz*cosd(theta), I2xx ];
	 
	F = [ Q1 + I2zz*(2*phi_dot*theta_dot*cosd(theta)*sind(theta)) + I2yy*(2*theta_dot*phi_dot*cosd(theta)*sind(theta)) + I2xz*(theta_dot^2)*sind(theta) ;...
		  Q2 + I2yy*(phi_dot^2)*sind(theta)*cosd(theta) - I2zz*(phi_dot*cosd(theta)*sind(theta)) - m2*g*h2*sind(theta) ];

	ydot = [[zeros(length(y)/2) eye(length(y)/2)]*y;...
			M\F];

end