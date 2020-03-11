%{
  Project Euler 32 - Pandigital products
   
    We shall say that an n-digit number is pandigital if it makes use of 
     all the digits 1 to n exactly once; for example, the 5-digit number, 
     15234, is 1 through 5 pandigital.

    The product 7254 is unusual, as the identity, 39 × 186 = 7254, 
     containing multiplicand, multiplier, and product is 1 through 9 
     pandigital.

    Find the sum of all products whose multiplicand/multiplier/product 
     identity can be written as a 1 through 9 pandigital.

    HINT: Some products can be obtained in more than one way so be sure 
     to only include it once in your sum.
%}

%%%%%% current brute force method.... see link below to slim it down
%  https://www.mathblog.dk/project-euler-32-pandigital-products/
tic
pandigitals = [];

for i = 1000:1e5
    K = 1:ceil(i/2);
    divs = K(rem(i,K) == 0);
    
    b = str2double(regexp(num2str(i),'\d','match'));
    
    % add i to removal array
    temp_pan = [];
    for j = 1:length(b)
        temp_pan = [temp_pan b(j)];
    end
    
    %fprintf('for i = %d \n', i)
    while(length(divs) > 2)
        pan = temp_pan;
        multiplicand = divs(end);
        multiplier = i/multiplicand;
        
        divs(divs == multiplicand) = [];
        divs(divs == multiplier) = [];
        
        mcand = str2double(regexp(num2str(multiplicand),'\d','match'));
        for k = 1:length(mcand)
            pan = [pan mcand(k)];
        end
        
        mlier = str2double(regexp(num2str(multiplier),'\d','match'));
        for k = 1:length(mlier)
            pan = [pan mlier(k)];
        end
        
        %fprintf('  testing... \n  multiplicand = %d \n  multiplier = %d\n', multiplicand, multiplier)
        pan = unique(pan);
        %disp(pan)
        if(length(pan) == 9 && ~ismember(i, pandigitals))
            pandigitals = [pandigitals i];
            break
        end
        
    end
    
    
end

pandigitals;
toc
