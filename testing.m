clear; clc;

t = 0:.001:5;

[ phi, theta ] = coe_adamson( 0,10,0,0,t );

figure(1); clf;
plot(t, phi, t, theta)
legend('phi','theta')
%grid on