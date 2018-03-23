%% 2. Robust Linear Regression

%% Part D.
% Plot the linear regression line for the data and including the line derived from the squared error.

figure;
scatter(x,z,'y')
plot(x,zprednew, 'g')
grid on
title('Robust Regression on linreg+outlier with fminsearch');
hold on
scatter(x,z,'m')
plot(x,y,'k')
legend('Data', 'Prediction','Data')
hold off
% The new regession line is plotted in cyan, observe that it fits the data better then the black regression line. Since it is less sensitive to the outliers.