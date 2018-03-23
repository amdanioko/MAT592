%% 2. Robust linear regression

%% Part C.

% In this section I used the fminsearch to find the w by minimizing E1. The loop is one way of creating the minimum 
% error E1 by using ww0 and ww1 from the previous results. 
% E1Wa and E1min is define to find the minimum between w0 and w1.
% After computing the minimum our results change. 

E1Wmin = 1000;
for ww0 = [-3:0.01:4];
    for ww1 = [-3:0.01:4];
        E1Wa = sum(abs(z'-[ww0,ww1]*X'));
        if E1Wa < E1Wmin;
            wstar = [ww0,ww1];
            E1Wmin = E1Wa;
        end
    end
end
zpreda = wstar*X'


figure
plot(x,zpreda)
hold on
plot(x,z,'o')
grid on
legend('Data','Predict')
title('Robust Linear Regression on linreg+outlier')

% This code below is the alternative method that is used to find the
% minimun by using the subroutine fminsearch function.

E1w = @(we1) sum(abs(we1(1)+we1(2)*x-z))
[we1,~] = fminsearch(E1w,[w(1),w(2)])
zprednew = we1(1) +we1(2)*x

% The scatter plot will display the image of the linear regression and the
% outlier below.
