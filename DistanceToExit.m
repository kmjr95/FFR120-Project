function [d] = DistanceToExit(pos,map)

    [x,y] = find(map.exitMap == 1);
    r = [x-pos(1) y-pos(2)];
    d = min(vecnorm(r'));

end