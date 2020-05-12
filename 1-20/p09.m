%
% Project Euler 9 - Special Pythagorean Triplet
% 
% A Pythagorean triplet is a set of three natural numbers, a < b < c, for
%  which, a^2 + b^2 = c^2.
%
% For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.
% 
% There exists exactly one Pythagorean triplet for which a + b + c = 1000.
%  Find the product abc.
%

% boolean determining if triple for loop can break
done = 0;

tic;
% testing all a's, b's, and c's up to 1000, recall a < b < c
for a = 1:500
    
    for b = a:500
        
       for c = b:500
           % test for pythagorean triple and sum == 1000
           if(a^2 + b^2 == c^2 && a + b + c == 1000)
               done = 1;
               break
           end
       end
       
       % break out of 'b' for loop if answer is found
       if(done == 1)
          break 
       end
    end
    
    % break out of 'a' for loop if answer is found
    if(done == 1)
       break 
    end
end

% display the product and time elapsed
a*b*c
toc

