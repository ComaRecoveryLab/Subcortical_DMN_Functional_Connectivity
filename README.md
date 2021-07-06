# Subcortical Default Mode Network Functional Connectivity

[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)

## Introduction

The default mode network (DMN) mediates self-awareness and introspection, core components of human consciousness. Therapies to restore consciousness in patients with severe brain injuries have historically targeted subcortical sites in the brainstem, thalamus, hypothalamus, basal forebrain, and basal ganglia with the goal of reactivating cortical DMN nodes. However, the subcortical connectivity of the DMN has not been fully mapped and optimal subcortical targets for therapeutic neuromodulation of consciousness have not been identified. Here, we aimed to create a comprehensive map of DMN subcortical connectivity by combining high-resolution functional and structural datasets with advanced signal processing methods. We analyzed 7 Tesla resting-state functional MRI (rs-fMRI) data from 168 healthy volunteers acquired in the Human Connectome Project. The rs-fMRI blood-oxygen-level-dependent (BOLD) data were temporally synchronized across subjects using the BrainSync algorithm. Cortical and subcortical DMN nodes were jointly analyzed and identified at the group level by applying a novel Nadam-Accelerated SCAlable and Robust (NASCAR) tensor decomposition method to the synchronized dataset. The subcortical connectivity map was then overlaid on a 7 Tesla 100 micron ex vivo MRI dataset for neuroanatomic analysis using automated segmentation of nuclei within the brainstem, thalamus, hypothalamus, basal forebrain, and basal ganglia. We further compared the NASCAR subcortical connectivity map with its counterpart generated from canonical seed-based correlation analyses. The NASCAR method revealed that BOLD signal in the central lateral nucleus of the thalamus and ventral tegmental area of the midbrain is strongly correlated with that of the DMN. In an exploratory analysis, additional subcortical sites in the median and dorsal raphe, lateral hypothalamus, and caudate nuclei were correlated with the cortical DMN. We also found that the putamen and globus pallidus are negatively correlated (i.e., anti-correlated) with the DMN, providing rs-fMRI evidence for the “mesocircuit” hypothesis of human consciousness, whereby a striatopallidal feedback system modulates anterior forebrain function via disinhibition of the central thalamus. Seed-based analyses yielded similar subcortical DMN connectivity, but the NASCAR result showed stronger contrast and better spatial alignment with dopamine immunostaining data. The DMN subcortical connectivity map identified here advances understanding of the subcortical regions that contribute to human consciousness and can be used to inform the selection of therapeutic targets in clinical trials for patients with disorders of consciousness.

## Subcortical DMN Identification Pipeline

This repository provides a collection of [MATLAB](https://www.mathworks.com/products/matlab.html) functions, scripts, and auxiliary files (hereafter the "CODE") used in the identification of the DMN functional connectivity. It uses/is dependent on the following packages:

* [Nadam-Accelerated SCAlable and Robust (NASCAR) tensor decomposition](https://neuroimageusc.github.io/NASCAR)
* [Group BrainSync](https://neuroimageusc.github.io/GBS), which rely on the [BrainSync](https://neuroimageusc.github.io/BrainSync) algorithm.
* [CIFTI API](https://github.com/Washington-University/cifti-matlab)

## Disclaimer
IN NO EVENT SHALL THE AUTHORS, THE CONTRIBUTORS, THE DISTRIBUTORS AND THE MASSACHUSETTS GENERAL HOSPITAL (“AUTHORS”) BE LIABLE TO ANY PARTY FOR DIRECT, INDIRECT, SPECIAL, INCIDENTAL, OR CONSEQUENTIAL DAMAGES, INCLUDING LOST PROFITS, ARISING OUT OF THE USE OF THIS CODE, EVEN IF THE AUTHORS HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGE. THE AUTHORS SPECIFICALLY DISCLAIMS ANY WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE. FOR RESEARCH PURPOSE ONLY. THIS CODE IS PROVIDED ON A “AS IS” BASIS AND THE AUTHORS HAVE NO OBLIGATION TO PROVIDE MAINTENANCE, SUPPORT, UPDATES, ENHANCEMENTS, OR MODIFICATIONS.

## Publication

* J. Li, W. H. Curley, B. Guerin, D. D. Dougherty, A. V. Dalca, B. Fischl, A. Horn, B. L. Edlow, "Mapping the subcortical connectivity of the human default mode network". [bioRxiv](https://www.biorxiv.org/)

## Data Release

* Lead-DBS: [Subcortical Atlases in MNI Space](https://www.lead-dbs.org/helpsupport/knowledge-base/atlasesresources/atlases/)
* OpenN<span style="font-variant:small-caps;">euro</span>: [https://openneuro.org/datasets/ds003716](https://openneuro.org/datasets/ds003716)
* FreeSurfer: [https://surfer.nmr.mgh.harvard.edu/](https://surfer.nmr.mgh.harvard.edu/)
