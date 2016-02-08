clear; clc;

global b m g

b = 1000;
m = 5;
g = 9.81;

vo = 5;

init = vo;

t = 0:.001:10;

z = 0:.001:10;

[t, y] = ode45('hw3_2_solve', t, init);

figure(1); clf;
subplot(2,1,1);
plot(t, y(:,1));
xlabel('Time');
ylabel('Velocity (dist/time^2)');
title('Numerical Solution');
grid on

subplot(2,1,2);
plot(t,(g^(1/2)*m^(1/2)*tan((m^(1/2)*atan((b^(1/2)*vo)/(g^(1/2)*m^(1/2))) - b^(1/2)*g^(1/2)*t)/m^(1/2)))/b^(1/2))
xlabel('Time')
ylabel('Velocity (dist/time^2)')
title('Analytical Soultion');
grid on

figure(2); clf;
plot(z,(b*exp(-(2*b.*z - m*log(b*vo^2 + g*m))/m) - b*g*m).^(1/2)/b);
