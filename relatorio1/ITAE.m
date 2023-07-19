function [itae] = ITAE(y_observed,y_predicted, t)
    error = abs(y_observed-y_predicted);
    itae = trapz(t .* error)
end