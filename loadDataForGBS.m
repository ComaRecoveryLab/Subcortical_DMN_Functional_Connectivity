%
% data = loadDataForGBS(fileName)
% 
% Description:
%     load HCP data for Group BrainSync
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

function data = loadDataForGBS(fileName)
    
    a = loadHCP7TData(fileName);
    data = a';

end