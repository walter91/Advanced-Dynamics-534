clear; clc;

theta = 0;
phi = 90;

   
V = -cosd(theta)*(1 - cosd(phi)) - sind(theta)*sind(phi);
    

%figure(1); clf;
%plot([1:leng],V(i))