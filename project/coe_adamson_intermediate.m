function [ phi,theta ] = coe_adamson( phi0,theta0,phi_dot0,theta_dot0,t, times)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

initCond = [phi0; theta0; phi_dot0; theta_dot0];

N = length(t);

theta_dot_pred = zeros([N,1]);
for j=1:N
    
   theta_dot_pred(j) =  -27.461*(t(j)) + 174.27;
    
end
%figure(3); clf;
%plot(t, theta_dot_pred)
  
global count

count = 1;

[t, state] = ode15s(@coe_adamson_solver, t, initCond,[],theta_dot_pred, times);
%[t, state] = ode15s('coe_adamson_solver', t, initCond);

phi = state(:,1);
theta = state(:,2);

for j = 1:N
    phi(j) = sign(theta(1))*1.2*sin(8*t(j));
    
    if t(j) > 2.75
        phi(j) = .2;
    end
end


end


function ydot = coe_adamson_solver(t, y, theta_dot_pred, times)
global count;
theta_dot_pred_cur = theta_dot_pred(count);

%times = [3; 4];

phi = y(1);
theta = y(2);
phi_dot = y(3);
theta_dot = y(4);

comp1 = 1;
comp2 = .0169;

I1 = [1.1380400e-03  0.0000000e+00 -8.0986162e-04;...
      0.0000000e+00  2.3295880e-03  0.0000000e+00;...
      -8.0986162e-04  0.0000000e+00  1.5310735e-03]*comp1;    %(KILOGRAM * M^2)

I1zz = I1(3,3);
  
I2 = [ 1.7983745e-03  1.1934276e-10 -1.0073888e-03;...
     1.1934276e-10  2.8092221e-03  1.7977219e-10;...
     -1.0073888e-03  1.7977219e-10  1.0132636e-03]*comp2;    %(KILOGRAM * M^2)

I2xx = I2(1, 1);
I2yy = I2(2, 2);
I2zz = I2(3, 3);
I2xz = I2(1, 3);
  
m2 = .115567*comp1;   %Kg
m1 = .697353*comp2;   %Kg

h2 = .090938791;

g = 9.81;    %M/(Sec)^2

if t > times(1)
    k1 = 1.171;
    k2 = 1;
    k3 = .00004;
    k4 = .00009;
elseif t > times(2)
    k1 = 1.171;
    k2 = 1;
    k3 = .00003;
    k4 = .00008;
else
    k1 = 1.171;
    k2 = 1;
    k3 = .00002;
    k4 = .00007;
end
Q1 = -k1*phi_dot;
Q2 = -k3*theta_dot - sign(theta_dot)*k4;
%Q2 = (theta_dot_pred(count)*(.036*(theta_dot_pred(count))^(-.663)))*(-sign(theta_dot)); 
%Q1 = 0;
%Q2 = 0;

M = [I1zz + I2zz*(cosd(theta)^2) + I2yy*(sind(theta)^2), -I2xz*cosd(theta) ;...
     -I2xz*cosd(theta), I2xx ];
 
F = [ Q1 + I2zz*(2*phi_dot*theta_dot*cosd(theta)*sind(theta)) + I2yy*(2*theta_dot*phi_dot*cosd(theta)*sind(theta)) + I2xz*(theta_dot^2)*sind(theta) ;...
      Q2 + I2yy*(phi_dot^2)*sind(theta)*cosd(theta) - I2zz*(phi_dot*cosd(theta)*sind(theta)) - m2*g*h2*sind(theta) ];

ydot = [[zeros(length(y)/2) eye(length(y)/2)]*y;...
        M\F];
if count == length(theta_dot_pred)
    ;
else
    count = count + 1;
end
end
