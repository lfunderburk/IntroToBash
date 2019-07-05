#!/bin/bash
#SBATCH --time=00:30:00
#SBATCH --mem=1200M
#SBATCH --array=1-10%10
#SBATCH --account=def-sponsor00
#SBATCH --output=/home/user001/projects/def-sponsor00/user001/OUTPUTDIR/Python_Job_%J.out

##Script Author: Laura Gutierrez Funderburk
##Created on: July 5 2019
##Last modified on: July 5 2019

echo "Current working directory: `pwd`"
echo "Starting run at: `date`"
# ---------------------------------------------------------------------
echo ""
echo "Job Array ID / Job ID: $SLURM_ARRAY_JOB_ID / $SLURM_JOB_ID"
echo "This is job $SLURM_ARRAY_TASK_ID out of $SLURM_ARRAY_TASK_COUNT jobs."
echo ""

echo "Begin Script"
echo " "

#######################
###### Directories ######
#######################

###############################
##OUTPUT DIRS & ARRAY DATA##
###############################

#Where are files found
FileDir=/home/user001/projects/def-sponsor00/user001/IntroToBash/DATA/Spreadsheets/

# Array data
array_data=/home/user001/projects/def-sponsor00/user001/IntroToBash/Scripts/

# Scripts director
script=/home/user001/projects/def-sponsor00/user001/IntroToBash/Scripts/


#######################
### Array File Entries ####
#######################

cd ${array_data}

FileName=`awk -F, '{print $1}' filename_arr | head -$SLURM_ARRAY_TASK_ID | tail -1` 

#######################
#### Verify Input Para ####
#######################

echo "CHECK INPUT IS CORRECT"
echo " "
echo "File name: " ${FileName}

#######################
#### Sanity Checking ####
#######################

cd ${script}

echo "Begin Python Script "
echo " "


source /home/centos/astro/bin/activate

module load python/3.7.0

python mypythonscript.py ${FileDir}${FileName}

deactivate

echo "End Python Sanity Check"


