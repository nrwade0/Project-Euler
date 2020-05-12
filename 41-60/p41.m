%{
   Project Euler problem 41 - Pandigital prime

    We shall say that an n-digit number is pandigital if it makes use of 
     all the digits 1 to n exactly once. For example, 2143 is a 4-digit 
     pandigital and is also prime.

    What is the largest n-digit pandigital prime that exists?
%}

%{
  Important note that the higest pandigital prime is only seven digits
    "a number is divisible by 3 if and only if the digit sum of the number 
    is divisible by 3." So, 8 and 9 length pandigitals are not prime. Only
    4 and 7 are primes.
%}

% only store primes in the 7-digit range
tic
p = setdiff(primes(7654321), primes(7000000));

% check if each prime from highest to lowest is pandigital
for p_i = length(p):-1:1
    if(is_pandigital(num2str(p(p_i))) == 1)
        fprintf('Answer: %d\n', p(p_i))
        toc
        break
    end
end

% checking pandigital, creates column array digits that stores 0s/1s based
% on the required digits
function y = is_pandigital(s)
    digits = zeros(1,length(s));
    
    % storing each digits with a few stipulations
    for i = 1:length(s)
        digit = str2num(s(i));
        if(digit == 0 || digit > length(s) || digits(1,digit) == 1)
            break
        else
            digits(1,digit) = 1;
        end
    end
    
    % return pandigital
    if(digits == 1)
        y = 1;
    else
        y = 0;
    end
end
