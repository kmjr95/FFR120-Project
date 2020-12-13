function agentList = InitializeAgents(agentList,agentNo,pos,exitMap)
%This function returns a struct corresponding to agent information
%At initialization


    [row, col] = find(exitMap);
    exits = [row col];
    noExits = size(exits,1);
    
    dirs = mod(randi(4).*90,360);
    agentList(agentNo).status = 1; % 1 alive, 2 hurt, 3 dead, 4 rescued
    agentList(agentNo).location = pos;
    agentList(agentNo).direction = dirs(1); % Random start direction
    agentList(agentNo).targetType = 0; % 0 not rescuing, ID rescuing agent
    
    % The random initial target is considered the entrance and most
    % familiar exit for the exit
    agentList(agentNo).escapeTarget = exits(randi(noExits),:);
end

