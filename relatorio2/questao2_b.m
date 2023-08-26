%Equação de diferenças
% Coeficientes da equação de diferenças
A_coeffs = [1.882, -0.9053];
B_coeffs = [0.005917, 0.01183, 0.005917];

% Parâmetros da simulação
num_samples = 100; % Número total de amostras

% Inicialização
x = ones(1, num_samples);
samples_v = 0:num_samples-1;
plot(samples_v, x, 'k');
hold on;
y = zeros(1, num_samples);
y(1) = B_coeffs(1) * x(1);
y(2) = A_coeffs(1) * y(2-1) + B_coeffs(1) * x(2) + B_coeffs(2) * x(2-1);

% Simulação da resposta
for k = 3:num_samples
    y(k) = A_coeffs(1) * y(k-1) + A_coeffs(2) * y(k-2) + B_coeffs(1) * x(k) + B_coeffs(2) * x(k-1) + B_coeffs(3) * x(k-2);
end

% Plot da resposta
stem(samples_v, y);
xlabel('Passo de simulação (k)');
ylabel('Saída y(t)');
title('Resposta do sistema à entrada degrau');
grid on;




