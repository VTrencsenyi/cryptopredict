# cryptopredict

The aim of this project is to experiment with ML techniques while researching and working on another topic I am interested in - and perhaps to generate accurate predictions leading to $$$$. 

Implementation

Optimization
In general I used 60% of the data for training, 20% for validation and 20% for testing.
Data is kept sorted -> we want to identify patterns, and these features do not bear indication of historic data when shuffled.
I use R2 and RMSE to evaluate how well the model does. In addition I also implemented a modification to RMSE, and I compute the root of the squared mean percentage errors. This expression is more indicative of how much we can trust our predictions, since we are primarily interested in percentage movements when trading. I also check the maximum precentage prediction error, for the same reason.

Generating features

We can easily get the following predictors from the downloaded data: Month, Day of Month, Price from previous day, Market Cap from previous day, Volume from previous day
Note: the "price" corresponds to the closing price at that day.
We get the following metrics after using the simple feature set and the backslash opearator.

| Data / Metric | Training | Validation |   Test  |
|  :---:   |    :-:   |     :-:    |    :-:  |
|    R2    |  0.99443 |   0.98144  | 0.99415 |
|   RMSE   |  1.3768 |   131.4077   | 392.9789 |
|   RMSPE  |  4.4798% |   2.9718%   | 3.458% |
|   Max % Err  |  25.7319% |   16.4722%   | 48.3099% |

I want to ideally keep the RMSPE below 1% and the maximum error below 3%, to be able to state the predictions are useful.

In the next step I calculated the following features from the previous data: day of year, day of week. I also found that one of the most widely used "indicators" is the Simple Moving Average, more specifically the 5, 8, 13 period SMA is used for day trading.

After including these features, the metrics were the following:
| Data / Metric | Training | Validation |   Test  |
|  :---:   |    :-:   |     :-:    |    :-:  |
|    R2    |  0.99723 |   0.99013 | 0.99721 |
|   RMSE   |  0.064662|   112.8766   | 392.9789 |
|   RMSPE  |  2.4164% |   2.2019%   | 2.5706% |
|   Max % Err  |  23.5742% |   12.6825%   | 22.997% |

A human can only digest a limited amount of information, hence traders generally use a few indicators only, that they think are the most useful for their pupose. However we do not have that limitation. I generated every moving average from 2 to 50 periods and included them in our feature set.

| Data / Metric | Training | Validation |   Test  |
|  :---:   |    :-:   |     :-:    |    :-:  |
|    R2    | 1 | 1 | 1 |
|   RMSE   | 4.9742e-13 | 5.5038e-12 | 0.9876 |
|   RMSPE  |  7.7026e-14% | 7.4532e-14% | 0.0021879 |
|   Max % Err  |  2.4563e-13% | 2.1449e-13% | 1.2318% |

As we can see our prediction errors in the training and validation sets are nearly insignificant. Even with last prediction being an outlier and heavily affecting the scores, our average percentage error is still far below one percent.

We can use Matlab's stepwiselm function to narrow down our model to the most important features. The results is the following:
y ~ 1 + x8 + x9

where x8 and x9 corresponds to SMA2 and SMA3.

After removing the other features from the model, we get the following results:
| Data / Metric | Training | Validation |   Test  |
|  :---:   |    :-:   |     :-:    |    :-:  |
|    R2    | 1 | 1 | 1 |
|   RMSE   | 1.0333e-12 | 3.0936e-12 | 0.9876 |
|   RMSPE  |  4.3732e-14% | 4.5599e-14% | 0.0021879 |
|   Max % Err  |  1.1214e-13% | 1.0094e-13% | 1.2318% |

As we can see the results are very similar, the metrics on the Test Set show the exact same performance.

The execution time for the learning step is 0.001253 seconds with the large feature set, while with the optimised feature set it is down to 0.000079 seconds.

TODO:
-include some graphs, update results with fresh data
-add evaulation
-add future ideas
