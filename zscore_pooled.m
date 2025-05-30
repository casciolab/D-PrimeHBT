function z = zscore_pooled(x)
% zscore_pooled - Computes z-scores using pooled mean and std
%
% INPUT:
%   x - vector of proportions (e.g., hit rates or false alarm rates)
%
% OUTPUT:
%   z - empirical z-scores

% Remove NaNs if any
x = x(~isnan(x));

% Compute pooled mean and std
mu = mean(x);
sigma = std(x);

% Prevent divide-by-zero
if sigma == 0
    z = zeros(size(x));
else
    z = (x - mu) / sigma;
end

end
