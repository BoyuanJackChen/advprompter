#!/bin/bash

#SBATCH -q ebrainccs
#SBATCH -p nvidia
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=2
#SBATCH --gres=gpu:a100:2
#SBATCH --time=5:59:59
#SBATCH --mem=60GB
#SBATCH --job-name=eval

module purge

# Load the Conda module
source ~/.bashrc

# Activate your Conda environment
conda activate advprompter

export TRANSFORMERS_CACHE="/scratch/bc3194/huggingface_cache"
export HF_HOME="/scratch/bc3194/huggingface_cache"
python -u main.py --config-name=eval_suffix_dataset