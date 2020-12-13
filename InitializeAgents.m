function agentList = InitializeAgents(agentList,agentNo,pos,exitMap)
%This function returns a struct corresponding to agent information
%At initialization


    [row, col] = find(exitMap);
    exits = [row col];
    noExits = size(exits,1);
    
    agentList(agentNo).status = 1; % 1 alive, 2 hurt, 3 dead, 4 rescued, 5 being rescued
    agentList(agentNo).location = pos;
    agentList(agentNo).targetType = 0; % 0 means exit is target, 1 means hurt agent is target
    % The random initial target is considered the entrance and most
    % familiar exit for the exit
    agentList(agentNo).escapeTarget = exits(randi(noExits),:);
end

