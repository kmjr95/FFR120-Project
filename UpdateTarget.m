function newTarget = UpdateTarget(agentPos, target, visibility, fireMap, exitMap)

% Agent's current position
i = agentPos(1);    % i = ROW
j = agentPos(2);    % j = COL

% Visibility radius
maxRow = size(fireMap,1) - 1;
maxCol = size(fireMap,2) - 1;
leftBorder = max(j-visibility, 2);
rightBorder = min(j+visibility, maxCol);
upBorder = max(i-visibility, 2);
downBorder = min(i+visibility, maxRow);

% Visibility maps
left = zeros(size(fireMap,1),size(fireMap,2));
left(i, leftBorder:j) = 1;
right = zeros(size(fireMap,1),size(fireMap,2));
right(i, j:rightBorder) = 1;
up = zeros(size(fireMap,1),size(fireMap,2));
up(upBorder:i, j) = 1;
down = zeros(size(fireMap,1),size(fireMap,2));
down(i:downBorder, j) = 1;

% Exits
rows = find(exitMap(:,1));
exitRow = rows(1);
exitWidth = length(rows) - 1;

exitL = [exitRow 1];
exitR = [exitRow maxCol+1];

cols = find(exitMap(1,:));
exitCol = cols(1);

exitU = [1 exitCol];
exitD = [maxRow+1 exitCol];

% Fire Detection and exit assignement
if sum(sum(fireMap .* left)) > 0
    tile = randi([0 exitWidth]);
    exit = exitR + [tile 0];
    newTarget = exit;
elseif sum(sum(fireMap .* right)) > 0
    tile = randi([0 exitWidth]);
    exit = exitL + [tile 0];
    newTarget = exit;
elseif sum(sum(fireMap .* up)) > 0
    tile = randi([0 exitWidth]);
    exit = exitD + [0 tile];
    newTarget = exit;
elseif sum(sum(fireMap .* down)) > 0
    tile = randi([0 exitWidth]);
    exit = exitU + [0 tile];
    newTarget = exit;
else
    newTarget = target;
end

end