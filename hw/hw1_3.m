clear; clc;

theta1 = 40;
theta2 = 20;

syms ct2 st2

R1 = [cosd(theta1) sind(theta1) 0;...
      -sind(theta1) cosd(theta1) 0;...
      0 0 1];
% R2 = [ct2 0 -st2;...
%       0 1 0;...
%       st2 0 ct2];

R2 = [cosd(theta2) 0 -sind(theta2);...
      0 1 0;...
      sind(theta2) 0 cosd(theta2)];

R = vpa(R2*R1,3)