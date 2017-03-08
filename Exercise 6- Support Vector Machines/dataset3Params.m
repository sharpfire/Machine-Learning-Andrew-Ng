function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%

#
#
#clear ; close all; clc
% =========================================================================
#����һ�����ּ��ϣ�
number = [0.01 , 0.03, 0.1, 0.3, 1, 3, 10, 30];

C_vac = 0;
sigma_vac = 0;
#outcome = zeros(64,3);
#count = 0;
x1 = X(:,1);
x2 = X(:,2);



% =========================================================================

#���Լ���
minError = 10000;


for i = 1:length(number),
  for j = 1:length(number),
    C_vac = number(i);
    sigma_vac = number(j);
    model= svmTrain(X, y, C_vac, @(x1, x2) gaussianKernel(x1, x2, sigma_vac));
    predictions = svmPredict(model, Xval);
    error = mean(double(predictions ~= yval));
    if minError > error,
      minError = error;
      C = C_vac;
      sigma = sigma_vac;

    
    
  end
end

% =========================================================================
%for CVal = param,
%	for sigmaVal = param,
%		model =  svmTrain(X, y, CVal, @(x1, x2) gaussianKernel(x1, x2, sigmaVal));
%		predictions = svmPredict(model , Xval);
%		error = mean(double(predictions ~= yval));
%		if minError > error,
%			minError = error;
%			C = CVal;
%			sigma = sigmaVal;
%		end
%	end
%end

		
end
