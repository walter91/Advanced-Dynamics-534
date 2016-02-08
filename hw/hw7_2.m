clear; clc;

syms m

m = 1;

a = 7;  %x
b = 4;  %y
c = 5;  %z

Ioxyz = [13.66 -7 -8.75;...
         -7 24.66 5;...
         -8.75 5 21.66]*m
     
Ioxyz = [(1/3)*(b^2 + c^2) -(1/4)*(a*b) -(1/4)*(a*c);...
         -(1/4)*(a*b) (1/3)*(a^2 + c^2) -(1/4)*(b*c);...
         -(1/4)*(a*c) -(1/4)*(b*c) (1/3)*(a^2 + b^2)]

theta1 = -atan(5/7);
theta2 = atan(4/sqrt(5^2 + 7^2));
     
Ry = [cos(theta1) 0 -sin(theta1);...
      0 1 0;...
      sin(theta1) 0 cos(theta1)];
  
Rz = [cos(theta2) sin(theta2) 0;...
      -sin(theta2) cos(theta2) 0;...
      0 0 1];

Ioxyz_primed = Rz*Ry*Ioxyz*Ry'*Rz'

