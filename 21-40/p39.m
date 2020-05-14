%{ 
   Project Euler problem 39 - Integer right triangles

    If p is the perimeter of a right angle triangle with integral length 
     sides, {a,b,c}, there are exactly three solutions for p = 120.

    {20,48,52}, {24,45,51}, {30,40,50}

    For which value of p ≤ 1000, is the number of solutions maximised?
%}

tic
% store some counting variables
count = 0;
max_count = 0;
max_P = 0;

% Check each perimeter and check all sides (a, b, c)
for P = 3:1000
    for a = 1:P
        for b = 1:a
            c = sqrt(a^2+b^2);
            % count if the perimeter solutions match
            if(a+b+c == P)
                count = count + 1;
            end
        end
    end
    
    % Save the highest count, and the number of solutions
    if(count > max_count)
        max_count = count;
        max_P = P;
    end
    % reset counter
    count = 0;
end

% print answer
fprintf('Solutions are maximized (%d) for p = %d\n', max_count, max_P)
toc
