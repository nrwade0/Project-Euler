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
max_num = 105000;

% possible primes array 'p'
p = 2:max_num;

% start stopwatch and reset flag
tic;
done = 0;

% test all numbers up to max_num
for i = 1:max_num    
    
    for j = 2:i-1
        
        % remove if a number is not a prime
        if(mod(i,j) == 0)
            p(p == i) = [];
            break
        end

        % flag is toggled when target prime is found
        if(length(p) <= N)
            done = 1;
        end
    end
    
    % check flag
    if(done == 1)
        break
    end
end

% over 30 secs runtime
disp(p(N))
toc;

