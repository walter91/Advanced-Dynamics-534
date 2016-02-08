syms vo v2 m v k h

eqn = vo^2 == ((2*vo - v2)/2)^2 + (1/2)*(v2^2)

v2 = solve(eqn, v2)

en = m*(vo^2) == (3/2)*m*v^2 + (1/2)*k*(h^2)

h = solve(en, h)