%
% Project Euler 10 - Summation of primes
% 
% The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
%
% Find the sum of all the primes below two million.
% 

% change disp() settings
format long g

% sum all primes up to 2e6
target_end = 2e6;

% determines primes up to 'target_end' and saves in 'primes' array
primes = 2:target_end;
p = 2;

% using sieve method
while (p <= target_end)
    for i = 2*p:p:target_end
        primes(i - 1) = 0;
    end
    p = p + 1;
end

primes = primes(primes > 0);

% display answer
disp(sum(primes))