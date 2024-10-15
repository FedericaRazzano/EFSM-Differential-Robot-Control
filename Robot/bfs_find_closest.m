function path = bfs_find_closest(grid, startPos, startOrientation)

persistent vecchiaPosizione vecchiaRotazione
if(isempty(vecchiaPosizione))
    vecchiaPosizione = [69 69];
    vecchiaRotazione = 420;
end
    if (isequal(startPos, vecchiaPosizione) && isequal(startOrientation, vecchiaRotazione))
        %EXIT
        path = [];
        return;
    end   
    vecchiaPosizione = startPos;
    vecchiaRotazione = startOrientation;

    directions = containers.Map({0, 90, 180, 270}, {[0, 1]; [-1, 0]; [0, -1]; [1, 0]});

    queue = {{startPos, startOrientation, []}};
    visited = {{startPos, startOrientation}};
    
    while ~isempty(queue)
        front = queue{1};
        queue(1) = [];
        currentPos = front{1};
        currentOrientation = front{2};
        pathCode = front{3};
        
        % Try to advance
        movement = directions(currentOrientation);
        newPos = [currentPos(1) + movement(1), currentPos(2) + movement(2)];
        if newPos(1) >= 1 && newPos(1) <= size(grid, 1) && newPos(2) >= 1 && newPos(2) <= size(grid, 2)
            if grid(newPos(1), newPos(2)) == 1
                path = [pathCode, 1]; % Advance is 1
                return;
            elseif grid(newPos(1), newPos(2)) ~= 0 && grid(newPos(1), newPos(2)) ~= 3
                if all(cellfun(@(x) ~isequal(x{1}, newPos) || x{2} ~= currentOrientation, visited))
                    visited{end+1} = {newPos, currentOrientation};
                    queue{end+1} = {newPos, currentOrientation, [pathCode, 1]}; % 1 for advance
                end
            end
        end
        
        % Rotate left
        newOrientation = mod(currentOrientation + 90, 360);
        if all(cellfun(@(x) ~isequal(x{1}, currentPos) || x{2} ~= newOrientation, visited))
            visited{end+1} = {currentPos, newOrientation};
            queue{end+1} = {currentPos, newOrientation, [pathCode, 2]}; % 2 for rotate left
        end
        
        % Rotate right
        newOrientation = mod(currentOrientation - 90, 360);
        if all(cellfun(@(x) ~isequal(x{1}, currentPos) || x{2} ~= newOrientation, visited))
            visited{end+1} = {currentPos, newOrientation};
            queue{end+1} = {currentPos, newOrientation, [pathCode, 3]}; % 3 for rotate right
        end
    end
    
    path = [5 5 5]; % Return 5 if no path is found
    clear vecchiaRotazione;
    clear vecchiaPosizione;
end


