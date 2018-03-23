%% Question 1 
load('linreg.mat');

%% Part A 
% In order to prove the solution for the linear regression is given by w*
% we first have to set the variable X to create the comlumns of 1's so the
% matrix can be equivalent to w.
X = [ones(length(x),1) x]

% The variable w is the model for the linear regression which is define
% here below in coding
w = ((X.')* X)^(-1)*(X.')*t

%% Part B
% We would plot the data with our linear regression model shown 
% Plot the linear regression, the variable y is created so that the line
% can appear on the graph. The title of the graph and the labels also appears below

y = (w.')*(X.')
figure;
scatter(x,t,'m')
hold on
plot(x,y)
legend('Data Prediction')
grid on 
title('Regression Line') 
xlabel('x')
ylabel('t')


%% Part C 
% This part would show how to estimate the variance of the difference
% between the prediction and actual targets.
% The N and D variables are to hold
[N,D] = size(x) 

% This line of code is for the variance 
% The estimate of the variance makes sense because the result is from the
% linear regression equation, which includes the predictions that gives us
% the estimate.

var = (1/12) * sum((t-(y.')).^2) 
