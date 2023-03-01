#!/bin/bash
#SBATCH --time=00:10:00
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --job-name=Spiders
#SBATCH --output=logs/Spiders.log
#SBATCH --mem=200MB
#SBATCH --partition=regular
# hawaiispiders: Analyse Spider Evolution on Hawaii Island
# Copyright (C) 2023 Pedro Santos Neves
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
sbatch --job-name=sp_r_c_max DAISIEutils/bash/submit_run_daisie_ml.sh r_c_max cr_dd hawaiispiders 1

sbatch --job-name=sp_r_c_min DAISIEutils/bash/submit_run_daisie_ml.sh r_c_min cr_dd hawaiispiders 1

sbatch --job-name=sp_r_c_no DAISIEutils/bash/submit_run_daisie_ml.sh r_c_no cr_dd hawaiispiders 1

sbatch --job-name=sp_o_c_max DAISIEutils/bash/submit_run_daisie_ml.sh o_c_max cr_dd hawaiispiders 1

sbatch --job-name=sp_o_c_min DAISIEutils/bash/submit_run_daisie_ml.sh o_c_min cr_dd hawaiispiders 1

sbatch --job-name=sp_o_c_no DAISIEutils/bash/submit_run_daisie_ml.sh o_c_no cr_dd hawaiispiders 1

sbatch --job-name=sp_y_c_max DAISIEutils/bash/submit_run_daisie_ml.sh y_c_max cr_dd hawaiispiders 1

sbatch --job-name=sp_y_c_min DAISIEutils/bash/submit_run_daisie_ml.sh y_c_min cr_dd hawaiispiders 1

sbatch --job-name=sp_y_c_no DAISIEutils/bash/submit_run_daisie_ml.sh y_c_no cr_dd hawaiispiders 1

sbatch --job-name=sp_a_c_max DAISIEutils/bash/submit_run_daisie_ml.sh a_c_max cr_dd hawaiispiders 1

sbatch --job-name=sp_a_c_min DAISIEutils/bash/submit_run_daisie_ml.sh a_c_min cr_dd hawaiispiders 1

sbatch --job-name=sp_a_c_no DAISIEutils/bash/submit_run_daisie_ml.sh a_c_no cr_dd hawaiispiders 1

sbatch --job-name=sp_q_c_max DAISIEutils/bash/submit_run_daisie_ml.sh q_c_max cr_dd hawaiispiders 1

sbatch --job-name=sp_q_c_min DAISIEutils/bash/submit_run_daisie_ml.sh q_c_min cr_dd hawaiispiders 1

sbatch --job-name=sp_q_c_no DAISIEutils/bash/submit_run_daisie_ml.sh q_c_no cr_dd hawaiispiders 1

sbatch --job-name=sp_h_c_max DAISIEutils/bash/submit_run_daisie_ml.sh h_c_max cr_dd hawaiispiders 1

sbatch --job-name=sp_h_c_min DAISIEutils/bash/submit_run_daisie_ml.sh h_c_min cr_dd hawaiispiders 1

sbatch --job-name=sp_h_c_no DAISIEutils/bash/submit_run_daisie_ml.sh h_c_no cr_dd hawaiispiders 1

sbatch --job-name=sp_r_m_max DAISIEutils/bash/submit_run_daisie_ml.sh r_m_max cr_dd hawaiispiders 1

sbatch --job-name=sp_r_m_min DAISIEutils/bash/submit_run_daisie_ml.sh r_m_min cr_dd hawaiispiders 1

sbatch --job-name=sp_r_m_no DAISIEutils/bash/submit_run_daisie_ml.sh r_m_no cr_dd hawaiispiders 1

sbatch --job-name=sp_o_m_max DAISIEutils/bash/submit_run_daisie_ml.sh o_m_max cr_dd hawaiispiders 1

sbatch --job-name=sp_o_m_min DAISIEutils/bash/submit_run_daisie_ml.sh o_m_min cr_dd hawaiispiders 1

sbatch --job-name=sp_o_m_no DAISIEutils/bash/submit_run_daisie_ml.sh o_m_no cr_dd hawaiispiders 1

sbatch --job-name=sp_y_m_max DAISIEutils/bash/submit_run_daisie_ml.sh y_m_max cr_dd hawaiispiders 1

sbatch --job-name=sp_y_m_min DAISIEutils/bash/submit_run_daisie_ml.sh y_m_min cr_dd hawaiispiders 1

sbatch --job-name=sp_y_m_no DAISIEutils/bash/submit_run_daisie_ml.sh y_m_no cr_dd hawaiispiders 1

sbatch --job-name=sp_a_m_max DAISIEutils/bash/submit_run_daisie_ml.sh a_m_max cr_dd hawaiispiders 1

sbatch --job-name=sp_a_m_min DAISIEutils/bash/submit_run_daisie_ml.sh a_m_min cr_dd hawaiispiders 1

sbatch --job-name=sp_a_m_no DAISIEutils/bash/submit_run_daisie_ml.sh a_m_no cr_dd hawaiispiders 1

sbatch --job-name=sp_h_m_max DAISIEutils/bash/submit_run_daisie_ml.sh h_m_max cr_dd hawaiispiders 1

sbatch --job-name=sp_h_m_min DAISIEutils/bash/submit_run_daisie_ml.sh h_m_min cr_dd hawaiispiders 1

sbatch --job-name=sp_h_m_no DAISIEutils/bash/submit_run_daisie_ml.sh h_m_no cr_dd hawaiispiders 1

sbatch --job-name=sp_q_m_max DAISIEutils/bash/submit_run_daisie_ml.sh q_m_max cr_dd hawaiispiders 1

sbatch --job-name=sp_q_m_min DAISIEutils/bash/submit_run_daisie_ml.sh q_m_min cr_dd hawaiispiders 1

sbatch --job-name=sp_q_m_no DAISIEutils/bash/submit_run_daisie_ml.sh q_m_no cr_dd hawaiispiders 1
