%{
   Project Euler problem 47 - Distinct primes factors

    The first two consecutive numbers to have two distinct prime factors 
     are:

     14 = 2 × 7
     15 = 3 × 5

    The first three consecutive numbers to have three distinct prime 
     factors are:

     644 = 2² × 7 × 23
     645 = 3 × 5 × 43
     646 = 2 × 17 × 19.

    Find the first four consecutive integers to have four distinct prime 
     factors each. What is the first of these numbers?
%}

% initialize variables
tic            % takes about 7 seconds to run
n = 4;         % consecutive integers / distinct primes
N = 1e6;       % highest value to iterate up to
count = 0;     % running count of consecutive integers (tells when to stop)
p = primes(N); % list of primes up to N

for i = 1000:N
    
    % check if i has n distinct prime factors
    f = factor(i);
    if(length(unique(f)) == n && ismember(f, p) == 1)
        count = count + 1;
    else
        count = 0;
    end
    
    % show answer when n consecutive ints are counted
    if(count == n)
        fprintf('\nAnswer: %d, %d, %d, %d\n', i-3, i-2, i-1, i)
        toc
        break
    end
end





