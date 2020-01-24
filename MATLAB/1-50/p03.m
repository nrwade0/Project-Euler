%
% Project Euler 3 - Largest prime factor
% 
% The prime factors of 13195 are 5, 7, 13 and 29.
% 
% What is the largest prime factor of the number 600851475143?
% 


% end_num = 13195; % -- test
target = 600851475143;

% declare empty prime number array
primes = [];

for i = 2:10000 % cycle thru possible primes, up to 10000
    is_prime = 1; % assume every number is a prime number
    
    for j = 2:ceil(sqrt(i)) % divide candidates by every no. below sqrt(i)
        if(mod(i,j) == 0)
            is_prime = 0;
            break
        end
    end
    
    % if it is found to be prime, save it
    if(is_prime == 1)
        primes = [primes i];
    end
end

%disp(primes) % display our primes


% divide each prime number into target
for i = 1:length(primes)
    
    % if it is divisible evenly, display it and save new target
    if(mod(target,primes(i)) == 0)
        disp(primes(i))
        target = target/primes(i);
    end
    
    % if target cannot be simplified, end the program.
    if(target == 1)
        disp('end_num == 1 --- break')
        break
    end
    
end