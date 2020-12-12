clear all;
%dbstop if naninf
% Parameters
distanceWeight = 50;
repulsionWeight = 50;
noOfAgents = 500;
drawStateInterval = 100;
dim1 = 75;
dim2 = 100;
R = 1; % Fire radius
timeStep = 1;
panicThreshold = [0.0001 0.001];
mode = 1; % 1 rational, 2 panic

% Initialization
layers.solidMap = imread('bitmaps/StaticMap3.bmp');
layers.exitMap = imread('bitmaps/ExitMap3.bmp');
layers.impedanceMap = GenerateImpedance(layers.solidMap);
[Y, X] = ind2sub([dim1 dim2], randi(dim1*dim2));
fireCenter = [Y X];
layers.fireMap = zeros(dim1,dim2);
layers.hurtMap = zeros(dim1,dim2);
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
    

    % Propagate fire
    if(mod(timeStep,3) == 0)
        [layers,agentInfo,R,D] = PropagateFire(layers,agentInfo,fireCenter,dim1,dim2,R);
        evacuating = evacuating - D;
        dead = dead + D;
    end

     % UPDATE AGENTS TARGETS IF REQUIRED
    %%%%%%%%%%%%TO DO%%%%%%%%%%%%%%%%
    
    
    % Update movement of agents
    for i = 1:noOfAgents
        src = agentInfo.agentList(i).location;
        trg = agentInfo.agentList(i).escapeTarget;
        
        % Risk of misstep/getting hurt
        if rand < panicThreshold(mode)
            layers.hurtMap(src(1),src(2)) = 1;
            agentInfo.agentList(i).status = 2;
            hurt = hurt + 1;
        end
        
        if agentInfo.agentList(i).status == 1
            [newLayers,newSrc] =  CalculateNextMovement(src,trg,layers,...
                 repulsionWeight,distanceWeight);
             layers = newLayers;
             agentInfo.agentList(i).location = newSrc;
             agentInfo.agentIdx(src(1),src(2)) = 0;
             agentInfo.agentIdx(newSrc(1),newSrc(2)) = i;
        end
        
    end
     
   
    fprintf('RESCUED: %i, EVACUATING: %i, DEAD: %i, HURT: %i\n',rescued,evacuating,dead,hurt);
    DrawState(layers,dim1,dim2);
    timeStep = timeStep + 1;
end
