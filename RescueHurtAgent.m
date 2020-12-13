function [agentInfo,layers] = RescueHurtAgent(src,trg,agentId,visibility,...
    agentInfo,layers,dim1,dim2)

% Healthy agent position
r = src(1);
c = src(2);
visibility = visibility*2;
% Check if this agent is going for exit or a hurt target
if agentInfo.agentList(agentId).targetType == 0 % Going for exit
    % Check if there are hurt agents
    % Visibility vectors
    leftHurt = layers.hurtMap(r,max(2,c-visibility):c-1);
    rightHurt = layers.hurtMap(r,c+1:min(dim2-1,c+visibility));
    upHurt = layers.hurtMap(max(2,r-visibility):r-1,c)';
    downHurt = layers.hurtMap(r+1:min(dim1-1,r+visibility),c)';
    
    % if closest hurt agent status is (3)
    % Set own target type to 1
    % Set status of hurt agent as being rescued  (5)
    
    if any(leftHurt,2)
        dist = find(flip(leftHurt),1,'first'); % distance to target
        idxOfHurtAgent = agentInfo.agentIdx(r,c-dist);
        
        if agentInfo.agentList(idxOfHurtAgent).status ~= 5
            agentInfo.agentList(idxOfHurtAgent).status = 5;
            agentInfo.agentList(agentId).escapeTarget = [r,c-dist];
            agentInfo.agentList(agentId).targetType = 1;
        end
        
    elseif any(rightHurt,2)
        dist = find(rightHurt,1,'first');
        idxOfHurtAgent = agentInfo.agentIdx(r,c+dist);
        
       if agentInfo.agentList(idxOfHurtAgent).status ~= 5
            agentInfo.agentList(idxOfHurtAgent).status = 5;
            agentInfo.agentList(agentId).escapeTarget = [r,c+dist];
            agentInfo.agentList(agentId).targetType = 1;
        end

    elseif any(upHurt,1)
        dist = find(flip(upHurt),1,'first');
        idxOfHurtAgent = agentInfo.agentIdx(r-dist,c);
        
        if agentInfo.agentList(idxOfHurtAgent).status ~= 5
            agentInfo.agentList(idxOfHurtAgent).status = 5;
            agentInfo.agentList(agentId).escapeTarget = [r-dist,c];
            agentInfo.agentList(agentId).targetType = 1;
        end

    elseif any(downHurt,1)
        dist = find(downHurt,1,'first');
        idxOfHurtAgent = agentInfo.agentIdx(r+dist,c);
        
        if agentInfo.agentList(idxOfHurtAgent).status ~= 5
            agentInfo.agentList(idxOfHurtAgent).status = 5;
            agentInfo.agentList(agentId).escapeTarget = [r+dist,c];
            agentInfo.agentList(agentId).targetType = 1;
        end
        
    else
        return;
    end 
else %going for a hurt agent
    % If next to hurt agent:
  if Heuristic(src,trg) == 1 && agentInfo.agentList(agentId).targetType == 1  
      hurtAgentIdx = agentInfo.agentIdx(trg(1),trg(2));
      newTarget = agentInfo.agentList(hurtAgentIdx).escapeTarget;
      % set own escapeTarget to same as hurt agent
      agentInfo.agentList(agentId).escapeTarget = newTarget;
      % set own target type to 0
      agentInfo.agentList(agentId).targetType = 0;
      % set hurt agent status to 1
      agentInfo.agentList(hurtAgentIdx).status = 1;
      % set position in hurtmap to 0  
      layers.hurtMap(trg(1),trg(2)) = 0; 
      disp('hello');
  end
end

end

