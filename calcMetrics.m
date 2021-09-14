function [r2_train,rmse_train,rmspe_train,max_train, ...
          r2_val,rmse_val,rmspe_val,max_val, ...
          r2_test, rmse_test, rmspe_test, max_test] ...
          = calcMetrics(y_train, y_hatTrain, ...
                                   y_val, y_hatVal, y_test, y_hatTest)
%CALCMETRICS computes statistics about the prediction accuracy 
%   Returns R2, RMSE, RMSPE and the max RMSPE metrics for the trainig,
%   validation and test sets seperately
r2_train = R2(y_train, y_hatTrain);
rmse_train = RMSE(y_train, y_hatTrain);
[rmspe_train, max_train] = RMSPE(y_train, y_hatTrain);
r2_val = R2(y_val, y_hatVal);
rmse_val = RMSE(y_val, y_hatVal);
[rmspe_val, max_val] = RMSPE(y_val, y_hatVal);
r2_test = R2(y_test, y_hatTest);
rmse_test = RMSE(y_test, y_hatTest);
[rmspe_test, max_test] = RMSPE(y_test, y_hatTest);
end

