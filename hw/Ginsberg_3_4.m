clear; clc;

theta2 = 158.2;

%syms Ctheta3 Stheta3;

Rba = [-.05 .02 0];
Rcb = [0 -.02 .04];
Rco = [0 0 .04];
Rnorm = cross(Rba, Rcb);

theta3 = asin(dot(Rco,Rnorm)/(sqrt(dot(Rco,Rco))*sqrt(dot(Rnorm,Rnorm))));


R2 = [1 0 0;...
      0 cosd(theta3) sind(theta3);...
      0 -sind(theta3) cosd(theta3)];
  
R1 = [cosd(theta2) sind(theta2) 0;...
      -sind(theta2) cosd(theta2) 0;...
      0 0 1];
  
R = R2 * R1

Rcolittle = Rco*R

roaIJK = [-.05 0 0]';

roaxyz = R * roaIJK

%check

should_be_fifty_thousanths = sqrt(dot(roaxyz,roaxyz))

