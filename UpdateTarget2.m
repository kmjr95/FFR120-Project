function newTarget = UpdateTarget2(src,trg,visibility,fireMap,exitTargets,...
    dim1,dim2)

% Agent pos
r = src(1); % row
c = src(2); % col

% Visibility vectors
leftFire = fireMap(r,max(2,c-visibility):c-1);
rightFire = fireMap(r,c+1:min(dim2-1,c+visibility));
upFire = fireMap(max(2,r-visibility):r-1,c);
downFire = fireMap(r+1:min(dim1-1,r+visibility),c);

% Find hazards
leftHazard = leftFire & ones(1,length(leftFire));
rightHazard = rightFire & ones(1,length(rightFire));
upHazard = upFire & ones(length(upFire),1);
downHazard = downFire & ones(length(downFire),1);


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

