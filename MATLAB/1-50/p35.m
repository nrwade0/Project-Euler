%{ 
   Project Euler problem 35 - Circular primes

    The number, 197, is called a circular prime because all rotations of 
     the digits: 197, 971, and 719, are themselves prime.

    There are thirteen such primes below 100: 2, 3, 5, 7, 11, 13, 17, 31, 
     37, 71, 73, 79, and 97.

    How many circular primes are there below one million?
%}

tic
% p are all primes up to 1 mil
p_count = 1e6;
p = primes(p_count);
count = 0;

% check each prime in array p
for i = 1:length(p)
    
    % determine if each is a circular prime
    tf = is_cp(p(i), p);
    
    % if p(i) is then increment the counter
    if(tf == 1)
        count = count + 1;
    end
end

% show answer and time elapsed
fprintf('Total number of circular primes up to %d: %d \n', p_count, count)
toc


%{
  is_cp(int n, array p)  ::: Determine if a prime is a circular prime.
     -returns 'tf', true (1) or false (0) flag of current number.
     -int 'n' is the current tested number
     -array 'p' is the list of prime numbers
%}
function tf = is_cp(n, p)
    % convert number to str to be shifted, reset flag
    str = num2str(n);
    tf = 0;
    
    % for each possible string shift ('shifted_str')...
    for st = 0:length(str)-1
        shifted_str = circshift(str,st);
        
        % check if the shifted string is in the prime array
        if(~ismember(str2num(shifted_str), p))
            break
        end
        
        % if all shifts have been checked, mark the flag.
        if(st == length(str)-1)
            tf = 1;
        end
    end
end
