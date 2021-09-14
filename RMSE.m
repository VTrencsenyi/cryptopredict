function error = RMSE(y, y_hat)
%RMSE computes the root mean squared error betweev the observation vector
%y and prediction vector y_hat.

error = sqrt(mean(y - y_hat).^2);

end

