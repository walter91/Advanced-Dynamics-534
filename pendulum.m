% This m-file illustrates the solution of a system of equations of motion
% using the matrix approach.  The system is a double pendulum in the
% horizontal plane, without friction.

clear;
clc;

% Model parameters
m = 1;		% Mass of each particle
R = 0.5;	% Length of first link
L = 1;		% Length of second link

% Simulation time
tspan = [0 5];

% Initial conditions
x0 = [0 0 0 1.5];	% The second link is given an initial angular velocity

% Solve equations using 'ode45' -- I pass the model parameters to the
% function, rather than using global variables
[t,x] = ode45(@double_pendulum_function, tspan, x0, [], m, R, L);

% Extract angles and convert to degrees
theta = x(:,1)*180/pi;
phi = x(:,2)*180/pi;

% Plot results
figure(1);
plot(t,theta,'b',t,phi,'r');
xlabel('t (s)');
ylabel('Angle (deg)');
legend('\theta','\phi');