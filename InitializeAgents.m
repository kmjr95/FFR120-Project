function agentList = InitializeAgents(agentList,agentNo,pos)
%This function returns a struct corresponding to agent information
%At initialization

    dirs = mod(randi(4).*90,360);

    agentList(agentNo).status = 1; % 1 alive, 2 hurt, 3 dead
    agentList(agentNo).panicLevel = 0;
    agentList(agentNo).location = pos;
    agentList(agentNo).direction = dirs(1); % Random start direction
    agentList(agentNo).escapePlan = false;
    agentList(agentNo).escapeTarget = [NaN NaN]; % NaN NaN means no target
    agentList(agentNo).roomId = FindRoomId(pos); % Which room the agent is currently in
    agentList(agentNo).enteredFrom = randi(4); % Which entrance was entered from
    
end

