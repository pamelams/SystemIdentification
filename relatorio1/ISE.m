function [ise] = ISE(y_observed,y_predicted)
    error = abs(y_observed-y_predicted);
    ise = trapz(error.^2)
end