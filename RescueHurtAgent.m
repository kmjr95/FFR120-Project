function [hurtMap, agentInfo] = RescueHurtAgent(ID, agentPos,...
    agentInfo, hurtMap, visibility, dim1, dim2)

% Agent pos
r = agentPos(1); % row
c = agentPos(2); % col

agentTarget = agentInfo.agentList(ID).escapeTarget;
visibility = visibility*2;

if agentInfo.agentList(ID).targetType == 0
    
    % Visibility Vectors
    leftHurt = hurtMap(r,max(2,c-visibility):c-1);
    rightHurt = hurtMap(r,c+1:min(dim2-1,c+visibility));
    upHurt = hurtMap(max(2,r-visibility):r-1,c);
    downHurt = hurtMap(r+1:min(dim1-1,r+visibility),c);
    
    if sum(leftHurt) > 0
        distanceVector = (1:length(leftHurt));
        leftHurt = distanceVector .* leftHurt;
        distance = find(leftHurt);
        distance = distance(1); % take the nearest one in the direction
        trg = [r c-distance];
        hurtID = agentInfo.agentIdx(trg(1),trg(2));
        agentInfo.agentList(ID).targetType = hurtID;
        agentInfo.agentList(ID).escapeTarget = trg;
        hurtMap(trg(1),trg(2)) = 0;
        
    elseif sum(downHurt) > 0
        distanceVector = (1:length(downHurt));
        downHurt = distanceVector .* downHurt;
        distance = find(downHurt);
        distance = distance(1); % take the nearest one in the direction
        trg = [r+distance c];
        hurtID = agentInfo.agentIdx(trg(1),trg(2));
        agentInfo.agentList(ID).targetType = hurtID;
        agentInfo.agentList(ID).escapeTarget = trg;
        hurtMap(trg(1),trg(2)) = 0;
        
    elseif sum(rightHurt) > 0
        distanceVector = (1:length(rightHurt));
        rightHurt = distanceVector .* rightHurt;
        distance = find(rightHurt);
        distance = distance(1); % take the nearest one in the direction
        trg = [r c+distance];
        hurtID = agentInfo.agentIdx(trg(1),trg(2));
        agentInfo.agentList(ID).targetType = hurtID;
        agentInfo.agentList(ID).escapeTarget = trg;
        hurtMap(trg(1),trg(2)) = 0;
        
    elseif sum(upHurt) > 0
        distanceVector = (1:length(upHurt));
        upHurt = distanceVector .* upHurt;
        distance = find(upHurt);
        distance = distance(1); % take the nearest one in the direction
        trg = [r-distance c];
        hurtID = agentInfo.agentIdx(trg(1),trg(2));
        agentInfo.agentList(ID).targetType = hurtID;
        agentInfo.agentList(ID).escapeTarget = trg;
        hurtMap(trg(1),trg(2)) = 0;
    
    end
    
else
    dist = Heuristic(agentPos,agentTarget);
    targetType = agentInfo.agentList(ID).targetType;
    if ( dist == 1) && ( targetType > 0)
        hurtID = agentInfo.agentIdx(agentTarget(1),agentTarget(2));
        agentInfo.agentList(hurtID).status = 1;
        newTarget = agentInfo.agentList(hurtID).escapeTarget;
        agentInfo.agentList(ID).escapeTarget = newTarget;
    end
end
