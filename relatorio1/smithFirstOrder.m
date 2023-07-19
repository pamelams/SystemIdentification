function [SM1] = smithFirstOrder(t,y)
    %Parâmetros do método Smith 1° ordem
    k = y(length(y))-y(1);
    y1 = y(1)+0.283*(y(length(y))-y(1));
    i1 = findY(y,y1,k); 
    t1 = t(i1);
    y2 = y(1)+0.632*(y(length(y))-y(1));
    i2 = findY(y,y2,k); 
    t2 = t(i2);
    tau = 1.5*(t2-t1);
    teta = t2-tau;
    
    %Gráfico da curva do método Smith 1° ordem
    s = tf('s');
    SM1 = k*exp(-teta*s)/(tau*s + 1)
    title('Resposta ao Degrau');
    xlabel('Tempo');
    ylabel('Saída');
    grid on;
    [y_temp, t_temp] = step(SM1, t);
    y_temp = y_temp + y(1);
    EQM(y,y_temp);
    IAE(y,y_temp);
    ISE(y,y_temp);
    ITAE(y,y_temp, t);
    plot(t_temp, y_temp, 'Color', [0.3010 0.7450 0.9330]);
    hold on;
end