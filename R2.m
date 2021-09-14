function r2 = R2(y, y_hat)
%R2 computes the R squared metric for evaluation of the model.
r2 = 1 - sum((y - y_hat).^2)/sum((y - mean(y)).^2);
end


