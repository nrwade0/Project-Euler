%{
  Project Euler problem 21 Amicable numbers

    Let d(n) be defined as the sum of proper divisors of n (numbers less 
     than n which divide evenly into n).
    If d(a) = b and d(b) = a, where a ? b, then a and b are an amicable 
     pair and each of a and b are called amicable numbers.

    For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22,
     44, 55 and 110; therefore d(220) = 284. The proper divisors of 284 are
     1, 2, 4, 71 and 142; so d(284) = 220.

    Evaluate the sum of all the amicable numbers under 10000.
%}
tic

% amicable pair sum 'ami_sum' initialized and array of all numbers to check
%  'nums_to_be_checked' (keeps from counting the same numbers twice)
ami_sum = 0;
nums_to_be_checked = 2:1e5;

% check each number up to 10 thousand
for a = 1:1e4
    
    % if it has already been checked - skip it
    if(~ismember(a, nums_to_be_checked))
        continue;
    end
    
    % calculations based on: "If d(a) = b and d(b) = a, where a ? b, then 
    %  a and b are an amicable pair."
    % calculate sum of divisors of our first number...
    b = d(a);
    
    % but disregard the same numbers (a pair of itself)
    if(a == b)
        continue;
    end
    
    % if b and a are an amicable pair...
    if(d(b) == a)
        % add to our running total in 'ami_sum'
        ami_sum = ami_sum + a + b;
        % and remove this pair from the numbers to be removed
        nums_to_be_checked(nums_to_be_checked == a) = [];
        nums_to_be_checked(nums_to_be_checked == b) = [];
        fprintf('a = %d, b = %d \n', a, b)
    end
end

% print answer
toc
fprintf('Amicable number sum = %d \n', ami_sum)


% function to determine the sum of the proper divisors, named 'd' in order
%  to follow notation in the prompt
function ami = d(val)
    K = 1:ceil(val/2);
    ami = sum(K(rem(val,K) == 0));
end



