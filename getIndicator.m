function X = getIndicator(artist, listenedMap)
    users = listenedMap.keys;
    n = length(users);
    X = zeros(n, 1);
    for i = 1:n
        if ~isempty(find(listenedMap(users{i}) == artist))
            X(i) = 1;
        else
            X(i) = -1;
        end
    end
end