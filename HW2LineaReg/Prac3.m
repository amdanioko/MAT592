i = 9 %picture of the person
%% Calculate mean
A = Data;
M = mean(A,2);
Y = A - repmat(M,1,400); % Y has mean approx 0
y = reshape(A(:,i),112,92);
imshow(y)
%% Compute covariance
C = cov(Y');
 
%% Compute SVD covariance matrix C
k = 100;
[U S V] = svds(C,k);
 
% Transform to lower dim
 
w = V*(V'*(A(:,i)-M))+M; %w is a 10304 dimensional column vector
 
W = reshape(w,[112,92]); % can reshape w to 112 by 92
 
imshow(W)