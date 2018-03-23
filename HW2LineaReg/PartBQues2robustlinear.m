% Question 2 
% Part B

load('linregoutlier.mat')

figure;
scatter(x,z);
scatter(x,z);
hold on 
X = [ones(size(x)) x];
% The variable z is used to find the linear regression line for the data
% set using E2
w = ((X.')*X)^(-1) * (X.') *z; 

y = (w.')*(X.');
zpred = w(1,1) + w(2,1) * x;
plot(x,zpred,'k');
title('Regression Line Outlier');
% The graph in this data is affected by a single outlier, this occurred
% because we calculated the predicted values by minimizing E2. 