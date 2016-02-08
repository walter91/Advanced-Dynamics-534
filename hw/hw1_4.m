clear; clc;

syms c1 s1 c2 s2 c3 s3

c1 = cosd(45);
s1 = sind(45);
c2 = cosd(-30);
s2 = sind(-30);
c3 = cosd(60);
s3 = sind(60);


R1 = [c1 s1 0;...
      -s1 c1 0;...
      0 0 1];

R2 = [1 0 0;...
      0 c2 s2;...
      0 -s2 c2];
 
R3 = [c3 s3 0;...
      -s3 c3 0;...
      0 0 1];
  
R = R3*R2*R1