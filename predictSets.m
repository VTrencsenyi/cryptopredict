function [y_hatTrain,y_hatVal,y_hatTest] = predictSets(theta,X_train,X_val,X_test)
%PREDICTSETS predict and output the response values for the training, cross
%validation and test sets.
y_hatTrain = predict(X_train, theta);
y_hatVal = predict(X_val, theta);
y_hatTest = predict(X_test, theta);
end

