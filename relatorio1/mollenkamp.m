function [M] = mollenkamp(t,y)
    %Parâmetros do método Mollenkamp
    k = y(length(y))-y(1)
    y1 = y(1)+0.15*(y(length(y))-y(1));
    i1 = findY(y,y1,k)
    t1 = t(i1);
    y2 = y(1)+0.45*(y(length(y))-y(1));
    i2 = findY(y,y2,k)
    t2 = t(i2);
    y3 = y(1)+0.75*(y(length(y))-y(1));
    i3 = findY(y,y3,k)
    t3 = t(i3);  
    x = (t2-t1)/(t3-t1);
    zeta = (0.0805-5.547*((0.475-x)^2))/(x-0.356);
    if zeta < 1
        f2 = (0.708)*((2.811)^zeta);
    else
        f2 = (2.6*zeta)-0.60;
    end
    wn = f2/(t3-t1)
    f3 = (0.922)*((1.66)^zeta);
    teta = t2 -(f3/wn)
    if teta < 0
        disp('Teta deu negativo para o método mollenkamp!');
        teta = 0;
    end
    if zeta >= 1
        tau1 = (zeta+sqrt((zeta^2)-1))/wn;
        tau2 = (zeta-sqrt((zeta^2)-1))/wn;
    end
    tau1 = (zeta+sqrt((zeta^2)-1))/wn;
    tau2 = (zeta-sqrt((zeta^2)-1))/wn;

    %Gráfico da curva do método Mollenkamp
    s = tf('s');
    M = k*exp(-teta*s)/((tau2*s+1)*(tau1*s+1))
    title('Resposta ao Degrau');
    xlabel('Tempo');
    ylabel('Saída');
    grid on;
    [y_temp, t_temp] = step(M, t);
    y_temp = y_temp + y(1);
    EQM(y,y_temp);
    IAE(y,y_temp);
    ISE(y,y_temp);
    ITAE(y,y_temp, t);
    plot(t_temp, y_temp, 'm');
    hold on;
end