#!/bin/bash
#SBATCH --time=72:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --job-name=sp_main
#SBATCH --output=logs/main_spiders.log
#SBATCH --mem=2GB
#SBATCH --partition=gelifes
# hawaiispiders: Analyse Spider Evolution on Hawaii Island
# Copyright (C) 2021 Pedro Neves
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

# Install DAISIEutils
if [ ! -d DAISIEutils/.git ]
then
git clone https://github.com/tece-lab/DAISIEutils
else
  cd DAISIEutils/
  git pull
cd ..
fi
utilsid=$(sbatch --job-name=ut_inst DAISIEutils/bash/install_DAISIEutils.sh)

# Install hawaiispiders
if [ ! -d hawaiispiders/.git ]
then
git clone https://github.com/Neves-P/hawaiispiders
else
  cd hawaiispiders/
  git pull
cd ..
fi
spidersid=$(sbatch --job-name=sp_inst hawaiispiders/bash/install_hawaiispiders.sh)

## Submit jobs (use last word ##* to get jobid for afterok)
batch1=$(sbatch --dependency=afterok:${utilsid##* }:${spidersid##* } hawaiispiders/bash/submit_y_m_no.sh)

batch2=$(sbatch --dependency=afterok:${batch1} hawaiispiders/bash/submit_y_m_min.sh)

batch3=$(sbatch --dependency=afterok:${batch2} hawaiispiders/bash/submit_y_m_max.sh)

batch4=$(sbatch --dependency=afterok:${batch3} hawaiispiders/bash/submit_y_c_no.sh)

batch5=$(sbatch --dependency=afterok:${batch4} hawaiispiders/bash/submit_y_c_min.sh)

batch6=$(sbatch --dependency=afterok:${batch5} hawaiispiders/bash/submit_y_c_max.sh)

batch7=$(sbatch --dependency=afterok:${batch6} hawaiispiders/bash/submit_o_m_no.sh)

batch8=$(sbatch --dependency=afterok:${batch7} hawaiispiders/bash/submit_o_m_min.sh)

batch9=$(sbatch --dependency=afterok:${batch8} hawaiispiders/bash/submit_o_m_max.sh)

batch10=$(sbatch --dependency=afterok:${batch9} hawaiispiders/bash/submit_o_c_no.sh)

batch11=$(sbatch --dependency=afterok:${batch10} hawaiispiders/bash/submit_o_c_min.sh

batch12=$(sbatch --dependency=afterok:${batch11} hawaiispiders/bash/submit_o_c_max.sh
