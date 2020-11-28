function plotResults(Y)

    subplot(3, 1, 1)
    
    imagesc(Y')
    colormap(flipud(colormap('gray')))
    xlabel('neuron'); ylabel('stimulus')
    
    subplot(3, 1, 2)
    bar(sum(Y)); ylim([0 10])
    xlabel('stimulus'); ylabel('# nuerons responding')
    title(['# lost stimuli = ' num2str(sum(sum(Y, 1) == 0))])

    subplot(3, 1, 3)
    bar(sum(Y, 2)); ylim([0 8])
    xlabel('neuron'); ylabel('# stimulus exciting neuron')
    title(['# selective neurons = ' num2str(sum(sum(Y, 2) == 1))])
