#!/bin/bash
#SBATCH --time=01:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --job-name=install_hawaiispiders
#SBATCH --output=install_hawaiispiders.log
#SBATCH --mem=2GB
#SBATCH --partition=regular

mkdir -p logs
ml R-bundle-CRAN/2024.11-foss-2024a

Rscript -e 'install.packages("DAISIE")'
Rscript -e 'remotes::install_github("tece-lab/DAISIEutils@develop", force = TRUE)'
Rscript -e 'remotes::install_github("Neves-P/hawaiispiders@develop", force = TRUE)'
