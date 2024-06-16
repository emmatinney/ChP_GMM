#!/bin/bash
#SBATCH --time=24:00:0
#SBATCH --nodes=2
#SBATCH --cpus-per-task=8
#SBATCH --mem-per-cpu=32000
#SBATCH --job-name=gmm
#SBATCH --partition=short
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=tinney.e@northeastern.edu
module load fsl

for s in $(cat /work/cnelab/ADNIDOD/mri/ADNIDOD/freesurfer/subjects.txt)
do 

fslstats /work/cnelab/ADNIDOD/mri/ADNIDOD/freesurfer/${s}/mri/lh_choroid_susan_segmentation.nii.gz -V >> /work/cnelab/code/gmm_chp/adnidod/siemens_lh_choroid_susan_segmentation.txt
fslstats /work/cnelab/ADNIDOD/mri/ADNIDOD/freesurfer/${s}/mri/rh_choroid_susan_segmentation.nii.gz -V >> /work/cnelab/code/gmm_chp/adnidod/siemens_rh_choroid_susan_segmentation.txt
done
