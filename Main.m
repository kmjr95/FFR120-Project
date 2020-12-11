clear all;
% Parameters
distanceWeight = 50;
repulsionWeight = 50;
inertia = 1.1;
noOfAgents = 300;
drawStateInterval = 100;
panicParam = 0;

% Initialization
layers.solidMap = imread('bitmaps/StaticMap2.bmp');
layers.exitMap = imread('bitmaps/ExitMap2.bmp');
layers.impedanceMap = GenerateImpedance(layers.solidMap);
[agentInfo, layers] = InitializeAgentPositions(layers,noOfAgents,layers.exitMap);


% Metrics
evacuating = noOfAgents;
rescued = 0;
dead = 0;
hurt = 0;


while evacuating > 0
    % Rescue any agents on exits
    [nAgentInfo,resc,nLayers] = RescueAgents(agentInfo,layers);
    evacuating = evacuating - resc;
    rescued = rescued + resc;
    agentInfo = nAgentInfo;
    layers = nLayers;
    
    % Check if any agents in fire
    %%%%%%%%%%%%TO DO%%%%%%%%%%%%%%%%
    
     % UPDATE AGENTS TARGETS IF REQUIRED
    %%%%%%%%%%%%TO DO%%%%%%%%%%%%%%%%
    
    
    % Update movement of agents
    for i = 1:size(agentInfo.agentList,2)
        src = agentInfo.agentList(i).location;
        trg = agentInfo.agentList(i).escapeTarget;
        
        % Risk of misstep/getting hurt
        %%%%%%%%%%%%TO DO%%%%%%%%%%%%%%%%
        
        if agentInfo.agentList(i).status == 1
            [newLayers,newSrc] =  CalculateNextMovement(src,trg,layers,...
                 repulsionWeight,distanceWeight,inertia);
             layers = newLayers;
             agentInfo.agentList(i).location = newSrc;
             agentInfo.agentIdx(src(1),src(2)) = 0;
             agentInfo.agentIdx(newSrc(1),newSrc(2)) = i;
        end
        if ~mod(i,drawStateInterval)
         DrawState(layers.solidMap + layers.agentMap.*2);
        end
    end
end
