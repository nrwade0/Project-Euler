%{
   Project Euler problem 34 - Digit factorials

    145 is a curious number, as 1! + 4! + 5! = 1 + 24 + 120 = 145.

    Find the sum of all numbers which are equal to the sum of the factorial
     of their digits.

    Note: as 1! = 1 and 2! = 2 are not sums they are not included.
%}

tic % takes about 1 second
answer = 0; % sum of all numbers equal to the sum of factorial

% check each number up to 50,000 for the sum of its factorial parts
for i = 10:50000
    
    % cast to integer array
    str = num2str(i) - '0';
    
    % check the main calculation
    if(sum(factorial(str)) == i)
        answer = answer + i;
    end
end

fprintf('Answer = %d.\n', answer)
toc