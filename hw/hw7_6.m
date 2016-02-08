% HW 7 #6
% Walter Coe

clear; clc;

syms m real

m = 1;

a = 5;
b = 4;
c = 3;

Iyyg = (1/18)*(b^2 + c^2);

Ixxg = (1/36)*(3*a^2 + 2*b^2);

Izzg = (1/36)*(3*a^2 + 2*c^2);

Iyzg = -(1/36)*m*b*c;

Ixzg = 0;

Ixyg = Iyzg;

Ig = vpa([Ixxg -Ixyg -Ixzg;...
      -Ixyg Iyyg -Iyzg;...
      -Ixzg -Iyzg Izzg],4)

d = [-1; -2.5; -4/3];

Io =vpa(Ig + m*[d'*d*eye(3) - d*d'],4)

[Rt, Principle] = eig(Io);

R = vpa(Rt',4);

R = vpa(-R, 4)

determinate = vpa(det(R),4)

Principle = vpa(Principle,4)