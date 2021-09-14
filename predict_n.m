function y_hat = predict_n(X, theta, sigma)
%PREDICT_N predict for normalized X.
m = size(X, 1);
sigma_matrix = ones(m, 1) * sigma;
y_hat = (X ./ sigma_matrix) * theta;

end

