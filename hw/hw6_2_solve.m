function ydot = hw6_2_solve(t,y)

global g m1 m2 R k gamma f

x1 = y(1);
x2 = y(2);
x1dot = y(3);
x2dot = y(4);

M = [(m1 + m2), (m2*cos(gamma));...
     (m2*cos(gamma)), m2];

F = [f*sin(t);...
     m2*g*sin(gamma)-k*x2];

ydot = [[zeros(2) eye(2)]*y;...
        M\F];
 
end