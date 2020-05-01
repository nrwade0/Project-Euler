%{
   Project Euler problem 36 - Double-base palindromes
    The decimal number, 585 = 1001001001_2 (binary), is palindromic in both
     bases.

    Find the sum of all numbers, less than one million, which are 
     palindromic in base 10 and base 2.

    (Please note that the palindromic number, in either base, may not 
     include leading zeros.)
%}

tic
s1 = num2str(585);
s2 = dec2bin(585);
check_pal(s1,s2)

su = 0;
for i = 1:1e6
    s1 = num2str(i);
    s2 = dec2bin(i);
    if(check_pal(s1, s2) == 1)
        su = su + i;
    end
end
su
toc

% function determines if both strings are palindromes
function y = check_pal(str1, str2)
    if(strcmp(str1,reverse(str1)) && strcmp(str2,reverse(str2)))
        y = 1;
    else
        y = 0;
    end
end