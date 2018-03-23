% Question 4 

% Generate 1000 uniformly distributed samples from a Normal/Gaussian density
% with mean 0 and variance 1, xn ~ N(0,1) using the randn function.

% Generated a random vector, Gaussian random numbers and draw a histogram
% a = randn(1,5000)

% Then we divide the number of counts t by the total number of times the
% bin size 5000*0.2. This will guarantee the total area of the boxes over
% the whole line is normalized to 1.


% The hist divides the interval [min(x), max(x)] into the binsize code and
% yields the output[t,u] where t is the vector whose elements are numbers
% of samples in each bin, and u is a vector whose elements are the centers
% of the bins.
a = randn(1,5000); 
binsize = [5,10,20,30,50];
for j   = binsize

[t,u]   = hist(a,j);
figure; 
hold on
bar(u,t/(5000*.2));  %Plot the histogram using the bar function This code shows displays a bar graph in order to examine the trends
% rising  or falling in one or more variables over a period of time. 
plot(a,exp(-a.^2/2)/sqrt(2*pi),'.');
xlabel('Realization of random variable');
ylabel(' Number of occurrences');
title(['PDFs ',num2str(j),'Histograms']);
hold off; 
end

% The samples you would expect to fall in a histogram bin width centered at
% x would be p(x) where p(x) is the probability density function. 
% The trade-offs in choosing the number of histogram is that the higher the
% number of bins the more likely the bins fit in the curve. The only thing is when
% choosing the number of bins is if its too large lose detail, too small
% there not enough samples. So it is best to choose a range number of bins to
% see which best fits.
