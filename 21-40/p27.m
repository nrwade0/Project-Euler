%{
   Project Euler problem 27 - Quadratic primes
   
    Euler discovered the remarkable quadratic formula: n^2 + n + 41.

    It turns out that the formula will produce 40 primes for the 
     consecutive integer values 0 <= n <= 39
    
    However, when n = 40, 40^2 + 40 + 41 = 40*(40 + 1) + 41 is divisible 
     by 41, and certainly when n = 41, 41^2 + 41 + 41 is clearly divisible
     by 41.

    The incredible formula n^2 - 79n + 1601 was discovered, which produces
     80 primes for the consecutive values 0 <= n <= 79. The product of the
     coefficients, -79 and 1601, is -126479.

    Considering quadratics of the form: n^2 + an + b, where |a| < 1000 and
     |b| < 1000, where |n| is the modulus/absolute value of n, e.g. |11| =
     11 and |-4| = 4

    Find the product of the coefficients, a and b, for the quadratic 
     expression that produces the maximum number of primes for consecutive
     values of n, starting with n = 0.
%}

clear all
tic

% initialize some variables
a = -1000:1000;     % arrays of possible coefficients, a and b.
b = -1000:1000;
p = primes(15000);  % array of primes up to 15000
n_max = 0;          % max values in equation, to be printed
a_max = 0;
b_max = 0;
consecutive_ns = 0; % running total of consecutive primes numbers

% for each combination in a and b (outer double for-loop)
for ia = 1:length(a)
    a_i = a(ia);
    
    for ib = 1:length(b)
        b_i = b(ib);

        % check each n up to arbitrary 100, always breaks before
        for n = 1:100
            % calculate temp value using the equation
            temp = n*n + n*a_i + b_i;
            
            if(ismember(temp, p) == 1) % if prime add to counter
                consecutive_ns = consecutive_ns + 1;
            else                       % otherwise, leave
                break
            end
        end
        
        % if new highest consecutive primes, store our variables
        if(consecutive_ns > n_max)
            n_max = n;
            a_max = a_i;
            b_max = b_i;
        end
        
        % reset counter
        consecutive_ns = 0;
    end
end

% print results, takes about 12 seconds to run on Macbook Pro
fprintf('\nMAX: n = %d // a = %d // b = %d\n', n_max, a_max, b_max)
fprintf('  formula: n^2 = %d*n + %d\n', a_max, b_max)
fprintf('  a*b = %d\n\n', a_max*b_max)
toc

