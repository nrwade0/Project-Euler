#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Tue Oct  8 19:06:18 2019

You are given the following information, but you may prefer to do some research for yourself.

1 Jan 1900 was a Monday.

Thirty days has September,
April, June and November.
All the rest have thirty-one,
Saving February alone,
Which has twenty-eight, rain or shine.
And on leap years, twenty-nine.

A leap year occurs on any year evenly divisible by 4, but not on a century unless it is divisible by 400.

How many Sundays fell on the first of the month during the twentieth century (1 Jan 1901 to 31 Dec 2000)?
"""


import numpy as np
from itertools import islice, cycle

# cycle thru the weekdays choosing days that begin on the first of each month?
days = ['mon', 'tues', 'wed', 'thurs', 'fri', 'sat', 'sun']

f_noleap = [0, 0+31, 0+31+28, 0+31+28+31, 0+31+28+31+30, 0+31+28+31+30+31, \
                 0+31+28+31+30+31+30, 0+31+28+31+30+31+30+31, 0+31+28+31+30+31+30+31+31, \
                 0+31+28+31+30+31+30+31+31+30, 0+31+28+31+30+31+30+31+31+30+31, \
                 0+31+28+31+30+31+30+31+31+30+31+31]

f_leap = [0, 0+31, 0+31+29, 0+31+29+31, 0+31+29+31+30, 0+31+29+31+30+31, \
                 0+31+29+31+30+31+30, 0+31+29+31+30+31+30+31, 0+31+29+31+30+31+30+31+31, \
                 0+31+29+31+30+31+30+31+31+30, 0+31+29+31+30+31+30+31+31+30+31, \
                 0+31+29+31+30+31+30+31+31+30+31+31]


"""
for i in np.arange(1900, 2000):
    if(i % 4 == 0): # leap year
        f = f_leap
    else:
        f = f_noleap
        
    for j in f:
        print(it.islice(it.cycle(days), j))
"""

for item in islice(cycle(days), 0,365):
    print(item)

"""
0
jan 31 \
feb 28 \
mar 31 \
apr 30 \
may 31 \
jun 30 \
jul 31 \
aug 31 \
sep 30 \
oct 31 \
nov 31
dec 31
"""