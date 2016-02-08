%HW 3 #2
%Walter Coe

clear; clc;

syms b v(t) m g vo

vt = dsolve(diff(v) == -(b*(v^2)/m) - g, v(0) == vo);

vt = simplify(vt)


syms v(z)

vz = dsolve(diff(v) == -b*v/m - g/v, v(0) == vo);

vz = simplify(vz)

eqn = 0 == (b*exp(-(2*b*z - m*log(b*vo^2 + g*m))/m) - b*g*m)^(1/2)/b;

z = solve(eqn,z)