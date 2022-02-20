#!/bin/bash
#SBATCH --time=10:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --job-name=cross_ll_spi
#SBATCH --output=logs/%x-%j.log
#SBATCH --mem=2GB
#SBATCH --partition=vulture

ml R
Rscript hawaiispiders/scripts/cross_methode_test.R
