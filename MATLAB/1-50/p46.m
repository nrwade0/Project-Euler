%{
 Project Euler 46 - Goldbach's other conjecture

    It was proposed by Christian Goldbach that every odd composite number
    can be written as the sum of a prime and twice a square.
    
    n = p_n + 2*k^2  ->  k^2 = (n - p_n)/2
    
    9 = 7 + 2×1^2
    15 = 7 + 2×2^2
    21 = 3 + 2×3^2
    25 = 7 + 2×3^2
    27 = 19 + 2×2^2
    33 = 31 + 2×1^2

    It turns out that the conjecture was false. What is the smallest odd 
    composite that cannot be written as the sum of a prime and twice a
    square?
%}

% composite numbers are just not prime numbers...
tic;

% determines all primes and composites up to 'M'
M = 10000;
primes = 2:M;
p = 2;

% calculate primes up to M using sieve method
while (p <= M)
    for i = 2*p:p:M
        primes(i - 1) = 0;
    end
    p = p + 1;
end
primes = primes(primes > 0);

% composite numbers up to M, opposite of primes
composites = setdiff(1:M,primes);

% keep only odd composites
odd_comps = composites(mod(composites,2) == 1);


% cycle thru each odd composite number and calculate k = sqrt((n - p_n/2))
for i = 2:length(odd_comps)
    % initialize some variables used in k calculation
    n = odd_comps(i); % current odd composite
    P = primes(primes < odd_comps(i)); % P list of primes up to n
    has_answer = 0; % current n does not have an answer
    
    % for each prime up to n, defined as p_n
    for j = 1:length(P)
        p_n = P(j);
        
        % check if k = (n - p_n/2) is a square
        if(mod(sqrt((n - p_n)/2), 1) == 0)
            
            has_answer = 1; % follows conjecture (has k), so break
            
            % print misc information
            %fprintf('n = %d follows conjecture - not our answer! \n', n)
            %fprintf('%d = %d + 2*%d^2 \n', n, p_n, sqrt((n - p_n)/2))
            break
        end
    end
    
    %disp('-------------------')
    
    % print the answer when no k is found in above for/if statement
    if(has_answer == 0)
        fprintf('ANSWER: n = %d \n', n)
        break
    end
    
end

toc;
