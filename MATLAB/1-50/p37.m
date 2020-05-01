%{
   Project Euler problem 37 - Truncatable primes

    The number 3797 has an interesting property. Being prime itself, it is
     possible to continuously remove digits from left to right, and remain 
     prime at each stage: 3797, 797, 97, and 7. Similarly we can work from
     right to left: 3797, 379, 37, and 3.

    Find the sum of the only eleven primes that are both truncatable from 
     left to right and right to left.

    NOTE: 2, 3, 5, and 7 are not considered to be truncatable primes.
%}

% Takes 7 seconds to run.
tic

% p is prime array with some for-loop variables
p = primes(1e6);
total = 0;
count = 0;

% For all primes > 10, test if p(i) is a truncatable prime
for i = 5:length(p)
    if(right_p(p(i),p) == 1 && left_p(p(i),p) == 1)
        total = total + p(i);
        count = count + 1;
        fprintf('Truncatable prime %d = %d.\n', count, p(i))
    end
    if(count == 11)
        break
    end
end

% print answer
fprintf('Sum of the first 11 truncatable primes = %d.\n', total)
toc


% Tests truncatable prime from left to right
function y = right_p(n,p)
    y = 1;
    for j = 1:numel(num2str(n))
        temp = floor(n/10^(j-1)); % removes unnecessary values based on 
        % current iteration thru the digits
        if(ismember(temp,p)==1)
            continue
        else
            y = 0;
            break
        end
    end
end

% Tests truncatable prime from right to left
function y = left_p(n,p)
    y = 1;
    for j = numel(num2str(n))+1:-1:2
        temp = n/10^(j-1);
        temp = round(rem(temp,1)*10^(j-1),1);% removes unnecessary digits  
        % based on current iteration but now removes leftmost, extra steps
        if(ismember(temp,p)==1)
            continue
        else
            y = 0;
            break
        end
    end
end
