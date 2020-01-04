#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sun Aug 11 18:24:36 2019

@author: nick

If the numbers 1 to 5 are written out in words: one, two, three, four, five, then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.

If all the numbers from 1 to 1000 (one thousand) inclusive were written out in words, how many letters would be used?


NOTE: Do not count spaces or hyphens. For example, 342 (three hundred and forty-two) contains 23 letters and 115 (one hundred and fifteen) contains 20 letters.
The use of "and" when writing out numbers is in compliance with British usage.

"""


curr_num = 10
count = 0


for curr_num in range(1001):
        
    while(curr_num != 0):
        
        num = str(curr_num)
        length = len(num)
        
        # is four digits
        if(length == 4):
#            print('one thousand')
            count = count + len('onethousand')
            curr_num = curr_num - 1000
        
        
        # is three digits
        if(length == 3):
            
            if(num[0] == '1'):
#                print('one hundred')
                count = count + len('onehundred')
                curr_num = curr_num - 100
            
            if(num[0] == '2'):
#                print('two hundred')
                count = count + len('twohundred')
                curr_num = curr_num - 200
            
            if(num[0] == '3'):
#                print('three hundred')
                count = count + len('threehundred')
                curr_num = curr_num - 300
            
            if(num[0] == '4'):
#                print('four hundred')
                count = count + len('fourhundred')
                curr_num = curr_num - 400
            
            if(num[0] == '5'):
#                print('five hundred')
                count = count + len('fivehundred')
                curr_num = curr_num - 500
            
            if(num[0] == '6'):
#                print('six hundred')
                count = count + len('sixhundred')
                curr_num = curr_num - 600
            
            if(num[0] == '7'):
 #               print('seven hundred')
                count = count + len('sevenhundred')
                curr_num = curr_num - 700
            
            if(num[0] == '8'):
#                print('eight hundred')
                count = count + len('eighthundred')
                curr_num = curr_num - 800
            
            if(num[0] == '9'):
#                print('nine hundred')
                count = count + len('ninehundred')
                curr_num = curr_num - 900
            
#            print('and')
            if(curr_num != 0):
                count = count + len('and')
        
        
        
        # is two digits
        if(length == 2):
            
            if(num[0] == '1'):
                if(num[1] == '0'):
#                    print('ten')
                    count = count + len('ten')
                    curr_num = curr_num - 10
                    
                if(num[1] == '1'):
#                    print('eleven')
                    count = count + len('eleven')
                    curr_num = curr_num - 11
                
                if(num[1] == '2'):
#                    print('twelve')
                    count = count + len('twelve')
                    curr_num = curr_num - 12
                
                if(num[1] == '3'):
#                    print('thirteen')
                    count = count + len('thirteen')
                    curr_num = curr_num - 13
                
                if(num[1] == '4'):
#                    print('fourteen')
                    count = count + len('fourteen')
                    curr_num = curr_num - 14
                
                if(num[1] == '5'):
#                    print('fifteen')
                    count = count + len('fifteen')
                    curr_num = curr_num - 15
                
                if(num[1] == '6'):
#                    print('sixteen')
                    count = count + len('sixteen')
                    curr_num = curr_num - 16
                
                if(num[1] == '7'):
#                    print('seventeen')
                    count = count + len('seventeen')
                    curr_num = curr_num - 17
                
                if(num[1] == '8'):
#                    print('eighteen')
                    count = count + len('eighteen')
                    curr_num = curr_num - 18
                
                if(num[1] == '9'):
#                    print('nineteen')
                    count = count + len('nineteen')
                    curr_num = curr_num - 19
            
            
            if(num[0] == '2'):
#                print('twenty')
                count = count + len('twenty')
                curr_num = curr_num - 20
            
            if(num[0] == '3'):
#                print('thirty')
                count = count + len('thirty')
                curr_num = curr_num - 30
            
            if(num[0] == '4'):
#                print('forty')
                count = count + len('forty')
                curr_num = curr_num - 40
            
            if(num[0] == '5'):
#                print('fifty')
                count = count + len('fifty')
                curr_num = curr_num - 50
            
            if(num[0] == '6'):
#                print('sixty')
                count = count + len('sixty')
                curr_num = curr_num - 60
            
            if(num[0] == '7'):
#                print('seventy')
                count = count + len('seventy')
                curr_num = curr_num - 70
            
            if(num[0] == '8'):
#                print('eighty')
                count = count + len('eighty')
                curr_num = curr_num - 80
            
            if(num[0] == '9'):
#                print('ninety')
                count = count + len('ninety')
                curr_num = curr_num - 90
        
        
        # single digit
        if(length == 1):
            if(num[0] == '1'):
#                print('-one')
                count = count + 3
                curr_num = curr_num - 1
            
            if(num[0] == '2'):
#                print('-two')
                count = count + 3
                curr_num = curr_num - 2
            
            if(num[0] == '3'):
#                print('-three')
                count = count + 5
                curr_num = curr_num - 3
            
            if(num[0] == '4'):
 #               print('-four')
                count = count + 4
                curr_num = curr_num - 4
            
            if(num[0] == '5'):
  #              print('-five')
                count = count + 4
                curr_num = curr_num - 5
            
            if(num[0] == '6'):
#                print('-six')
                count = count + 3
                curr_num = curr_num - 6
            
            if(num[0] == '7'):
#                print('-seven')
                count = count + 5
                curr_num = curr_num - 7
            
            if(num[0] == '8'):
#                print('-eight')
                count = count + 5
                curr_num = curr_num - 8
            
            if(num[0] == '9'):
#                print('-nine')
                count = count + 4
                curr_num = curr_num - 9
    
    

print('total count =', count)
    
