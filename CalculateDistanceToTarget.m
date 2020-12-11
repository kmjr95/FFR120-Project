function distance = CalculateDistanceToTarget(src,target,dir)
% Repeat targets
target = [repelem(target(1),size(src,1))',repelem(target(2),size(src,1))'];
% Pass possible sources and target
distance = transpose(Heuristic(src + dir,target));


end

