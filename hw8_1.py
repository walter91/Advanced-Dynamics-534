# -*- coding: utf-8 -*-
"""
Created on Mon Apr 13 12:46:12 2015

@author: Walter
"""

from sympy import *

init_printing(use_unicode=True)

t = symbols('t')
phi, theta = symbols('phi theta')


print diff(sin(theta(t))**2, t)

