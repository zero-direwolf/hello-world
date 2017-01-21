clear all;
close;
clc

pkg load io;

data1 = xlsread('importdata.xlsx','Sheet1','A1:B25');

X = data1(:,1);
y = data1(:,2);

m = length(y);

plotData(X,y);

m = length(y);
X = [ones(m,1) X];
theta = zeros(2,1);

costFunction(X,y,theta);

iterations = 15000;
alpha = 0.01;

costFunction(X,y,theta)

theta = gradientDescent(X,y,theta,alpha,iterations);

fprintf('%f%f\n',theta(1),theta(2));

hold on;
plot(X(:,2),X*theta,'-');
hold off;