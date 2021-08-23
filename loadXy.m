function [X, X_shuffled, y, y_shuffled] = loadXy(file)
%LOADXY load X and y data from  coingecko CSV file
% Import data, gather existing and generate new features. Outputs original
% and shuffled data.

table = readtable(file, 'Delimiter', {',', '-', ' '});

month = table2array(table(:, 2));
day = table2array(table(:, 3));
price = table2array(table(:, 6));
marketcap = table2array(table(:, 7));
volume = table2array(table(:, 8));

lastPrice = [0; price];

dailyPriceChangeVal = diff(price);
dailyPriceChangePerc = ...
   (dailyPriceChangeVal ./ (price(2:end) - dailyPriceChangeVal)) * 100;

X = [month(3:end), day(3:end), marketcap(3:end), ...
        volume(3:end), lastPrice(3:end-1), dailyPriceChangeVal(1:end-1),...
        dailyPriceChangePerc(1:end-1)];
y = price(3:end);

%get shuffled data
data = [X y];
shuffle = data(randperm(size(data, 1)), :);
X_shuffled = shuffle(:, 1:end-1);
y_shuffled = shuffle(:, end);
end

