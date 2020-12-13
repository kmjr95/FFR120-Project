function [agentInfo,rescued, layers] = RescueAgents(agentInfo,layers)

% Find matching tiles
matchMatrix = layers.agentMap & layers.exitMap;
[row,col] = find(matchMatrix == 1);
result = [row, col];


rescued = size(result,1);

if rescued > 0
    for i = 1:rescued

        r = result(i,1);
        c = result(i,2);

        agentIndex = agentInfo.agentIdx(r,c);
        agentInfo.agentList(agentIndex).status = 4;
        agentInfo.agentIdx(r,c) = 0;
        layers.agentMap(r,c) = 0;
        layers.hurtMap(r,c) = 0;
    end
end

end

