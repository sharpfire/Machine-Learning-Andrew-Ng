h = sigmoid(X*theta) ;
p = lambda/2*m*sum(theta .^ 2) ;
J = -1/m *sum(log(h).*y+log(1-h).*(1-y))+ p;

if j == 0;
  grad = 1/m * (X' * (h - y)) ;
elseif J >= 0;
  grad = 1/m * (X' * (h - y)) + lambda/m*theta ;
