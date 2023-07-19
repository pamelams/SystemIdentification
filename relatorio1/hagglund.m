function [HAG] = hagglund(t,y)
    %Ponto de máxima inclinação da curva de reação
    df = diff(y) ./ diff(t);
    i = find(df==max(df(2:end)));
    
    %Reta tangente
    ti = t(i);  % Ponto t
    yi = y(i);  % Ponto y
    
    % Verificar os pontos vizinhos
    if i > 1 && i < length(t)
        t1 = t(i-1);  % Ponto x anterior
        y1 = y(i-1);  % Ponto y anterior
        t2 = t(i+1);  % Ponto x seguinte
        y2 = y(i+1);  % Ponto y seguinte
        
        % Estimar a reta tangente usando interpolação linear
        slope = (y2 - y1) / (t2 - t1);  % Coeficiente angular da reta tangente
    end
    %Parâmetros do método Hagglung
    t1 = (y(1)+(slope*ti)-yi)/slope;
    k = y(length(y))-y(1);
    y2 = y(1)+0.63*(y(length(y))-y(1));
    i2 = findY(y,y2,k);
    t2 = t(i2);
    teta = t1;
    if teta < 0
        disp('Teta deu negativo para o método hagglung!');
        teta = 0;
    end
    tau = t2-t1;
    
    %Gráfico da curva do método Hagglung
    s = tf('s');
    HAG = k*exp(-teta*s)/(tau*s + 1)
    title('Resposta ao Degrau');
    xlabel('Tempo');
    ylabel('Saída');
    grid on;
    [y_temp, t_temp] = step(HAG, t);
    y_temp = y_temp + y(1);
    EQM(y,y_temp);
    IAE(y,y_temp);
    ISE(y,y_temp);
    ITAE(y,y_temp, t);
    plot(t_temp, y_temp, 'r');
    hold on;

    %Plotar o gráfico da reta tangente
    t_tangent = linspace(t1-0.01, t2+0.05, 100);  % Intervalo de t desejado
    y_tangent = slope * (t_tangent - ti) + yi;  % Equação da reta tangente
    %plot(t_tangent, y_tangent, 'k--');
    hold on;
    %plot(ti, yi, 'ko', 'MarkerSize', 6, "MarkerFaceColor", 'k');
end