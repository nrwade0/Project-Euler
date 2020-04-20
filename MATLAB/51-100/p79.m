%{
   Project Euler problem 79 - Passcode derivation
   
    A common security method used for online banking is to ask the user for
     three random characters from a passcode. For example, if the passcode 
     was 531278, they may ask for the 2nd, 3rd, and 5th characters; the 
     expected reply would be: 317.

    The text file, keylog.txt, contains fifty successful login attempts.

    Given that the three characters are always asked for in order, analyse
     the file so as to determine the shortest possible secret passcode of 
     unknown length.
%}

%{
    My algorithm idea is to use the nodes and edges of a directed graph to
    determine the most common key signature.
    
    First, we must determine which values are punched consecutively. Then,
    store their frequencies and use as weights. Plot this directed graph to
    determine our sequence.

    REFERENCES:
https://codereview.stackexchange.com/questions/107573/project-euler-...
 problem-79-deducing-a-passcode
https://en.wikipedia.org/wiki/Adjacency_matrix
https://www.mathblog.dk/project-euler-79-secret-numeric-passcode/
%}

% weights flag for final plotting. weighting can make answer less clear.
weights = 0;

% open keylog file and read into 'keys' array (only unique punches)
tic
cd /Users/nick/Documents/GitHub/Project-Euler/MATLAB/51-100
f = fopen('data/p79_keylog.txt','r');
keys = textscan(f,'%f', 'Delimiter','\n');
fclose(f);
keys = unique(keys{1}(:));

% create 'pairs' array to keep track of punched keys (two at a time)
pairs = zeros(length(keys)*2, 2);
ind = 1;

% determine the pairs of numbers in each keystroke from 'keys'
for i = 1:length(keys)
    str_k = num2str(keys(i));
    
    % for each successful login attempt trio...
    for j = 1:3
        % record the keystroke before a number
        if(j > 1) % before
            pairs(ind, 1) = str2num(str_k(j-1)); % from
            pairs(ind, 2) = str2num(str_k(j));   % to
            ind = ind + 1;
        end
        %{
        % record the keystroke after a number
        if(j < 3) % after
            pairs(ind, 1) = str2num(str_k(j));   % from
            pairs(ind, 2) = str2num(str_k(j+1)); % to
            ind = ind + 1;
        end
        %}
    end
end

% unable to plot zeros in MATLAB, all values increased by one to alleviate
%  this 
pairs = pairs+1;

if(weights == 1)
    % adds up frequencies of each pair
    [pairs,jj,kk] = unique(pairs,'rows');
    weights = histc(kk,1:numel(jj)); %frequencies

    % build directed graph 'G' and calculate line widths based on weights
    G = digraph(pairs(:,1), pairs(:,2), weights);
    LWidths = 5*G.Edges.Weight/max(G.Edges.Weight);

    % plot G
    hold on
    p = plot(G);
    p.EdgeLabel = G.Edges.Weight;
    p.LineWidth = LWidths;
    p.MarkerSize = 6;
    p.NodeColor = 'r';
    hold off
else
    % build directed graph 'G'
    G = digraph(pairs(:,1), pairs(:,2));

    % plot G
    hold on
    p = plot(G);
    p.MarkerSize = 6;
    p.NodeColor = 'r';
    hold off
end

% warning about matlab indexing
fprintf(['\nNOTE: MATLAB indexing requires a start at 1 instead of 0. ',...
    'Therefore, all nodes \n on the main plot require subtraction ',...
    'of 1 .\n\n'])
% explanation of answer
fprintf(['The weights can sometimes muddle the answer. Therefore, ',...
    'they be turned off \n at the beginning of the program.\n\n'])
fprintf(['The generated answer may not be exactly clear given just ',...
    'the plot, but answer \n is readily calculated by reading the ',...
    'nodes from top to bottom, omitting nodes',...
    ' \n 4 & 5 because they''re not connected to any other',...
    'node. Using this information \n and the note above on MATLAB ',...
    'indexing, the answer is shown to be 73162890.\n\n'])
toc

