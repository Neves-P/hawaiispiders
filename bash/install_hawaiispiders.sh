#!/bin/bash
#SBATCH --time=1:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --job-name=install_hawaiispiders
#SBATCH --output=install_hawaiispiders.log
#SBATCH --mem=2GB
#SBATCH --partition=gelifes

mkdir -p logs
ml R

Rscript -e 'remotes::install_github("rsetienne/DAISIE@v4.0.5")'
Rscript -e 'remotes::install_github("tece-lab/DAISIEutils")'
Rscript -e 'remotes::install_github("Neves-P/hawaiispiders")'
