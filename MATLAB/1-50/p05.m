% 
% Project Euler 5 - Smallest divisible number
% 
% 2520 is the smallest number that can be divided by each of the numbers
%  from 1 to 10 without any remainder.
% 
% What is the smallest positive number that is evenly divisible by all of
%  the numbers from 1 to 20?
% 

% array of [1, 2, ..., 20] and start stop watch
arr = 1:20;
tic

% cycle thru all possibilities up to 1 bil
for i = 20:1e9
    
    % if evenly divisible was found
    found_it = 0;
    
    % next i when odd or divisible by 5 or 10
    if(mod(i,2) == 1 || mod(i,5) ~= 0 || mod(i,10) ~= 0)
        continue
    end
    
    % counts the number of evenly divisible
    n_even = 0;
    for j = 1:length(arr)
        
        % leave if not evenly divisible
        if(mod(i,arr(j)) ~= 0)
            break
        end
        
        n_even = n_even + 1;
        
        % found one with 20 evenly divisibles
        if(n_even == length(arr))
            disp(i)
            found_it = 1;
            break
        end
    end
    
    % found first correct answer
    if(found_it == 1)
        break
    end
end

% end stopwatch
toc