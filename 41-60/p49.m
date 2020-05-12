%{
   Project Euler problem 49 - Prime permutations

    The arithmetic sequence, 1487, 4817, 8147, in which each of the terms 
     increases by 3330, is unusual in two ways: (i) each of the three 
     terms are prime, and, (ii) each of the 4-digit numbers are 
     permutations of one another.

    There are no arithmetic sequences made up of three 1-, 2-, or 3-digit 
     primes, exhibiting this property, but there is one other 4-digit 
     increasing sequence.

    What 12-digit number do you form by concatenating the three terms in 
     this sequence?
%}

% initialize variables
prime = setdiff(primes(9999),primes(1488)); %array of primes from 1488-9999
result = 0;

% cycle thru all primes with indices i and j
for i = 1:length(prime)
    for j = i + 1:length(prime)
        
        % first two values are indexed at i and j, k is calculated at next
        % interval
        k = prime(j) + (prime(j) - prime(i));
        
        % if k is a prime less tham 10000
        if(k < 10000 && ismember(k,prime) == 1)
            
            % while all are permutations of each other, see func
            if(is_perm(prime(i),prime(j))==1 && is_perm(prime(i),k)==1)
                % save and leave
                result = [prime(i) prime(j) k];
                break;
            end
        end
    end
    if(result > 0)
        break;
    end
end

% display the results
disp(result)


% check if m is a permutation of n
function TF = is_perm(m, n)
    M_perms = unique(str2double(cellstr(perms(int2str(m)))));
    TF = ismember(n, M_perms);
end


