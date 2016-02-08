function [ phi,theta ] = coe_adamson_pend( phi0,theta0,phi_dot0,theta_dot0,t)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

initCond = [phi0; theta0; phi_dot0; theta_dot0];

[t, state] = ode45(@coe_adamson_solver, t, initCond);
%[t, state] = ode15s('coe_adamson_solver', t, initCond);

phi = state(:,1);
theta = state(:,2);

end


function ydot = coe_adamson_solver(t, y)

phi = y(1);
theta = y(2);
phi_dot = y(3);
theta_dot = y(4);

comp1 = 1;
comp2 = 1;

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

%Q1 = 0;
%Q2 = 0;

M = [0, I1zz;...
    0, 0];
 
F = [0;  Q2 - (1/2)*m2*g*h2*sind(theta) ];

ydot = [[zeros(length(y)/2) eye(length(y)/2)]*y;...
        M\F];

end
