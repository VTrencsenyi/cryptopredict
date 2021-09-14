function [X_train, X_val, X_test, y_train,y_val, y_test, mu, sigma] = ...
    runPreprocessing(file, ratio)
%RUNPREPROCESSING Run the data preprocessing steps, create everything for
%the learning algorithms
%   Load data, engineer features, normalise features, assign train,
%   validation and test sets.

table = readtable(file, 'Delimiter', {',', '-', ' '});
data = [table2array(table(:, 1)), table2array(table(:, 2)), ...
        table2array(table(:, 3)), table2array(table(:, 6)), ...
        table2array(table(:, 7)), table2array(table(:, 8))];
[X, y] = generateFeatures(data);

[X_train, X_val, X_test, y_train, y_val, y_test] = divideData(X, y, ratio);

%placeholder
[X_trainn, mu, sigma] = normalize(X_train);

end

