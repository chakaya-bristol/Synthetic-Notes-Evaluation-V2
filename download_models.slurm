#!/bin/bash
#SBATCH --job-name=hf_download
#SBATCH --gpus=1
#SBATCH --time=02:00:00
#SBATCH --

source ~/miniforge3/bin/activate
conda activate mimic_nlp

pip install huggingface_hub -q
export HF_HUB_ENABLE_HF_TRANSFER = 1

REPO = "$1"
NAME = "$2"

python -c "
from huggingface_hub import snapshot_download
import os 
snapshot_download(
    '$REPO',
    local_dir = '',
    token = os.environ['HF_TOKEN']
    
)

print("Download complete: $REPO")

"
