%{
  Project Euler 23 - Non-abundant sums
   
    A perfect number is a number for which the sum of its proper divisors 
     is exactly equal to the number. For example, the sum of the proper 
     divisors of 28 would be 1 + 2 + 4 + 7 + 14 = 28, which means that 28
     is a perfect number.

    A number n is called deficient if the sum of its proper divisors is 
     less than n and it is called abundant if this sum exceeds n.

    As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the 
     smallest number that can be written as the sum of two abundant numbers
     is 24. By mathematical analysis, it can be shown that all integers 
     greater than 28123 can be written as the sum of two abundant numbers. 
     However, this upper limit cannot be reduced any further by analysis 
     even though it is known that the greatest number that cannot be 
     expressed as the sum of two abundant numbers is less than this limit.

    Find the sum of all the positive integers which cannot be written as 
     the sum of two abundant numbers.
%}

%{
  pseudocode:
    - Calculate all abundant numbers from 1:N by summing divisors and
    comparing. Can also calculate deficient and perfect numbers here too.
    - Hold abundant numbers in a matrix and calculate each sum pair
    with other abundant numbers and place in the respective row. ie,
       sum_ab = [[ab1+ab1 ab1+ab2 ab1+ab3 ... ab1+abN];
                 [ab2+ab1 ab2+ab2 ab2+ab3 ... ab2+abN];
                 [ab3+ab1 ab3+ab2 ab3+ab3 ... ab3+abN];
                    ...
                 [ab(N-1)+ab1 ab(N-1)+ab2 ... ab(N-1)+abN]];
                 [abN+ab1 abN+ab2 abN+ab3 ... abN+abN]];
    - Set differnce between 1:N and sum_ab and sum those for the answer.
%}
tic

% number of abundant numbers below 28123 is 6965
abundant = zeros(1,6965);

N = 28123;
%N = 30; %test

% determine all abundant numbers from 1:N
j = 1; % j is the index for abundant array
for i = 2:N
    
    % calculate and sum the divisors of i
    K = 1:ceil(i/2);
    sum_divs = sum(K(rem(i,K) == 0));
        
    if(sum_divs > i) % if i is abundant
        abundant(1,j) = i;
        j = j + 1;
    end
end

% sum all possible pairs of abundant numbers up to N
len = length(abundant); % len is easier on the eyes
sum_ab = zeros(len); % sum of abundant numbers array 
ind = 1:len; % index for adding the abundant numbers

% for following program purposes
fprintf('Number of abundant numbers = %d \n', len)
toc

for num = 1:len
    
    % helps keep track of where the program is at. delete for performance
    if(rem(num,500) == 0)
        fprintf('Current num = %d\n', num)
    end
    
    % sum all pairs of abundant numbers to a current abundant number 'num'
    for i = 1:len
        temp = abundant(num) + abundant(ind(i));
        sum_ab(num,ind(i)) = temp; % store in sum_ab array
    end
end

% looking for non abundant sums
not_sum = setdiff(1:N, sum_ab);

% sum these
sum(not_sum)

toc