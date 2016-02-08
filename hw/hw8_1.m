clear; clc;

syms a L theta theta_dot theta_ddot omega real

w = [-cos(theta)*omega; sin(theta)*omega; theta_dot]

r = [a*sin(theta)*(L/2); a*cos(theta); 0]

r_dot = [a*cos(theta)*theta_dot; -a*sin(theta)*theta_dot; 0] + cross(w,r)

r_ddot = simplify([0; a*(L/2 - 1)*(theta_ddot*sin(theta) + (theta_dot^2)*cos(theta)); a*omega*(-2*sin(theta)*cos(theta)*theta_dot + 2*sin(theta)*cos(theta)*theta_dot*(L/2))] + cross(w,r_dot))


