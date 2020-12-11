function [layers, nSrc] = CalculateNextMovement(src,target,layers,wr,wd,inertia)

directions = [-1 -1;... %NW
    0  -1;... %W
    1  -1;... %SW
    -1  0;... %N
    0   0;... %C
    1   0;... %S
    -1   1;... %NE
    0   1;... %E
    1   1];   %SE

% Extract neighbourhood from matrix based on src location
rLo = src(1)-1;
rHi = src(1)+1;
cLo = src(2)-1;
cHi = src(2)+1;

obstacles = layers.agentMap(rLo:rHi,cLo:cHi) + layers.solidMap(rLo:rHi,cLo:cHi);

if  all(obstacles(:)) % If obstructed in all directions
    nSrc = src;  
else
    impedance = layers.impedanceMap(rLo:rHi,cLo:cHi);
    distance = CalculateDistanceToTarget(src,target,directions)';
    impedance = impedance(:);
    obstacles = obstacles(:);
    obstacles(5) = 0;
    
    dMax = max(distance);
    dMin = min(distance);
    rMax = max(impedance);
    rMin = min(impedance);
    rDenominator = (rMax-rMin);
    dDenominator = (dMax-dMin);
    
    % Avoid division by zero
    if rDenominator == 0
        rDenominator = realmin;
    end
    if dDenominator == 0
        dDenominator = realmin;
    end
    
    dSmall = (dMax - distance)./(dDenominator);
    rSmall = (rMax - impedance)./(rDenominator);
    
    probabilities = (wd.*dSmall + wr.*rSmall).*~obstacles;
    probabilities = probabilities.*(1/sum(probabilities));
    probabilities(5) = probabilities(5)*0.1;
    [~,I] = max(probabilities);
    
    
    if I ~= 5
        nSrc = src + directions(I,:);
        layers.agentMap(nSrc(1),nSrc(2)) = 1;
        layers.agentMap(src(1),src(2)) = 0;
    else
        nSrc = src;
    end
      
        
end
    
    
end

