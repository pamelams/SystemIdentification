function [iae] = IAE(y_observed,y_predicted)
    error = abs(y_observed - y_predicted);
    iae = trapz(error)
end