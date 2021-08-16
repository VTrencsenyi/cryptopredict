function [X_train, X_val, X_test, y_train, y_val, y_test] = buildXY(file)

%file = 'btc-usd-max.csv';
%file = 'btc-usd-max - small.csv';
table = readtable(file, 'Delimiter', {',', '-', ' '});


%generate features from table columns, and convert to matrix
month = table2array(table(:, 2));
day = table2array(table(:, 3));
price = table2array(table(:, 6));
marketcap = table2array(table(:, 7));
volume = table2array(table(:, 8));

%calc gradients
dailyPriceChangeVal = diff(price);

%first entry does not have gradient ->ignore them
dailyPriceChangePerc = ...
   (dailyPriceChangeVal ./ (price(2:end) - dailyPriceChangeVal)) * 100;

%generate polynomial features
month2 = month.^2;
day2 = day.^2;
marketcap2 = marketcap.^2;
volume2 = volume.^2;
dailyPriceChangeVal2 = dailyPriceChangeVal.^2;
dailyPriceChangePerc2 = dailyPriceChangePerc.^2;


%assign data matrix:

%first 2 entries dont have prev. day gradient, neither does 1st diff
%values -->we ignore them

data = [month(3:end), month2(3:end), ...
        day(3:end), day2(3:end), ...
        marketcap(3:end), marketcap2(3:end), ...
        volume(3:end), volume2(3:end), ...
        dailyPriceChangeVal(1:end-1), dailyPriceChangeVal2(1:end-1), ...
        dailyPriceChangePerc(1:end-1), dailyPriceChangePerc2(1:end-1)];

%linear features only:
% data = [month(3:end), day(3:end), marketcap(3:end), ...
%         volume(3:end), dailyPriceChangeVal(1:end-1), ...
%         dailyPriceChangePerc(1:end-1), price(3:end)];

%shuffle rows
data = data(randperm(size(data, 1)), :);

%assign training set, validation set, test set
m = size(data,1);
X = data(:,1:end-1); %feature columns
y = data(:,end); %last column is the price

ixTrain = round(m * 0.6, 0); %ix of last item of training set
ixVal = ixTrain + (m - ixTrain)/2; %ix of last item of validation set

X_train = X(1:ixTrain,:);
X_val = X(ixTrain+1:ixVal,:);
X_test = X(ixVal+1:end,:);

y_train = y(1:ixTrain,:);
y_val = y(ixTrain+1:ixVal,:);
y_test = y(ixVal+1:end,:);
    
end
