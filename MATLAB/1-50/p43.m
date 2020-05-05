%{
   Project Euler problem 43 - Sub-string divisibility

    The number, 1406357289, is a 0 to 9 pandigital number because it is 
     made up of each of the digits 0 to 9 in some order, but it also has 
     a rather interesting sub-string divisibility property.

    Let d1 be the 1st digit, d2 be the 2nd digit, and so on. In this way,
     we note the following:

     d2 d3 d4 = 406 is divisible by 2
     d3 d4 d5 = 063 is divisible by 3
     d4 d5 d6 = 635 is divisible by 5
     d5 d6 d7 = 357 is divisible by 7
     d6 d7 d8 = 572 is divisible by 11
     d7 d8 d9 = 728 is divisible by 13
     d8 d9 d10 = 289 is divisible by 17

    Find the sum of all 0 to 9 pandigital numbers with this property.
%}

% takes ~87 seconds to run
%  Quicker algorithm: https://www.xarg.org/puzzle/project-euler/problem-43/
format long g
tic
clc

% Declare variables: p is all permutations of 0-9 pandigitals, s is a sum,
% count is a counter for answers, and answers saves the pandigitals with 
% the sub-string divisibilty property.
p = perms('0123456789');
s = 0;
count = 0;
answer = zeros(6,1);

% for each permutation, cast into integer array (1,10) then test all the
% stipulations from the prompt one-by-one, if passes all, save the number.
for i = 1:length(p)
    pp = p(i,:) - '0';
    
    test1 = str2double(sprintf('%d',pp(1,2),pp(1,3),pp(1,4)));
    if(mod(test1, 2) == 0)
        
        test2 = str2double(sprintf('%d',pp(1,3),pp(1,4),pp(1,5)));
        if(mod(test2, 3) == 0)
            
            test3 = str2double(sprintf('%d',pp(1,4),pp(1,5),pp(1,6)));
            if(mod(test3, 5) == 0)
                
                test4 = str2double(sprintf('%d',pp(1,5),pp(1,6),pp(1,7)));
                if(mod(test4, 7) == 0)
                    
                    test5 = str2double(sprintf('%d',pp(1,6),pp(1,7),pp(1,8)));
                    if(mod(test5, 11) == 0)
                        
                        test6 = str2double(sprintf('%d',pp(1,7),pp(1,8),pp(1,9)));
                        if(mod(test6, 13) == 0)
                            
                            test7 = str2double(sprintf('%d',pp(1,8),pp(1,9),pp(1,10)));
                            if(mod(test7, 17) == 0)
                                s = s + str2double(p(i,:));
                                count = count + 1;
                                answer(count,1) = str2double(p(i,:));
                            end
                        end
                    end
                end
            end
        end
    end
end

% print answer
fprintf('\n%d pandigital numbers with this property sum to %d.\n', count, s)
toc
