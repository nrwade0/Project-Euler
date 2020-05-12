%{ 
 Project Euler 14 - Largest Collatz sequence
 
The following iterative sequence is defined for the set of positive
 integers:

    n ? n/2 (n is even)
    n ? 3n + 1 (n is odd)

Using the rule above and starting with 13, we generate the following
 sequence:

13 ? 40 ? 20 ? 10 ? 5 ? 16 ? 8 ? 4 ? 2 ? 1

It can be seen that this sequence (starting at 13 and finishing at 1)
 contains 10 terms. Although it has not been proved yet (Collatz Problem),
 it is thought that all starting numbers finish at 1.

Which starting number, under one million, produces the longest chain?

NOTE: Once the chain starts the terms are allowed to go above one million.
%}

% declare target n value and initialize final answers
target = 1e6;
max_n = 0;
iterations = 0;

% iterate from n to target n
for n = 2:target
    
    % save current n value and reset iterations
    temp = n;
    i = 0;
    
    % calculate sequence down to n = 1 while iterating
    while(n ~= 1)
        i = i + 1;
        if(mod(n, 2) == 0)
            n = n/2;
        else
            n = 3*n + 1;
        end
    end
    
    % save if new longest sequence
    if(i > iterations)
        max_n = temp;
        iterations = i;
    end
end

% output answer
max_n
iterations






