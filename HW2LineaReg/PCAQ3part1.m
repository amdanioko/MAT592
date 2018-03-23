%% Question 3: 
%% Part 1 

load('att.mat');
% Reshape the column vector in Data to a matrix size of 112x92 using command reshape. We determine the size of the data and below the size of the original data we reshape the image size to 112x92.
% The i variable will be the picture of the person, M would would be the name for our original Data, mu is the mean of the original Data set q has mean approximate 0.
i  = 6
M  = Data; 
mu = mean(M,2); 
q  = M - repmat(mu,1,400); 
y  = reshape(Data(:,i), 112, 92); 
figure
imshow(y)
C = cov(q'); 
% Reshpaing the image by chaning the pixels to 112x92 imshow would display the image C would compute the covariance. Then I develop the PCA and use it to reduce the dimension and recover the images from the EigenFaces. Computed SVD covariance matric C


%% Part B 
% This code below is showing the effect of the PCA by comparing the original image against the recoved images by showing varities of the same image with different effects. The eigenfaces are defined by the princpal components k and the eigenvectors below.
% Obtain the eigenvalues and eignenvector of the matrix, the eigs of C,k will return a diagonal matrix of C and k largest magnitude eigenvalues.

principalcomponent = [20 50 100 200];

for k = principalcomponent;
[U S V] = svds(C,k);
  

% Transform to lower dimension. Reconimage is a 10304 dimensional column vector.
% The code reconimage will select the k leading eigenvectors of Vk
Reconimage = V *(V'*(M(:,i)- mu))+ mu;

% This code would used to reshape the column vector in order to display the image with the code imshow.
r = reshape(Reconimage,[112,92]);
figure
imshow(r)
end 

% The images that displays below are the results of the original image against the recovered images from eigenfaces across different numbers of principal components k. As the prinicipal component code is set between from 20,50,100,and 200 and k = 200. 
% The following images show that experimental results shows that as the number of training images increases, the effeciecy of the system begins to increase. 



