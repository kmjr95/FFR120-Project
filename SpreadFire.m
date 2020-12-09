function [indices] = SpreadFire(map,x0,n,m,R)
    % n = row size of map (75)
    % m = column size of map (100)
    % R = 1
    
    x = x0;
    indices = [];
    for r = 1:R
        for k = 1:numel(x)
            % Check east
            if mod(x(k)+1,n) ~= 1 && x(k)+1 <= n*m  && map(x(k)+1) == 0
                indices = [indices x(k)+1]; 
            end

            % Check west
            if mod(x(k)-1,n) ~= 0 && x(k)-1 > 0 && map(x(k)-1) == 0 
                indices = [indices x(k)-1];
            end    

            % Check south
            if x(k)+n <= n*m && map(x(k)+n) == 0 
                % Check south west
                if mod(x(k)+n-1,n) ~= 0 && x(k)+n-1 <= n*m && map(x(k)+n-1) == 0 
                    indices = [indices x(k)+n-1];
                end
                %Check south east
                if mod(x(k)+n+1,n) ~= 1 && x(k)+n+1 <= n*m && map(x(k)+n+1) == 0
                    indices = [indices x(k)+n+1];
                end
                indices = [indices x(k)+n];
            end    

            % Check north
            if  x(k)-n > 0 && map(x(k)-n) == 0
                % Check north west
                if mod(x(k)-n-1,n) ~= 0 && x(k)-n-1 > 0 && map(x(k)-n-1) == 0
                    indices = [indices x(k)-n-1];
                end
                % Check north east
                if mod(x(k)-n+1,n) ~= 1 && x(k)-n+1 > 0 && map(x(k)-n+1) == 0
                    indices = [indices x(k)-n+1];
                end
                indices = [indices x(k)-n];
            end
        end
    end
    [I,J] = ind2sub(n,unique(indices)');
    indices = [J I];
    
end