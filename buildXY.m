function [X_train, X_val, X_test, Y_train, Y_val, Y_test] = buildXY(file)

    %file = 'btc-usd-max.csv';
    %file = 'btc-usd-max - small.csv';
    table = readtable(file, 'Delimiter', {',', '-', ' '});
    
    
    %generate features from table columns, and convert to matrix
    year = table2array(table(:, 1));
    month = table2array(table(:, 2));
    day = table2array(table(:, 3));
    price = table2array(table(:, 6));
    marketcap = table2array(table(:, 7));
    volume = table2array(table(:, 8));
    
    %generate new features
    %%%asd
    %%%asd
    
    %calc gradients
    dailyPriceChangeVal = diff(price);
    
    %first entry does not have gradient ->ignore them
    dailyPriceChangePerc = ...
       (dailyPriceChangeVal ./ (price(2:end) - dailyPriceChangeVal)) * 100;
       
    %assign data matrix:
    
    %first 2 entries dont have prev. day gradient, neither does 1st diff
    %values -->we ignore them
    data = [year(3:end), month(3:end), day(3:end), marketcap(3:end), ...
            volume(3:end), dailyPriceChangeVal(1:end-1), ...
            dailyPriceChangePerc(1:end-1), price(3:end)];
    
    %shuffle rows
    data = data(randperm(size(data, 1)), :);
    
    %assign training set, validation set, test set
    m = size(data,1);
    X = data(:,1:end-1); %feature columns
    Y = data(:,end); %last column is the price
    
    ixTrain = round(m * 0.6, 0); %ix of last item of training set
    ixVal = ixTrain + (m - ixTrain)/2; %ix of last item of validation set
    
    X_train = X(1:ixTrain,:);
    X_val = X(ixTrain+1:ixVal,:);
    X_test = X(ixVal+1:end,:);
    
    Y_train = X(1:ixTrain,:);
    Y_val = X(ixTrain+1:ixVal,:);
    Y_test = X(ixVal+1:end,:);
    
end
