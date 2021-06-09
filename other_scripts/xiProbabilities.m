ns = 1:50;
bs = [2 1.5 1.001];
x = @(n,b) sqrt(n./ (4 / 5 + b^4));

figure;
hold on
for b = bs
    X = x(ns, b);
    Y = normcdf(X);
    plot(ns, Y);
end

plot([ns(1) ns(end)], [1, 1], ':k');

ylabel('P(\xi>0)');
xlabel('n');
legend({sprintf('b=%.3f', bs(1)), ...
    sprintf('b=%.3f', bs(2)), sprintf('b=%.3f', bs(3))}, ...
    'Location', 'southeast');