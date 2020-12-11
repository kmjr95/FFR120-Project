function dist = Heuristic(src,targ)

dxy = abs(src-targ);
dist = min(dxy(:,2),dxy(:,1))*1.414+abs(dxy(:,2)-dxy(:,1));

end

