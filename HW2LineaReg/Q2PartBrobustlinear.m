%% Question 2 
%% Part B

load('linregoutlier.mat')

X = [ones(length(x),1) x];
% The variable z is used to find the linear regression line for the data set using E2
w = ((X.')*X)^(-1) * (X.') *z; 
y = (w.')*(X.');

% The code below displays the figure of the regression line outlier 
figure;
scatter(x,z);
hold on 
plot(x,y);
xlabel('x')
ylabel('z')
legend('Data','Predict')
grid on
zpred = w(1,1) + w(2,1) * x;
plot(x,zpred,'k')
title('Regression Line Outlier');

% The graph in this data is affected by a single outlier, this occurred
% because we calculated the predicted values by minimizing E2. 