%{
   Project Euler problem 50 - Consecutive prime sum
   
    The prime 41, can be written as the sum of six consecutive primes:

     41 = 2 + 3 + 5 + 7 + 11 + 13
    
    This is the longest sum of consecutive primes that adds to a prime 
     below one-hundred. The longest sum of consecutive primes below 
     one-thousand that adds to a prime, contains 21 terms, and is equal 
     to 953.

    Which prime, below one-million, can be written as the sum of the 
     most consecutive primes?
%}

%{
    FUTURE WORK: current brute force method takes 120 seconds to run.
     Look into vectorizing the summing and reducing the for loops. A triple
     nested for loop iterating length(prime) ~= 78000 each time is too much
%}

tic

% initialize some variables
up_to = 1e6;
prime = primes(up_to);
consecutive_Ns = [0 0];

% cycle thru the upper half of primes to save some computation
for p = length(prime)/2:length(prime)
    for i = 1:p-2 % allows the running sum to change starting indices
        temp = 0; % running sum in temp
        for n = i:p-1 % cycle from prime(i) to prime(p-1)
            temp = temp + prime(n);
            
            % performs actions when there is a sum
            if(prime(p) == temp)
                temp = 0;
                
                % if is the highest consecutive Ns
                if(n-i+1 > consecutive_Ns(1,2))
                    consecutive_Ns(1,2) = n-i+1;
                    consecutive_Ns(1,1) = prime(p);
                end
                break
            end
            
            % if the running sum goes over the current prime, reset
            if(temp > prime(p))
                temp = 0;
                break
            end
        end
    end    
end

% show answer
fprintf('Prime %d is the sum of %d consecutive prime numbers.\n', ...
    consecutive_Ns(1,1), consecutive_Ns(1,2))
toc

