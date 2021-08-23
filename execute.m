%% load dataset 

%entire dataset
file = 'btc-usd-max.csv';

%small dataset for catching code bugs
%file = 'btc-usd-max - small.csv';

[X, X_shuffled, y, y_shuffled] = loadXy(file);

%generate training set, validation set, test set
% save unshuffled data for plotting, debugging and use shuffled data for
% training
ratio = 0.6;
[X_train, X_val, X_test, y_train, y_val, y_test] = divideData(X, y, ratio);
[X_trainShuf, X_valShuf, X_testShuf, y_trainShuf, y_valShuf, y_testShuf]...
    = divideData(X_shuffled, y_shuffled, ratio);

%% normalize features

[X_trainShuf, mu, sigma] = normalize(X_trainShuf);

%% solve equation
theta = X_trainShuf\y_trainShuf;
%% predict

y_hat = predict(X_test, theta, sigma);

%% Gradient descent
%theta = rand(size(X_train,2), 1);
theta = zeros(size(X_train,2), 1);

%TODO I am using present day data, which is not available for real
%predictions. Use last day data + gradients etc.

%% run gradient descent

%todo: optimize n_iters and alpha
n_iters = 1000;
alpha = 0.5;
[theta, J_history] = gradientDescent(X_train, y_train, theta, alpha, n_iters);
%plot(J_history);

%% evaluate accuracy with validation set
predictions = X_val * theta;
%plot(computeCost(X_val, y_val, theta));


%use R2, F + other metrics


%% test with test set