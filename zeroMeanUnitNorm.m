%
% [dataOut, meanVal, normVal] = zeroMeanUnitNorm(dataIn, dim)
% 
% Description:
%     zero mean and unit norm the data on a particular dimension
% 
% Input:
%     dataIn - data input
%     dim - on which dimension to zero mean and unit norm
% 
% Output:
%     dataOut - data output
%     meanVal - mean value that subtracted
%     normVal - norm value that divided
% 
% Copyright:
%     2013-2021 (c) LCN & NICC, A. A. Martinos Center, MGH & HMS
% Author:
%     Jian Li (Andrew)
% Revision:
%     1.0.4
% Date:
%     2021/07/04
%

function [dataOut, meanVal, normVal] = zeroMeanUnitNorm(dataIn, dim)
    [dataZM, meanVal] = zeroMean(dataIn, dim);
    [dataOut, normVal] = unitNorm(dataZM, dim);
end