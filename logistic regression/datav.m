clear all;close all; clc

data = load('ex2data1.txt');
X = data(:,1:2);
y = data(:,3);

plotData(X,y);

m = length(y);
X = [ones(m,1) X];
int_theta = zeros(size(X,2),1);

%[J grad] = costFunction(X , y ,theta);
options = optimset('GradObj' , 'on' , 'MaxIter' , 1000);
[theta cost] = fminunc(@(t)(costFunction(t , X, y)),int_theta, options);
fprintf('cost function is = %f\n',cost);
fprintf('\nthe gradient descent was found at : %f\n' , theta);

prob = sigmoid([1 45 85] * theta);
fprintf('the probability rate of acceptace is : %f\n', prob * 100);

p = predict(theta , X);
fprintf('train accuracy: %f\n', mean(double(p == y)) * 100);
