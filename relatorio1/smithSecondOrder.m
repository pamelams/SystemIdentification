function [SM2] = smithSecondOrder(t,y)
    %Parâmetros do método de Smith 2° ordem
    k = y(length(y))-y(1);
    teta = input('Valor de teta: ');
    y1 = y(1)+0.20*(y(length(y))-y(1));
    i1 = findY(y,y1,k);
    t1 = t(i1)-teta;
    y2 = y(1)+0.60*(y(length(y))-y(1));
    i2 = findY(y,y2,k);
    t2 = t(i2)-teta;
    disp(['t60: ' num2str(t2)]);
    disp(['t20/t60: ' num2str(t1/t2)]);
    %zeta = 1.35;
    zeta = input('Valor de zeta: ');
    %tau = 0.0425;
    tau = input('Valor de tau: ');
    if zeta > 1
        tau1 = tau*zeta+(tau*sqrt((tau^2)-1));
        tau2 = tau*zeta-(tau*sqrt((tau^2)-1));
    end
    
    %Gráfico da curva do método Smith de 2° ordem
    s = tf('s');
    if zeta > 1
        SM2 = k*exp(-teta*s)/((tau1*s+1)*(tau2*s+1))
    else
        SM2 = k*exp(-teta*s)/((tau^2)*(s^2)+(2*zeta*tau*s)+1)
    end
    
    title('Resposta ao Degrau');
    xlabel('Tempo');
    ylabel('Saída');
    grid on;
    [y_temp, t_temp] = step(SM2, t);
    y_temp = y_temp + y(1);
    EQM(y,y_temp);
    IAE(y,y_temp);
    ISE(y,y_temp);
    ITAE(y,y_temp, t);
    plot(t_temp, y_temp, 'g');
    hold on;
end