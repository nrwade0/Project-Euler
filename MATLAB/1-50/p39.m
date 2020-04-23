%{
   Project Euler problem 39 - Integer right triangles
   
    If p is the perimeter of a right angle triangle with integral length 
     sides, {a,b,c}, there are exactly three solutions for p = 120.

     {20,48,52}, {24,45,51}, {30,40,50}

    For which value of p ? 1000, is the number of solutions maximised?
%}

clc
tic

% initialize some variables
max_count = 0;
p_max = 0;
ps = zeros(1,1000); % plotting the perimeters

% check for each p, a, and b
for p = 1:1000
    
    % reset count
    count = 0;
    for a = 1:p
        for b = 1:a
            if(a+b+sqrt(a^2+b^2) == p)
                count = count + 1; % count the number of solutions
            end
        end
    end
    
    % store in array for plotting
    ps(1,p) = count;
    
    % save the max_value
    if(count > max_count)
        max_count = count;
        p_max = p;
    end
end

% print results
fprintf('\nThe max number of solutions is %d at perimeter = %d.\n', ...
    max_count, p_max)
toc

% graph results
plot(1:1000,ps)
