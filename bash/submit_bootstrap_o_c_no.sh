#!/bin/bash
#SBATCH --time=00:30:00
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --job-name=boot
#SBATCH --output=logs/boot.log
#SBATCH --mem=500MB
#SBATCH --partition=short
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


sbatch --job-name=b-spiders DAISIEutils/bash/submit_bootstrap.sh o_c_no cr_dd hawaiispiders 1