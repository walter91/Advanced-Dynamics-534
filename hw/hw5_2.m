clear; clc;

syms theta phi x L 

eqn1 = (phi == asin(2*sin(theta))); 

diff(eqn1)

phi = asin(2*sin(theta));

eqn2 = (1 == (3/2)*L - cos(theta)*L - cos(phi)*(L/2));

diff(eqn2)










