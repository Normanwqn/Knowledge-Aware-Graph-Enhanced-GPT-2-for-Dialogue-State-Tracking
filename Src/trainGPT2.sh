#!/bin/bash

#SBATCH --job-name=GPT2Train
#SBATCH --account=eecs595f22_class
#SBATCH --partition=spgpu
#SBATCH --time=00-05:00:00
#SBATCH --nodes=1
#SBATCH --gpus=1
#SBATCH --cpus-per-gpu=2
#SBATCH --mem-per-gpu=16GB
#SBATCH --error=/scratch/eecs595f22_class_root/eecs595f22_class/normanqw/Knowledge-Aware-Graph-Enhanced-GPT-2-for-Dialogue-State-Tracking/OurResults/%j-%x.log
#SBATCH --output=/scratch/eecs595f22_class_root/eecs595f22_class/normanqw/Knowledge-Aware-Graph-Enhanced-GPT-2-for-Dialogue-State-Tracking/OurResults/%j-%x.log
#SBATCH --mail-user=normanqw@umich.edu


# set up job
module load python/3.9 cuda
pushd /scratch/eecs595f22_class_root/eecs595f22_class/normanqw/Knowledge-Aware-Graph-Enhanced-GPT-2-for-Dialogue-State-Tracking/Src 
source ../newvenv/bin/activate


# run job
CUDA_VISIBLE_DEVICES=0 python main.py ../configs/KAGE_GPT2_FullTraining.jsonnet --mode train --experiment_name KAGE_DS_L4P4K2 --num_layer 4 --num_head 4 --num_hop 2 --graph_mode part
