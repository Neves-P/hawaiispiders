#!/bin/bash
#SBATCH --time=10:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --job-name=x_scen_spider
#SBATCH --output=logs/%x-%j.log
#SBATCH --mem=2GB
#SBATCH --partition=vulture

ml R
Rscript scripts/cross_scenarios.R
