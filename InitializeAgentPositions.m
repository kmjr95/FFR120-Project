function [agentMap, agentList] = InitializeAgentPositions(staticObjectMap,...
    noOfAgents)

dim1 = size(staticObjectMap,1);
dim2 = size(staticObjectMap,2);
agentMap = zeros(dim1,dim2);

% Find available positions
temp = ones(dim1,dim2) - staticObjectMap;
[row,col] = find(temp==1);
indices = [row col];
maxIdx = size(indices,1);

if noOfAgents > maxIdx
    msg = 'Conflicting parameters';
    error(msg);
end

agentList = [];

for i = 1:noOfAgents
    idx = randi(maxIdx);
    pos = indices(idx,:);
    agentMap(pos(1),pos(2)) = 1;
    agentList = InitializeAgents(agentList,i,pos);
    indices(idx,:) = [];
    maxIdx = maxIdx - 1;
end

end

