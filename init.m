% replace the data directory with the real one
dataDir = fullfile(pwd, 'data');

s = load('HCP_S1200_7T_rfMRI_Wiki_Excluded.mat');
subjectList = s.Subject_List;
clear s;

V = 91282; T = 900;
S = length(subjectList);

resDir = 'MNINonLinear/Results';
sess_prefix = 'rfMRI_REST';
sess = '1_7T_PA';
sessName = [sess_prefix sess];
suffix = '_Atlas_hp2000_clean.dtseries.nii';

s = load('DimInfo.mat');
dimInfo = s.DimInfo;

[sfNames, ~] = cifti_diminfo_dense_get_structures(dimInfo);
info = cifti_diminfo_dense_get_surface_info(dimInfo, sfNames{1});
idxNaNL = true(info.numverts, 1);
idxNaNL(info.vertlist1) = false;

info = cifti_diminfo_dense_get_surface_info(dimInfo, sfNames{2});
idxNaNR = true(info.numverts, 1);
idxNaNR(info.vertlist1) = false;

sfL = loadGii('100610.L.inflated.32k_fs_LR.surf.gii');
sfR = loadGii('100610.R.inflated.32k_fs_LR.surf.gii');

clear s sfNames info;