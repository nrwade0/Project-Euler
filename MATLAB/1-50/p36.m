%{
   Project Euler problem 36 - Double-base palindromes
    The decimal number, 585 = 1001001001_2 (binary), is palindromic in both
     bases.

    Find the sum of all numbers, less than one million, which are 
     palindromic in base 10 and base 2.

    (Please note that the palindromic number, in either base, may not 
     include leading zeros.)
%}

% takes about 22 seconds to run.
% intilialize running sum and start timer
tic
running_total = 0;

% convert each number i up to 1e6 to strings in decimal and binary and
% check if they are both palindromes thru check_pal()
for i = 1:1e6
    s1 = num2str(i);
    s2 = dec2bin(i);
    if(check_pal(s1, s2) == 1)
        running_total = running_total + i;
    end
end

% print answer
fprintf('Sum of palindromic (in base 10 and 2) numbers = %d.\n',running_total)
toc


% function determines if both strings are palindromes
function y = check_pal(str1, str2)
    if(strcmp(str1,reverse(str1)) && strcmp(str2,reverse(str2)))
        y = 1;
    else
        y = 0;
    end
end
