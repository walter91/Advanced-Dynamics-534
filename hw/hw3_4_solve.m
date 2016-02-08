function [ydot] = hw3_4_solve(t, y)

global R g

theta = y(1);
thetadot = y(2);

ydot = [thetadot; -(g*sin(theta) - 2*R*thetadot*sin(theta)^2 - R*thetadot^2*cos(theta)^2 + R*thetadot^2*sin(theta)^2)/(2*R*cos(theta)^2 + R*thetadot*cos(theta)^2 - R*thetadot*sin(theta)^2)];
