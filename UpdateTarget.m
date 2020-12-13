function newTarget = UpdateTarget(src,trg,visibility,fireMap,exitTargets,...
    dim1,dim2)

% Agent pos
r = src(1); % row
c = src(2); % col

% Visibility vectors
leftHazard = fireMap(r,max(2,c-visibility):c-1);
rightHazard = fireMap(r,c+1:min(dim2-1,c+visibility));
upHazard = fireMap(max(2,r-visibility):r-1,c);
downHazard = fireMap(r+1:min(dim1-1,r+visibility),c);


if any(leftHazard,2)
    newTarget = exitTargets.right(randi(size(exitTargets.right,1)),:); 
elseif any(rightHazard,2)
    newTarget = exitTargets.left(randi(size(exitTargets.left,1)),:); 
elseif any(upHazard,1)
    newTarget = exitTargets.down(randi(size(exitTargets.down,1)),:); 
elseif any(downHazard,1)
    newTarget = exitTargets.top(randi(size(exitTargets.top,1)),:); 
else
    newTarget = trg;
end

end

