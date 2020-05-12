%{
   Project Euler 30 - Digit fifth powers

    Surprisingly there are only three numbers that can be written as the 
     sum of fourth powers of their digits:

     1634 = 14 + 64 + 34 + 44
     8208 = 84 + 24 + 04 + 84
     9474 = 94 + 44 + 74 + 44
    As 1 = 14 is not a sum it is not included.

    The sum of these numbers is 1634 + 8208 + 9474 = 19316.

    Find the sum of all the numbers that can be written as the sum of fifth
     powers of their digits.
%}

% takes about 4 seconds to run
tic
total = 0;

% loop thru numbers and calculate the sum of fifth powers
for i = 2:355000
    d = num2str(i)-'0'; % convert to array
    if(sum(d.^5) == i)  % fifth and sum array and compare with full number
        fprintf('%d\n', i)
        total = total + i;
    end
end

% print results
fprintf('Sum of these numbers = %d\n', total)
toc