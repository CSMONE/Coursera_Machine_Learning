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
min_rate =1;
C_vec = [0.1:0.2:1 1:2:10 10:5:30];
sigma_vec = [0.01:0.05:0.2 0.2:0.1:1 1:2:10];
for C_tmp= C_vec
    for sigma_tmp= sigma_vec        
        model = svmTrain(X, y, C_tmp, @(x1, x2) gaussianKernel(x1, x2, sigma_tmp)) ;       
        predictions = svmPredict(model, Xval);
        new_rate = mean(double(predictions ~= yval));        
        if new_rate < min_rate
            min_rate = new_rate;
            C = C_tmp;
            sigma = sigma_tmp;
        end        
    end
end


% =========================================================================

end