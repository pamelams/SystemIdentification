function [i] = findY(y,yi,k)
    if k > 0
        i = find(y >= yi, 1, 'first');
    else
        i = find(y <= yi, 1, 'first');
    end
end