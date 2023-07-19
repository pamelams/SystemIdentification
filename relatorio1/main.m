data = readmatrix('/MATLAB Drive/conjunto2.txt');
y_original = data(:, 1); % Vetor de resposta do sistema
t_original = data(:, 2); % Vetor de tempo

figure(1);
plot(t_original, y_original, 'Color', [0.5 0.5 0.5]); %plota os dados originais com ruído
grid on;
hold on; % Habilita o modo de sobreposição

%Suavização dos dados utilizando o método de média móvel
title('Resposta ao Degrau');
xlabel('Tempo');
ylabel('Saída');
dados_suavizados = smoothdata(data, 'lowess', 35);

y = dados_suavizados(:, 1); % Vetor de resposta do sistema
t = dados_suavizados(:, 2); % Vetor de tempo

%plot(t, y, 'k');
hold on; % Habilita o modo de sobreposição

%Plotar retas y0 e yf
yf = y(length(y))*ones(1, length(t));
y0 = y(1)*ones(1, length(t));
plot(t, yf, 'k-'); %plota a reta y(t) = yf
plot(t, y0, 'k-'); %plota a reta y(t) = y0

ZN = zieglerNichols(t,y);
HAG = hagglund(t,y);
SM1 = smithFirstOrder(t,y);
SK = sundaresanKrishnaswamy(t,y);
M = mollenkamp(t,y);
SM2 = smithSecondOrder(t,y);

%legend('Dados originais', 'Curva suavizada');
legend('Dados originais','', '', 'Ziegler-Nichols', 'Hagglung', 'Smith 1° ordem', 'Sundaresan-Krishnaswamy', 'Mollenkamp', 'Smith 2° ordem', 'Location', 'SouthEast');

%Legenda
%legend('Curva original', 'Ziegler-Nichols', 'Hagglung', 'Smith 1° ordem', 'Sundaresan-Krishnaswamy', 'Mollenkamp', 'Smith 2° ordem', 'Location', 'SouthEast');