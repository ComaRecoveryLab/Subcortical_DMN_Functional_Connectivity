%
% Description:
%     The main script for subcortical DMN functional connectivity identification
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

%% group brainsync, load all subjects
clear; close all; clc;
init;

sess1 = '1_7T_PA';
sessName1 = [sess_prefix sess1];
sess3 = '3_7T_PA';
sessName3 = [sess_prefix sess3];

f = cell(S*2, 1);
for m = 1:S
    f{m} = fullfile(dataDir, subjectList{m}, resDir, sessName1, [sessName1 suffix]);
    f{m+S} = fullfile(dataDir, subjectList{m}, resDir, sessName3, [sessName3 suffix]);
end
subjectFileList = f;
clear f;

%% run group brainsync in parallel, adjust options according to your hardware
data = subjectFileList;

option = groupBrainSync();
option.isDataMatrix = false;
option.batchSize = 96;
option.dataLoadingFunc = @loadDataForGBS;
option.numCPU = 24;
option.epsX = 2e-3;

[Y, ~] = groupBrainSync(data, option);
save('GBS_N336_7T_S12_PA.mat', 'Y');

%% clear and run NASCAR pipeline
clear; close all; clc;
init;

s = load('Group_7T.mat');
G = '1';
idxG = s.(['idxG' G]);
subList = subjectList(idxG);
S = length(subList);

s = load('GBS_N336_7T_S12_PA.mat');
Y = s.Y;
clear s;

%% load data
option = loadHCP7TData();

sub = '100610';
subDir = fullfile(dataDir, sub);
fileName = fullfile(subDir, resDir, sessName, [sessName suffix]);
data0 = loadHCP7TData(fileName, option);

[V, T] = size(data0);

data = zeros(V, T, S, 'single');

for m = 1:S
    sub = subList{m};
    subDir = fullfile(dataDir, sub);
    fileName = fullfile(subDir, resDir, sessName, [sessName suffix]);
    
    if exist(fileName, 'file')
        data(:, :, m) = single(loadHCP7TData(fileName, option));
    else
        disp('file missing');
    end
end

%% brainsync to group
for m = 1:S
    dataTemp = data(:, :, m).';
    dataTemp = brainSync(Y, dataTemp);
    data(:, :, m) = dataTemp.';
end

%% greedy CP preprocessing
clc;
option = cpGreedy();
option.optAlg.nonnegative = [0 0 1];
option.optAlg.cacheMTS = true;
option.optAlg.useTFOCS = false;
option.optAlg.maxNumItr = 2000;

R = 30;
[U, lambda, output] = cpGreedy(data, R, option);

%% NASCAR
data = cpFull(U, lambda);

option = srscpd('opt');
option.nonnegative = [0 0 1];
option.cacheMTS = true;

option.rank1OptALS.useTFOCS = false;
option.rank1OptALS.maxNumItr = 2000;

option.optAlg.normRegParam = 0.001;
option.optAlg.optSolver.learningRate = 1e-3;
option.optAlg.optSolver.maxNumIter = 2000;

result = srscpd(data, R, option);

save('NASCAR_result.mat', 'result');
