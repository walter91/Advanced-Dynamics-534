%HW 3 #4
%Walter Coe

clear; clc;

% syms R g m theta thetadot thetaddot
% 
% rddot = [R*(2*thetaddot - thetadot^2 + thetadot*thetaddot); 0; R*thetadot^2*(2-theta)]
% 
% Rtheta = [cos(theta) 0 -sin(theta);...
%           0 1 0;...
%           sin(theta) 0 cos(theta)]
%       
% Rddot = Rtheta'*rddot
% 
% eqn = m*g - ((-m/sin(theta))*(R*cos(theta)*(thetadot*thetaddot + 2*thetaddot - thetadot^2) - R*thetadot^2*sin(theta)*(theta - 2)))*cos(theta) == m*(R*sin(theta)*(thetadot*thetaddot + 2*thetadot - thetadot^2) - R*thetadot^2*cos(theta)*(theta-2))
% 
% thetaddot = solve(eqn, thetaddot)
% 
% -(g*sin(theta) - 2*R*thetadot*sin(theta)^2 - R*thetadot^2*cos(theta)^2 + R*thetadot^2*sin(theta)^2)/(2*R*cos(theta)^2 + R*thetadot*cos(theta)^2 - R*thetadot*sin(theta)^2)
%  

global R g

R = 1;

g = 9.81;

t = 0:.01:10;

initCond = [0; sqrt(g/2*R)];

[t y] = ode45('hw3_4_solve', t, initCond);

figure(1); clf;
plot(t, y(:,1))