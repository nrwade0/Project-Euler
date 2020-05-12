%
% Project Euler 7 - 10,001st prime number
% 
% By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can
%  see that the 6th prime is 13.
% 
% What is the 10,001st prime number?
%

% Nth prime number and max number to test
N = 10001;
max_num = 1e6;

% determines primes up to 'max_num' and saves in 'primes' array
primes = 2:max_num;
p = 2;
tic;

% using sieve method
while (p <= max_num)
    for i = 2*p:p:max_num
        primes(i - 1) = 0;
    end
    p = p + 1;
end

primes = primes(primes > 0);

% over 30 secs runtime
disp(primes(N))
toc;

