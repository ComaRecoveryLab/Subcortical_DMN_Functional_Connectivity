%
% dataOut = unitNorm(dataIn, dim)
% 
% Description:
%     normalize the data to unit norm on a particular dimension
% 
% Input:
%     dataIn - data input
%     dim - on which dimension to unit norm, only support 1 or 2 for now
% 
% Output:
%     dataOut - data output
%     normVal - norm value that divided
% 
% Copyright:
%     2013-2021 (c) LCN & NICC, A. A. Martinos Center, MGH & HMS
% Author:
%     Jian Li (Andrew)
% Revision:
%     1.0.3
% Date:
%     2021/07/04
%

function [dataOut, normVal] = unitNorm(dataIn, dim)
    
    if dim == 1
        flag = false;
    elseif dim == 2
        flag = true;
    else
        error('dim can only be 1 or 2');
    end
    
    if flag
        X = dataIn';
    else
        X = dataIn;
    end
    
    normVal = zeros(1, size(X, 2));
    for m = 1:size(X, 2)
        normVal(m) = norm(X(:, m));
        X(:, m) = X(:, m) ./ normVal(m);
    end
    
    if flag
        dataOut = X';
        normVal = normVal';
    else
        dataOut = X;
    end
end