function g = sigmoid(z)

g = 0;
g = 1 ./ (1 + exp(-z));

end