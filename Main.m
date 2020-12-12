clear all;
%dbstop if naninf
% Parameters
distanceWeight = 50;
repulsionWeight = 50;
inertia = 1.1;
noOfAgents = 200;
drawStateInterval = 100;
panicParam = 0;
dim1 = 75;
dim2 = 100;
R = 1; % Fire radius
timeStep = 1;

% Initialization
layers.solidMap = imread('bitmaps/StaticMap3.bmp');
layers.exitMap = imread('bitmaps/ExitMap3.bmp');
layers.impedanceMap = GenerateImpedance(layers.solidMap);
[Y, X] = ind2sub([75 100], randi(dim1*dim2));
fireCenter = [Y X];
[fireMap, R] = PropagateFire(fireCenter,dim1,dim2,R);
layers.fireMap = fireMap;
[agentInfo, layers] = InitializeAgentPositions(layers,noOfAgents,layers.exitMap);

% Metrics
evacuating = noOfAgents;
rescued = 0;
dead = 0;
hurt = 0;


 while evacuating > 0
     fprintf('RESCUED: %i, EVACUATING: %i, DEAD: %i\n',rescued,evacuating,dead);
    % Rescue any agents on exits
    [nAgentInfo,resc,nLayers] = RescueAgents(agentInfo,layers);
    evacuating = evacuating - resc;
    rescued = rescued + resc;
    agentInfo = nAgentInfo;
    layers = nLayers;
    

    if(mod(timeStep,3) == 0)
    [fireMap, R] = PropagateFire(fireCenter,dim1,dim2,R);
    layers.fireMap = fireMap;
    end
%     agentsInFire = layers.agentMap & layers.fireMap;
%     evacuating = evacuating - sum(agentsInFire(:));
%     dead = dead + sum(agentsInFire(:));
%     layers.agentMap(agentsInFire) = 0;

    
  
    

    
     % UPDATE AGENTS TARGETS IF REQUIRED
    %%%%%%%%%%%%TO DO%%%%%%%%%%%%%%%%
    
    
    % Update movement of agents
    for i = 1:noOfAgents
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
        
    end
     
   
    
    DrawState(layers.solidMap + layers.agentMap.*2 + layers.fireMap.*4);
    timeStep = timeStep + 1;
end
