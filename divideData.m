function [X_train, X_val, X_test, y_train, y_val, y_test] = divideData(X, y, ratio)
%DIVIDEDATA divide dataset into training, validation and test sets
%"ratio" defines how much of the data will be used as training set (0 to 1)

m = size(X,1);

ixTrain = round(m * ratio, 0); %ix of last item of training set
ixVal = ixTrain + (m - ixTrain)/2; %ix of last item of validation set

X_train = X(1:ixTrain,:);
X_val = X(ixTrain+1:ixVal,:);
X_test = X(ixVal+1:end,:);

y_train = y(1:ixTrain,:);
y_val = y(ixTrain+1:ixVal,:);
y_test = y(ixVal+1:end,:);

end

