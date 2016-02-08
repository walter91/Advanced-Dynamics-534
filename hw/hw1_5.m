clear; clc;

theta1 = atand(3/2)
theta2 = 45;

Rz = [cosd(theta1) sind(theta1) 0;...
      -sind(theta1) cosd(theta1) 0;...
      0 0 1]

Ry = [cosd(theta2) 0 -sind(theta2);...
      0 1 0;...
      sind(theta2) 0 cosd(theta2)]
 
cxp = Rz * [0 2 1]'

cX = Rz' * Ry' * cxp + [3 0 0]'

cxp;
cX;


A = [0 0 1;...
     3 0 1;...
     3 2 1;...
     0 2 1]';
 
offset = [3 0 0]'
offset = [offset, offset, offset, offset];
Ax = A - offset;
Axp = Rz * Ax;

B = Rz' * Ry' * Axp + offset; 
 
 cube3(A, -1, 'r', 1);
 figure(1); hold on;
 cube3(B, -1, 'g', 1);
 scatter3(A(1,3),A(2,3),A(3,3));
 scatter3(B(1,3),B(2,3),B(3,3));
 grid on;






 
