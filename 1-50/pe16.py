#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sun Aug 11 18:13:13 2019

@author: nick

2^15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.

What is the sum of the digits of the number 2^1000?

"""

num = 1

for i in range(1000):
    num = num * 2

num = str(num)

s = 0

for digit in num:
    s = s + int(digit)

print(s)
