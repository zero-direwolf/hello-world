clear all;close all; clc

data = load('ex2data2.txt');
X = data(:,1:2);
y = data(:,3);

%plotData(X,y);
%xlabel('Microchip test 1');
%ylabel('Microchip test 1');
%legend('y=1 or accepted','y=0 or rejeted');

X = featureMapping(X(:,1),X(:,2));
int_theta = zeros(size(X,2),1);
lambda = 1;

%[cost grad] = costFunctionReg(int_theta , X , y , lambda);

%fprintf('cost at initial theta : %f\n' , cost);
%fprintf('gradient descent was computed as : %f \n',grad);

options = optimset('GradObj' , 'on' , 'MaxIter' , 1000);
[theta,cost,exit_flag] = fminunc(@(t)(costFunctionReg(t , X ,y , lambda)), int_theta,options);
%fprintf('cost : %f\n' , cost);
%fprintf('theta using gradient descent was computed as : %f \n',theta);

prob = [ 1 0 0]' * theta';
pre = mean(prob);
fprintf('the probability rate of acceptace is : %f\n', pre));

p = predict(theta, X);

fprintf('Train Accuracy: %f\n', mean(double(p == y)) * 100);


