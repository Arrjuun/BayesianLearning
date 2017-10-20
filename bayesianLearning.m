clear; close all; clc;

data = load('iris.txt');
X = data(:,3);
varX = var(X);      % variance of actual data
stdX = std(X);      % standard deviation as normpdf takes standard deviation
meanX = mean(X);    % mean of the data
[N,M] = size(X);

figure;
scatter(X,zeros(size(X)),'x','k');  % plotting data points
axis([0 8 0 4]);

mean_0 = 2;         % mean_0 for random variable mean parameter
std_0 = 0.5;        % standardDeviation_0 for random variable mean parameter
var_0 = std_0 ^ 2;  % variance_0 for random variable mean parameter
xmean = 0:0.05:7;   % points for calculating and plotting data

p_mean = normpdf(xmean,mean_0,std_0);   % p(mean_0) - normal distribution of mean_0 parameter
hold on;
plot(xmean,p_mean);
hold off;

mean_n = ((varX / ((N*var_0)+ varX ))*mean_0) + (((N*var_0) / ((N*var_0)+ varX ))*meanX); % calculating mean_n from the equation
var_n_I = ((1/var_0) + (N/varX));        % calculating variance_n from the equation
var_n = 1/var_n_I;
p_mean_X = normpdf(xmean,mean_n,sqrt(var_n));   % calculating p(mean|X)

hold on;
plot(xmean,p_mean_X);
hold off;

p_x_X = normpdf(xmean,mean_n,sqrt(var_n + varX));   % calculating p(x|X)

hold on;
plot(xmean,p_x_X);
hold off;






