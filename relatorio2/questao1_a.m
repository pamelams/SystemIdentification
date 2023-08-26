% Sistema contínuo
s = tf('s');
G1 = (0.5*s^2 + 2*s + 2)/(s^3 + 3*s^2 + 4*s + 2)
title('Resposta ao Degrau');
xlabel('Tempo');
ylabel('Saída');
grid on;
[y_temp, t_temp] = step(G1);
plot(t_temp, y_temp, 'r');
hold on;
plot(t_temp, ones(size(t_temp)), 'k');
p = pole(G1)    %pólos de G1

% Sistema discretizado usando a transformação Z (Tustin)
syms z;
Ts = 0.1;  % Intervalo de amostragem
sys_disc = c2d(G1, Ts, 'tustin')

% Vetor de tempo discreto
duration = 4;           % Duração da simulação em segundos
Ts = 0.1;
Fs = 1/Ts;               % Frequência de amostragem em Hz
num_samples = duration * Fs; % Número total de amostras
time = 0:Ts:duration;

% Calcule a resposta ao degrau
step_response = step(sys_disc, time);
% Plote a resposta ao degrau
plot(time, step_response, 'b');
legend(["Sistema contínuo", "","Sistema discreto"]);
legend("Position", [0.56902,0.1594,0.30317,0.13624]);

% Plot da resposta
xlabel('Tempo (s)');
ylabel('Saída y(t)');
title('Resposta do sistema à entrada degrau');
grid on;




