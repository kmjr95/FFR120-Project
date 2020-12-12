function [layers,agentInfo,R,D] = PropagateFire(layers,agentInfo,...
    center,dim1,dim2,R)
D = 0;
% Generate the fire
[columnsInImage, rowsInImage] = meshgrid(1:dim2, 1:dim1);
centerX = center(2);
centerY = center(1);
layers.fireMap = (rowsInImage - centerY).^2 ...
    + (columnsInImage - centerX).^2 <= R.^2;
R = R + 1;


% Check for agents in fire
agentsInFire = layers.fireMap & layers.agentMap;
layers.agentMap(agentsInFire) = 0;
agentsInFireIdx = agentInfo.agentIdx(agentsInFire);
if ~isempty(agentsInFireIdx)
    D = numel(agentsInFireIdx);
    for i = 1:D
        agentInfo.agentList(agentsInFireIdx(i)).status = 3;
    end
end
end

