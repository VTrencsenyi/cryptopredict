function y_hat = predict(X, theta, sigma)

m = size(X, 1);
sigma_matrix = ones(m, 1) * sigma;
y_hat = (X ./ sigma_matrix) * theta;

end

