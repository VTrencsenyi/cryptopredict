# cryptopredict

The aim of this project is for me to gain some practical experience with ML techniques while researching and working on another topic I am interested in - and perhaps accurate predictions leading to $$$$.

The goal is to be able to predict prices within 1% accuracy, thus making the predicton useful for trading.

Implementation

Algorithms
gradient descent
backslash

Evaulation and optimization
In general I used 60% of the data for training, 20% for validation and 20% for testing.
Data is kept sorted -> we want to identify patterns, and these features do not bear indication of historic data when shuffled.
I use R2 and RMSE to evaluate how well the model does. In addition I also implemented a modification to RMSE, and I compute the root of the squared mean percentage errors. This expression is more indicative of how much we can trust our predictions, since we are primarily interested in percentage movements when trading. I also check the maximum precentage prediction error, for the same reason.

Generating features

We can easily get the following predictors from the downloaded data: Month, Day of Month, Price from previous day, Market Cap from previous day, Volume from previous day

We get the following metrics after using the simple feature set and the backslash opearator.

| Data set | Training | Validation |   Test  |
|  :---:   |    :-:   |     :-:    |    :-:  |
|    R2    |  0.99443 |   0.98144  | 0.99415 |
|   RMSE   |  1.3768 |   131.4077   | 392.9789 |
|   RMSPE  |  4.4798% |   2.9718%   | 3.458% |
|   Max % Err  |  25.7319% |   16.4722%   | 48.3099% |
