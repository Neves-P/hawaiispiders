#!/bin/bash
#SBATCH --time=72:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --job-name=Spiders
#SBATCH --output=logs/Spiders.log
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

git clone https://github.com/tece-lab/DAISIEutils || (cd $HOME/DAISIEutils ; git pull; cd ..)

# Install DAISIEutils
if [ ! -d DAISIEutils/.git ]
then
    git clone https://github.com/tece-lab/DAISIEutils
else
    cd DAISIEutils/
    git pull
    cd ..
fi
utilsid=$(sbatch --job-name=utils_inst DAISIEutils/bash/install_DAISIEutils.sh)

# Install hawaiispiders
if [ ! -d hawaiispiders/.git ]
then
    git clone https://github.com/Neves-P/hawaiispiders
else
    cd hawaiispiders/
    git pull
    cd ..
fi

spidersid=$(sbatch --job-name=spi_inst hawaiispiders/bash/install_hawaiispiders.sh)

# Submit jobs
sbatch --dependency=afterok:$utilsid,$spidersid --job-name=y_m_no DAISIEutils/bash/submit_run_daisie_ml.sh y_m_no cr_di hawaiispiders 1

sbatch --dependency=singleton --job-name=y_m_no DAISIEutils/bash/submit_run_daisie_ml.sh y_m_no cr_dd hawaiispiders 1

sbatch --dependency=singleton --job-name=y_m_no DAISIEutils/bash/submit_run_daisie_ml.sh y_m_no cr_di hawaiispiders 1

sbatch --dependency=singleton --job-name=y_m_no DAISIEutils/bash/submit_run_daisie_ml.sh y_m_no cr_di_0laa hawaiispiders 1

sbatch --dependency=singleton --job-name=y_m_no DAISIEutils/bash/submit_run_daisie_ml.sh y_m_no cr_dd_0laa hawaiispiders 1

sbatch --dependency=singleton --job-name=y_m_no DAISIEutils/bash/submit_run_daisie_ml.sh y_m_no cr_dd_0lac hawaiispiders 1

sbatch --dependency=singleton --job-name=y_m_no DAISIEutils/bash/submit_run_daisie_ml.sh y_m_no cr_di_0lac hawaiispiders 1
