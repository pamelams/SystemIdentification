function [SK] = sundaresanKrishnaswamy(t,y)
    %Parâmetros do método Sundaresan-Krishnaswamy
    k = y(length(y))-y(1);
    y1 = y(1)+0.353*(y(length(y))-y(1));
    i1 = findY(y,y1,k);
    t1 = t(i1);
    y2 = y(1)+0.853*(y(length(y))-y(1));
    i2 = findY(y,y2,k);
    t2 = t(i2);
    tau = 0.67*(t2-t1);
    teta = (1.3*t1)-(0.29*t2);
    
    %Gráfico da curva do método Sundaresan-Krishnaswamy
    s = tf('s');
    SK = k*exp(-teta*s)/(tau*s + 1)
    title('Resposta ao Degrau');
    xlabel('Tempo');
    ylabel('Saída');
    grid on;
    [y_temp, t_temp] = step(SK, t);
    y_temp = y_temp + y(1);
    EQM(y,y_temp);
    IAE(y,y_temp);
    ISE(y,y_temp);
    ITAE(y,y_temp, t);
    plot(t_temp, y_temp, 'Color', [0.7 0 1]);
    hold on;
end