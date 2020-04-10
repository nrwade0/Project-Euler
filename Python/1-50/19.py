"""
Project Euler 19 - Counting Sundays

    You are given the following information, but you may prefer to do some
      research for yourself.
    
    1 Jan 1900 was a Monday.
    
    Thirty days has September,
    April, June and November.
    All the rest have thirty-one,
    Saving February alone,
    Which has twenty-eight, rain or shine.
    And on leap years, twenty-nine.
    
    A leap year occurs on any year evenly divisible by 4, but not on a century
      unless it is divisible by 400.
    
    How many Sundays fell on the first of the month during the twentieth 
      century (1 Jan 1901 to 31 Dec 2000)?
"""
    
# List of days in each month - leap year added later
months = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

# counting variables
sunday_count = 0
day = 1

# cycle thru each 'year' in the 20th century
for year in range(1901, 2000):
    
    # cycle thru the months 'm' in each year
    for m in months:
        
        # running count of days, add the number of days in a month for current
        #  first day of the month
        day += m
        
        # calculate leap year month
        if year % 4 == 0 and m == 28:
            day += 1
        
        # if it is a sunday, add it to count
        if day % 7 == 0:
            sunday_count += 1


print('Sundays:', sunday_count)