#!/bin/bash
#SBATCH --time=72:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --job-name=boot
#SBATCH --output=logs/boot.log
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

## Submit jobs (use last word ##* to get jobid for afterok)
sbatch --job-name=b-y_c_min DAISIEutils/bash/submit_bootstrap.sh y_c_min cr_di hawaiispiders 1

sbatch --dependency=singleton --job-name=b-y_c_min DAISIEutils/bash/submit_bootstrap.sh y_c_min cr_dd hawaiispiders 1

sbatch --dependency=singleton --job-name=b-y_c_min DAISIEutils/bash/submit_bootstrap.sh y_c_min cr_di hawaiispiders 1

sbatch --dependency=singleton --job-name=b-y_c_min DAISIEutils/bash/submit_bootstrap.sh y_c_min cr_di_0laa hawaiispiders 1

sbatch --dependency=singleton --job-name=b-y_c_min DAISIEutils/bash/submit_bootstrap.sh y_c_min cr_dd_0laa hawaiispiders 1

sbatch --dependency=singleton --job-name=b-y_c_min DAISIEutils/bash/submit_bootstrap.sh y_c_min cr_dd_0lac hawaiispiders 1

sbatch --dependency=singleton --job-name=b-y_c_min DAISIEutils/bash/submit_bootstrap.sh y_c_min cr_di_0lac hawaiispiders 1
