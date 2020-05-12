%{
  Project Euler problem 67 Maximum path sum 2

    Find the maximum total from top to bottom in triangle.txt (right click
    and 'Save Link/Target As...'), a 15K text file containing a triangle
    with one-hundred rows.

NOTE: This is a much more difficult version of Problem 18. It is not 
    possible to try every route to solve this problem, as there are 299 
    altogether! If you could check one trillion (1012) routes every second 
    it would take over twenty billion years to check them all. There is an 
    efficient algorithm to solve it. ;o)
%}

tic

% input text file triangle and save into 1x5050 array
cd /Users/nick/Documents/GitHub/Project-Euler/MATLAB/51-100/data
f = fopen('p67_triangle.txt','r');
tt = fscanf(f, '%d');
fclose(f);

% Build pyramid into t and fill it based on 5050 array
t = zeros(100,100);
done = 0;
ind = 1;

% row/col follows the triangle indices
for row = 1:100
    for col = 1:row
        
        % place into triangle and increment indices
        t(row,col) = tt(ind);
        ind = ind + 1;
        
        % if the indices beyond the number of numbers, break out of loop
        if(ind > length(tt))
            done = 1;
            break
        end
    end
    
    if(done == 1)
        break
    end
end

% calculate paths from bottom to top
for i = size(t,1)-1:-1:1
    for j = 1:i
        t(i,j) = t(i,j) + max(t(i+1,j), t(i+1, j+1));
    end
end

fprintf('Max path sum: %d \n', t(1,1))

toc
