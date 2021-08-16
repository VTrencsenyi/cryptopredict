%% load dataset 

%entire dataset
file = 'btc-usd-max.csv';

%small dataset for catching code bugs
%file = 'btc-usd-max - small.csv';

[X_train, X_val, X_test, y_train, y_val, y_test] = buildXY(file);
%% normalize features

X_train = normalize(X_train);
%X_val = normalize(X_val);
%X_test = normalize(X_test);

%% random initialize theta
% todo!
theta = rand(size(X_train,2), 1);
%theta = zeros(size(X_train,2), 1);
%% run gradient descent

%TODO: introduce poly features (^2, ^3)

%also, theta=X\y; ->solve linear equation.

%todo: optimize n_iters and alpha
n_iters = 10000;
alpha = 0.001;
[theta, J_history] = gradientDescent(X_train, y_train, theta, alpha, n_iters);

%% evaluate accuracy with validation set
predictions = X_val * theta;

%use R2, F + other metrics


%% test with test set