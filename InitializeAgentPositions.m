function [agentInfo, layers] = InitializeAgentPositions(layers,...
    noOfAgents,exitMap)

dim1 = size(layers.solidMap,1);
dim2 = size(layers.solidMap,2);
agentMap = zeros(dim1,dim2);
agentIdx = zeros(dim1,dim2);

% Find available positions
temp = ones(dim1,dim2) - layers.solidMap;
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
    agentIdx(pos(1),pos(2)) = i;
    agentList = InitializeAgents(agentList,i,pos,exitMap);
    indices(idx,:) = [];
    maxIdx = maxIdx - 1;
end

layers.agentMap = agentMap;
agentInfo.agentIdx = agentIdx;
agentInfo.agentList = agentList;
end

