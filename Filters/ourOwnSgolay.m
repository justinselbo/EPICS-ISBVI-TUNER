function [smoothed] = ourOwnSgolay(values, polynomialOrder, kernelSize)
smoothed = zeros(size(values));

arraySize = size(values);
arraySize = arraySize(2);

for j = 1:(arraySize) % duplicates values to smoothed (needed for edge values where averaging cannot be done since window would exceed boundaries)

    smoothed(j) = values(j);
end
for k = (ceil(kernelSize / 2)):(arraySize - ceil(kernelSize / 2)) % runs through all values far away enough from edges where the window doesn't exceed boundaries
sum = 0; % reinitialize
    for m = (k - floor(kernelSize / 2)):(k + floor(kernelSize / 2)) % runs through all values of the window (should have kernelSize number of iterations
        sum = sum + values(m);
    end
    smoothed(k) = sum / kernelSize; % average of surrounding window is the new value at that point
end