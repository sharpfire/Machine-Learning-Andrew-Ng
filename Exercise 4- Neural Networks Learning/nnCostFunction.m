function [J grad] = nnCostFunction(nn_params, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, ...
                                   X, y, lambda)
%NNCOSTFUNCTION Implements the neural network cost function for a two layer
%neural network which performs classification
%   [J grad] = NNCOSTFUNCTON(nn_params, hidden_layer_size, num_labels, ...
%   X, y, lambda) computes the cost and gradient of the neural network. The
%   parameters for the neural network are "unrolled" into the vector
%   nn_params and need to be converted back into the weight matrices. 
% 
%   The returned parameter grad should be a "unrolled" vector of the
%   partial derivatives of the neural network.
%

% Reshape nn_params back into the parameters Theta1 and Theta2, the weight matrices
% for our 2 layer neural network
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));

% Setup some useful variables
m = size(X, 1);
         
% You need to return the following variables correctly 
J = 0;
Theta1_grad = zeros(size(Theta1));
Theta2_grad = zeros(size(Theta2));

% ====================== YOUR CODE HERE ======================
% Instructions: You should complete the code by working through the
%               following parts.
%
% Part 1: Feedforward the neural network and return the cost in the
%         variable J. After implementing Part 1, you can verify that your
%         cost function computation is correct by verifying the cost
%         computed in ex4.m
%
% Part 2: Implement the backpropagation algorithm to compute the gradients
%         Theta1_grad and Theta2_grad. You should return the partial derivatives of
%         the cost function with respect to Theta1 and Theta2 in Theta1_grad and
%         Theta2_grad, respectively. After implementing Part 2, you can check
%         that your implementation is correct by running checkNNGradients
%
%         Note: The vector y passed into the function is a vector of labels
%               containing values from 1..K. You need to map this vector into a 
%               binary vector of 1's and 0's to be used with the neural network
%               cost function.
%
%         Hint: We recommend implementing backpropagation using a for-loop
%               over the training examples if you are implementing it for the 
%               first time.
%
% Part 3: Implement regularization with the cost function and gradients.
%
%         Hint: You can implement this around the code for
%               backpropagation. That is, you can compute the gradients for
%               the regularization separately and then add them to Theta1_grad
%               and Theta2_grad from Part 2.
%

#hellangelzy@hotmail.com
#FA4tTCqGjwFejkLr

#1.����(z(2); a(2); z(3); a(3))
a1 = [ones(m,1) X]; # 5000*401
z2 = a1*Theta1';#5000*25
a2 = sigmoid(z2); #5000*25
a2 = [ones(m,1) a2]; #5000*26
z3 = a2*Theta2'; #5000*10
a3 = sigmoid(z3); #5000*10
#y  = 5000*1

#num_labels = 10
yout = zeros(m,num_labels); #5000*10
for i = 1:m
  yout(i,y(i)) = 1;

#��yֵת��Ϊ0,1���(#5000*10)
end

for j = 1:num_labels
  left = sum(yout(:,j)'*log(a3)(:,j));
  right = sum((1-yout(:,j)')*log(1-a3)(:,j));
  JwithoutReg = (-1/m)*sum(left+right);
  J = J + JwithoutReg;
end

J = J;
#input_layer_size  = 400;  % 20x20 Input Images of Digits
#hidden_layer_size = 25;   % 25 hidden units
#num_labels = 10; 

#������Ҫ���򻯵�thetaȥ��
temp1 = Theta1(:,2:input_layer_size+1);
temp2 = Theta2(:,2:hidden_layer_size+1);

lambda/(2*m);
reg = sum(sum(temp1.^2,2))+sum(sum(temp2.^2,2));#norm(Theta1 .* Theta1)^2 = sum(sum(temp2.^2,2))
#���򻯺�ĳɱ�����
J = J + lambda/(2*m)*reg;





% -------------------------------------------------------------
#���򴫲�
#1.����(z(2); a(2); z(3); a(3)),�����
#a1 = [ones(m,1) X]; # 5000*401
#z2 = a1*Theta1';#5000*25
#a2 = sigmoid(z2); #5000*25
#a2 = [ones(m,1) a2]; #5000*26
#z3 = a2*Theta2'; #5000*10
#a3 = sigmoid(z3); #5000*10


#���򴫲�

#2.����layer3�����ֵ
d3 = a3 - yout; #5000*10
#3.����layer2�����ֵ
d2left = d3*Theta2; #5000*26
sgz2 = sigmoidGradient(z2);#5000*25
d2 = d2left(:,2:end) .* sgz2; #5000*25

#4.����delta
D2 = d3'*a2;#10*25
D1 = d2'*a1;#25*400


#5.�����ݶ�

Theta1_grad = (1/m)*D1;#10*26
Theta2_grad = (1/m)*D2;#25*401

#6.�ݶ�����

afterTheta1 = Theta1(:,2:end);
afterTheta2 = Theta2(:,2:end);

addTheta1 = [zeros(hidden_layer_size,1) afterTheta1];
addTheta2 = [zeros(num_labels,1) afterTheta2];

gradreg1 = (lambda/m)* addTheta1;
gradreg2 = (lambda/m)* addTheta2;

Theta1_grad = (1/m)*D1+gradreg1;
Theta2_grad = (1/m)*D2+gradreg2;


%=======================================================================
#�п���for loopдһ���������£�


%G1 = zeros(size(Theta1));
%G2 = zeros(size(Theta2));
%for i = 1 : m,
%	ra1 = X(i,:)';
%	rz2 = Theta1*ra1;
%	ra2 = sigmoid(rz2);
%	ra2 = [1;ra2];
%	rz3 = Theta2*ra2;
%	ra3 = sigmoid(rz3);
	
%	err3 = ra3 - ry(i,:)';
	
%	err2 = (Theta2'*err3)(2:end , 1) .* sigmoidGradient(rz2);
	
%	G1 = G1 + err2 * ra1';
%	G2 = G2 + err3 * ra2';
%end


%Theta1_grad = G1 / m + lambda*[zeros(hidden_layer_size , 1) Theta1(:,2:end)] / m;
%Theta2_grad = G2 / m + lambda*[zeros(num_labels , 1) Theta2(:,2:end)] / m;
%========================================================================





% Unroll gradients
grad = [Theta1_grad(:) ; Theta2_grad(:)];

end
