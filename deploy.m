ccc;

skipList = {'srscpd', 'cpGreedy', 'groupBrainSync', 'brainSync', 'cifti', 'TFOCS', 'cvx', 'nway331'};

[fileListH2, fileListU] = checkFileDependencyHierarchy('main', skipList);

%%
fileNASCAR = {'tsFroNorm', 'nBlockDiag', 'matricize', 'linop_diff_h',...
    'krProd', 'cpOpt', 'cpGreedy', 'cpFull', 'cpDiffX', 'cpDiff', 'cpALS', ...
    'CCDWrapper', 'brainSync', 'brainSyncT', 'adam_solver'};
fileGBS = {'progressTracker', 'parpoolOperator', 'parProgressTracker', 'findNumberOfCores'};

idx = true(length(fileListU), 1);
for m = 1:length(fileListU)
    fileName = fileListU{m};
    [~, name, ext] = fileparts(fileName);
    if ismember(name, fileNASCAR) || ismember(name, fileGBS)
        idx(m) = false;
    end        
end
fileListU2 = fileListU(idx);

%%
cc;
for m = 1:length(fileListU2)
    if strcmp(fileListU2{m}(end-1:end), '.m')
        edit(fileListU2{m});
    end
end

%%
opt = arLs();
opt.ext = 'm';
opt.alwaysCell = true;
opt.mode = 'file';
listF = arLs(pwd);

idx = true(length(fileListU2), 1);
for m = 1:length(fileListU2)
    fileName = fileListU2{m};
    [~, name, ext] = fileparts(fileName);
    name2 = [name ext];
    if ismember(name2, listF) || ismember(name2, listF)
        idx(m) = false;
    end        
end
fileListU3 = fileListU2(idx);

%% copy over
for m = 1:length(fileListU3)
    copyfile(fileListU3{m}, pwd);
end


