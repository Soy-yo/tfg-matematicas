N = 1000;
n = 2;

% N puntos en (0, 1)^n
X = rand(N, n);

%a = rand - .5;
%b = rand;
a = .25;
b = .43;
line = @(x) a * x + b;

Y = zeros(N, 1);
Y(X(:, 2) > line(X(:, 1))) = 1;

% Separa datos de entrenamiento de datos de test
Ntrain = floor(N * .8);

Xtrain = X(1:Ntrain, :);
Ytrain = Y(1:Ntrain, :);
Xtest = X(Ntrain+1:N, :);
Ytest = Y(Ntrain+1:N, :);

% Función de activación y (hiper-)parámetros
f = @(u) 1 * (u > 0);
alpha = .8;
W = rand(1, n + 1);

% Entrenamiento
for i = 1:size(Xtrain, 1)
    x = [Xtrain(i, :) 1];
    t = Ytrain(i);
    y = f(dot(W, x));
    delta = t - y;
    W = W + alpha * delta * x;
end

% Test
hits = 0;
for i = 1:size(Xtest, 1)
    x = [Xtest(i, :) 1];
    t = Ytest(i);
    y = f(dot(W, x));
    if y == t
        hits = hits + 1;
    end
end

accuracy = hits / size(Xtest, 1);
fprintf("accuracy = %d\n", accuracy);

A = Xtest.* Ytest;
B = Xtest.* (1 - Ytest);

%scatter(Xtest(:, 1), Xtest(:, 2), 50, colors, '.');
scatter(A(:, 1), A(:, 2), 'red', '.');
hold on
scatter(B(:, 1), B(:, 2), 'blue', '.');

% Recta real
fplot(line, [0 1], 'black');

% Recta entrenada
trainedLine = @(x) (-W(1) * x - W(3)) / W(2);
fplot(trainedLine, [0 1], 'color', [.5 .5 .5]);

title('Distribución real de puntos');
legend('Clase A', 'Clase B', 'Recta real', 'Recta entrenada');

hold off