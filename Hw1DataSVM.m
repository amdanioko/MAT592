% AMINATA DANIOKO  AMAT 592  HW 1

% Data Description Part 1 

load tremor.mat

% Question 1:Find the indices of observations in class 0
figure;
I = find (ttr == 0);

% Plot these points in blue; the third argument (10) controls the size 
scatter(Xtr(I,1), Xtr(I,2), 10, 'b');  
hold on; 

% Find the indices of observations in class 1 
J = find (ttr == 1);

% Plot the points in red
scatter(Xtr(J,1), Xtr(J,2),'filled','d', 'r');
hold on; 
title('Data Description');

% Question 2 Mean, Standard deviation and covariance
% Find the mean of the feature as a whole and for each of the classes
meanXtrc11 = mean(Xtr(I,1));
meanXtrc12 = mean(Xtr(I,2));
meanXtrc21 = mean(Xtr(J,1));
meanXtrc22 = mean(Xtr(J,2));
meanXtrc1  = mean(Xtr(:,1));
meanXtrc2  = mean(Xtr(:,2));

% Find the standard deviation of the feature as a whole and for each class

stdXtrc11 = std(Xtr(I,1));
stdXtrc12 = std(Xtr(I,2));
stdXtrc21 = std(Xtr(J,1));
stdXtrc22 = std(Xtr(J,2));
stdXtrc1  = std(Xtr(:,1));
stdXtrc2  = std(Xtr(:,2));

% Find the covariance of the feature and each class 

covXtr = cov(Xtr(:,1),Xtr(:,2));

% Find the correlation between variables x1 and x2 with all the samples
% togther. 

corrXtr   = corr(Xtr(:,1), Xtr(:,2));
corrXtrc1 = corr(Xtr(:,1));
corrXtrc2 = corr(Xtr(:,2));


% Question 3 
% Standardizing the data by mean-centering it and dividing by the standard
% deviation of the relevant variable.

% Getting the mean of the Xtr classifier 
xbar = mean(Xtr);  

% Standardization
[N, D] = size(Xtr);
Y = Xtr - repmat(xbar, N, 1);  % mean-centering the mean
S = cov(Xtr);                  % covariance 
temp = diag(S);
D = diag(temp);
Z = Y*D ^(-1/2);
figure;                       % Plot the standardised data and with mean and covariace matrix
scatter(Z(:,1),Z(:,2),10,'m','+');
hold on;
title('Standardised data');
