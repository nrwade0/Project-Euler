% 
% Project Euler 4 - Palindromic products
% 
% A palindromic number reads the same both ways. The largest palindrome
%  made from the product of two 2-digit numbers is 9009 = 91 � 99.
%
% Find the largest palindrome made from the product of two 3-digit numbers.
% 

threes = 100:999;
max = 0;

for i = 1:length(threes)
    for j = 1:length(threes)
        product = threes(i) * threes(j);
        
        if(read_palindrome(num2str(product)) == true)
            if(product > max)
                max = product;
            end
        end
    end
end

disp(max)


function y = read_palindrome(str)
    if(str == reverse(str))
        y = true;
    else
        y = false;
    end
end