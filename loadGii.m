%
% sf = loadGii(fileName)
% 
% Description:
%     short cut to load gifti file and convert into double type
% 
% Input:
%     fileName - gifti file name or full path
% 
% Output:
%     sf - surface structure
% 
% Copyright:
%     2020-2021 (c) LCN & NICC, A. A. Martinos Center, MGH & HMS
% Author:
%     Jian Li (Andrew)
% Revision:
%     1.0.2
% Date:
%     2021/07/04
%

function [data, label] = loadGii(fileName)
    
    data = [];
    label = [];
    
    if exist(fileName, 'file')
        s = gifti(fileName);
        
        if contains(fileName, '.surf.gii')
            data = struct('vertices', [], 'faces', []);    
            data.vertices = double(s.vertices);
            data.faces = double(s.faces);
        elseif contains(fileName, '.shape.gii') || contains(fileName, '.func.gii')
            data = double(s.cdata);
        elseif contains(fileName, '.label.gii')
            data = double(s.cdata);
            label = s.labels;
        end
    end
    
end