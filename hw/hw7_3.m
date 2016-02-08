clear; clc;

m = .5;
L = .72;
rho = m/L;
%rho = 1;

Ixx = m*L^2 + (1/3)*m*L^2 + 0 + (1/3)*m*L^2 + rho*(L^3 + (1/3)*L^3) + rho*(L^3 + (1/3)*L^3);

Iyy = Ixx;

Izz = (4/3)*m*L^2 + 2*m*L^2;

Ixy = 0;

Ixz = rho*L^3;

Iyz = rho*L^3;

I = [Ixx -Ixy -Ixz;...
     -Ixy Iyy -Iyz;...
     -Ixz -Iyz Izz]


