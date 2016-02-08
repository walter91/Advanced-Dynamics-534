# -*- coding: utf-8 -*-
"""
Created on Wed Apr 08 12:31:17 2015

@author: Walter
"""

from sympy import *

init_printing(use_unicode=True)

t = symbols('t')
phi, theta = symbols('phi theta')
I1zz, Izz, Iyy, Ixx, Ixz = symbols('I1zz Izz Iyy Ixx Ixz')
m2, h2, g = symbols('m2 h2 g')

Q1, Q2 = symbols('Q1 Q2')

theta_dot = integrate(((-.0958*theta(t) - .0317) - (1/2.0)*m2*g*h2*sin(theta(t)))/Ixx, t)


