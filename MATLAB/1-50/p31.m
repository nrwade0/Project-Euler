%{
   Project Euler problem 31 - Coin Sums
    
    In the United Kingdom the currency is made up of pound (£) and
     pence (p). There are eight coins in general circulation:

    1p, 2p, 5p, 10p, 20p, 50p, £1 (100p), and £2 (200p).

    It is possible to make £2 in the following way:
    1×£1 + 1×50p + 2×20p + 1×5p + 1×2p + 3×1p

    How many different ways can £2 be made using any number of coins?
%}


format long g


%{
function solution(target) {
  var coins = [1, 2, 5, 10, 20, 50, 100, 200];
  var table = new Array(target + 1);
  for (var i = 0; i <= target; i++) {
    table[i] = new Array(coins.length);
    table[i][0] = 1;
  }

  for (var i = 0; i <= target; i++) {
    for (var j = 1; j < coins.length; j++) {
      table[i][j] = table[i][j - 1];
      if (coins[j] <= i)
        table[i][j]+= table[i - coins[j]][j];
    }
  }
  return table[i-1][j-1];
}
%}

n = 200;

tic
fprintf('The number of combinations to make %d pence is %d. \n', ... 
n, soln_brute_force(n))
toc


function count = soln_brute_force(n)
    count = 0;
    
    for a = n:-200:0
        for b = a:-100:0
            for c = b:-50:0
                for d = c:-20:0
                    for e = d:-10:0
                        for f = e:-5:0
                            for g = f:-2:0
                                count = count + 1;
                            end
                        end
                    end
                end
            end
        end
    end
end


