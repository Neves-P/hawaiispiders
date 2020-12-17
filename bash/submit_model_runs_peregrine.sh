#!/bin/bash
#SBATCH --time=0:05:00
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --job-name=start_spiders
#SBATCH --output=logs/spiders/start_spiders.log
#SBATCH --mem=1GB
#SBATCH --partition=short

# hawaiispiders: Analyse Spider Evolution on Hawaii Island
# Copyright (C) 2020 Pedro Neves
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

################################ Usage #########################################
# This bash script submits a set of hawaiispiders DAISIE model inference jobs  #
# Submissions are made to the regular partition.                               #
################################################################################
### Arguments ###
# datalist_name - the name of the datalist object, as found as data on
#   the hawaiispiders package.
# M - Number of mainland species as per the DAISIE model. In BI for spiders will
#  most likely be set to 165.
# end_model_number - the model number up to which jobs should be submitted. Setting
#  it to 4 will submit models 1:4.
# seed_range_1 - The first value of the seed chain used to sample the
#  optimization initial parameters.
# seed_range_2 - The second value of the seed chain used to sample the
#  optimization initial parameters. The total number of MLE runs to compute
#  will be seed_range_2 - seed_range_1. If set to the same value as seed_range_1
#  only one seed will be used.
################################################################################
##### Before running make sure logs folder has been created! ####
## Usage example running simulations for the oceanic_ontogeny param space, 1000
## replicates, entire parameter space:
# git clone https://github.com/Neves-P/DAISIErobustness.git
# sbatch DAISIErobustness/bash/submit_run_robustness_peregrine.sh oceanic_ontogeny 1000 abs
#
## Usage example running analysis for the nonoceanic param space, 1000
## replicates, entire parameter space:
# git clone https://github.com/Neves-P/DAISIErobustness.git
# sbatch DAISIErobustness/bash/submit_run_robustness_peregrine.sh nonoceanic 1000 abs
################################################################################

# Start script
ml R
Rscript -e "remotes::install_github('Neves-P/hawaiispiders')"

datalist_name=$1
M=$2
end_model_number=$3
seed_range_1=$3
seed_range_2=$4



for (( model_to_run = 1; model_to_run <= end_model_number; param_set++ ))
do
  sbatch hawaiispiders/bash/submit_run_main.sh ${datalist_name} \
                                               ${M} \
                                               ${model_to_run} \
                                               ${seed_range_1} \
                                               ${seed_range_2}
done