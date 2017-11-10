#!/bin/bash
#SBATCH -o out_wrf_Squall_2d_x
#SBATCH -e error_wrf_Squall_2d_x
#SBATCH --mem=8G
#SBATCH --time=12:00:00 
ncl wrf_Squall_2d_x.ncl
