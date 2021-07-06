%
% data = loadHCP7TData(fileName)
% 
% Description:
%     load and normalize HCP cifti data
% 
% Input:
%     fileName - name of the cifti file
%
% Output:
%     data - data matrix V x T
% 
% Copyright:
%     2021 (c) LCN & NICC, A. A. Martinos Center, MGH & HMS
% Author:
%     Jian Li (Andrew)
% Revision:
%     1.0.0
% Date:
%     2021/07/04
%

function data = loadHCP7TData(fileName)

    a = cifti_read(fileName);
    data = zeroMeanUnitNorm(a.cdata, 2);
    
end