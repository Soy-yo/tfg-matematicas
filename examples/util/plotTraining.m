function plotTraining(info, tickDist)
    figure

    subplot(2, 1, 1);

    x = 1:tickDist:length(info.TrainingAccuracy);
    trainAcc = info.TrainingAccuracy(x) / 100;
    plot(x, trainAcc);
    hold on

    if isfield(info, 'ValidationAccuracy')
        x = find(~isnan(info.ValidationAccuracy));
        valAcc = info.ValidationAccuracy(x) / 100;
        plot(x, valAcc);
        legend({'Entrenamiento', 'Validación'}, 'Location', 'southeast');
    else
        legend('Entrenamiento', 'Location', 'southeast')
    end

    title('Precisión (accuracy)');
    yticks(0:.2:1);
    hold off

    subplot(2, 1, 2);

    x = 1:tickDist:length(info.TrainingLoss);
    trainLoss = info.TrainingLoss(x);
    plot(x, trainLoss);
    hold on

    if isfield(info, 'ValidationLoss')
        x = find(~isnan(info.ValidationLoss));
        valLoss = info.ValidationLoss(x);
        plot(x, valLoss);
        legend({'Entrenamiento', 'Validación'});
    else
        legend('Entrenamiento');
    end

    title('Error (loss)');
    hold off
end

