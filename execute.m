%% data preparation step
file = 'btc-usd-max.csv';
ratio = 0.6;
[X_train, X_val, X_test, y_train, y_val, y_test, mu, sigma] ...
    = runPreprocessing(file, ratio);
%% model optimization
%mdl = fitlm(X_train, y_train)
%mdl = stepwiselm(X_train, y_train)

%% learning step
%backslash operator
theta = X_train\y_train;

%gradient descent 
%theta2 = [1, X_train(:,8:9)]\y_train;

%normal equation 
%theta = inv((transpose(X)*X))*transpose(X)*y
%% predict values
%y_hatTrain = predict_n(X_train, theta, sigma);
[y_hatTrain,y_hatVal,y_hatTest] = predictSets(theta,X_train,X_val,X_test);
%% Get metrics
[r2_train,rmse_train,rmspe_train,max_train, ...
          r2_val,rmse_val,rmspe_val,max_val, ...
          r2_test, rmse_test, rmspe_test, max_test] ...
          = calcMetrics(y_train, y_hatTrain, ...
                                   y_val, y_hatVal, y_test, y_hatTest);
%% visualise
tiledlayout(1,3)
nexttile
plot(y_train)
hold on
plot(y_hatTrain)
hold on
text(100,14000,['R2: ', num2str(r2_train)])
text(100,13000,['RMSE: ', num2str(rmse_train)])
text(100,12000,['RMSPE: ', num2str(rmspe_train)])
text(100,11000,['Max % Err: ', num2str(max_train)])
title('Training set')
nexttile
plot(y_val)
hold on
plot(y_hatVal)
hold on
text(20,10000,['R2: ', num2str(r2_val)])
text(20,9500,['RMSE: ', num2str(rmse_val)])
text(20,9000,['RMSPE: ', num2str(rmspe_val)])
text(20,8500,['Max % Err: ', num2str(max_val)])
title('Validation set')
nexttile
plot(y_test)
hold on
plot(y_hatTest)
title('Test set')
text(20,50000,['R2: ', num2str(r2_test)])
text(20,45000,['RMSE: ', num2str(rmse_test)])
text(20,40000,['RMSPE: ', num2str(rmspe_test)])
text(20,35000,['Max % Err: ', num2str(max_test)])