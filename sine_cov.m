function [ covar] = sine_cov( x,y,b )
% x,y are variables
% b is the correlation length


covar=sin(b*(x-y))./(b*(x-y));

end

