#!/bin/bash
#SBATCH --time=01:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --job-name=install_hawaiispiders
#SBATCH --output=install_hawaiispiders.log
#SBATCH --mem=2GB
#SBATCH --partition=regular

mkdir -p logs
ml R

Rscript -e 'remotes::install_github("rsetienne/DAISIE", upgrade = TRUE, force = TRUE)'
Rscript -e 'remotes::install_github("tece-lab/DAISIEutils", upgrade = TRUE, force = TRUE)'
Rscript -e 'remotes::install_github("Neves-P/hawaiispiders", upgrade = TRUE, force = TRUE)'
