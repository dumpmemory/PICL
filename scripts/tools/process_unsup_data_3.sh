
BASE_PATH="/home/lidong1/CodeRepo"
DATA_PATH=${1-"generalll/10M_64/256/roberta-base/HR/pos1_easy_neg1_hard_neg1_seed42_concate32/bs64_32_lr0.00005_G1_SEED/4000.pt/l2_h5"}
DATA_NAME="res_-1"

MAX_LENGTH=1024
MAX_LENGTH_PER_SAMPLE=256
MAX_LENGTH_ALL_DEMOS=-1

PYTHONPATH=${BASE_PATH} CODE_BASE=HF python3 ${BASE_PATH}/icl_train/tools/process_unsup_data.py \
    --unsup-data-path /home/lidong1/dpr-simple/results_1/${DATA_PATH} \
    --unsup-data-name ${DATA_NAME} \
    --processed-unsup-data-path ${BASE_PATH}/icl_train/unsup_data/${DATA_PATH}/${DATA_NAME}/${MAX_LENGTH_PER_SAMPLE}_${MAX_LENGTH}_${MAX_LENGTH_ALL_DEMOS} \
    --model-config ${BASE_PATH}/icl_train/results/gpt2-large \
    --max-length ${MAX_LENGTH} \
    --max-length-per-sample ${MAX_LENGTH_PER_SAMPLE} \
    --max-length-all-demos ${MAX_LENGTH_ALL_DEMOS} \
    --data-process-workers 64 \
    --no-extend-save-path \
    --end-token "2<n>"
    # --replace-return-with-space