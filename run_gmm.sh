#!/bin/bash
#SBATCH --time=24:00:0
#SBATCH --nodes=2
#SBATCH --cpus-per-task=8
#SBATCH --mem-per-cpu=32000
#SBATCH --job-name=gmm
#SBATCH --partition=short
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=tinney.e@northeastern.edu

module load anaconda
source activate surf
module load fsl
module load freesurfer

for s in $(cat /work/cnelab/ADNIDOD/mri/ADNIDOD/freesurfer/subjects.txt)
do
sbatch -p batch --partition=short --job-name=$s --time=1-00:00:00 --wrap="python2 run_gmm_chp_segmentation.py /work/cnelab/ADNIDOD/mri/ADNIDOD/freesurfer ${s}"
done
