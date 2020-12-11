function distance = CalculateDistanceToTarget(src,target,dir)
% Repeat targets
target = [repelem(target(1),8)',repelem(target(2),8)'];
% Pass possible sources and target
distance = transpose(Heuristic(src + dir,target));


end

