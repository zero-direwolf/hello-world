function p = predict(theta ,X)

m = size(X,1);
p = zeros(m,1);

htheta = sigmoid(X * theta);
p = htheta >= 0.5;

end