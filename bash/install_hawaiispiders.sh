#!/bin/bash
#SBATCH --time=00:30:00
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --job-name=install_hawaiispiders
#SBATCH --output=install_hawaiispiders.log
#SBATCH --mem=2GB
#SBATCH --partition=short

mkdir -p logs
ml R

Rscript -e 'remotes::install_github("rsetienne/DAISIE", upgrade = TRUE)'
Rscript -e 'remotes::install_github("tece-lab/DAISIEutils", upgrade = TRUE)'
Rscript -e 'remotes::install_github("Neves-P/hawaiispiders", upgrade = TRUE)'
