function [eqm] = EQM(y_observed,y_predicted)
    eqm = mean((y_observed-y_predicted).^2) % Calcula o erro quadrático médio (MSE)
end