function [ covar] = exp_cov( x,y,b )
% x,y are variables
% b is the correlation length

covar=exp(-abs(x-y)/b);

end

