%{
   Project Euler 76 - Counting summations

    It is possible to write five as a sum in exactly six different ways:

     4 + 1
     3 + 2
     3 + 1 + 1
     2 + 2 + 1
     2 + 1 + 1 + 1
     1 + 1 + 1 + 1 + 1

    How many different ways can one hundred be written as a sum of at 
     least two positive integers?
%}

tic % < 1sec
% Each sum of n is the number of sums of (n-1) and then some.
target = 100;
ns = 1:target;
ways_to_sum = zeros(target+1,1);
ways_to_sum(1,1) = 1;

% dynamic programming solution that produces the number of sums for ns(n_i)
% then adds the extra in the nested for-loop
for i_n = 1:length(ns)
    n = ns(i_n);
    for i = n:target
        ways_to_sum(i+1,1) = ways_to_sum(i+1,1) + ways_to_sum(i-n+1,1);
    end
end
    
% print results
fprintf('There are %d ways to sum the number %d.\n', ways_to_sum(end,1)-1, target);
toc