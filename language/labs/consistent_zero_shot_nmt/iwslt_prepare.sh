cd /dresden/users/jz704/language

tmux setenv CUDA_VISIBLE_DEVICES 0,2,3,6
CUDA_VISIBLE_DEVICES=0,1,2,3
#download and prepare 
./language/labs/consistent_zero_shot_nmt/scripts/download_and_preproc_iwslt2017.sh \
--data-dir=/dresden/users/jz704/data \
--dataset-name=iwslt17-star \
--problem-name=translate_iwslt17_nonoverlap \
--output-dir=/dresden/users/jz704/result

#dategen
./language/labs/consistent_zero_shot_nmt/scripts/datagen_iwslt17.sh \
--data-dir=/dresden/users/jz704/data \
--output-dir=/dresden/users/jz704/results \
--dataset-name=iwslt17-star \
--problem-name=translate_iwslt17_nonoverlap

#task

./language/labs/consistent_zero_shot_nmt/scripts/run_nmt_experiment.sh \
    --data-dir=/dresden/users/jz704/data \
    --dataset-name=iwslt17-star \
    --model-name=basic_multilingual_nmt \
    --problem-name=translate_iwslt17_nonoverlap \
    --gpu-num=4 \
    --output-dir=/dresden/users/jz704/results 2>&1 1 | tee  ~/exp_result/iwslt_basic 

./language/labs/consistent_zero_shot_nmt/scripts/run_nmt_experiment.sh \
    --data-dir=/dresden/users/jz704/data \
    --dataset-name=iwslt17-star \
    --model-name=agreement_multilingual_nmt \
    --conf-name=ag_gnmt_luong_att \
    --problem-name=translate_iwslt17_nonoverlap \
    --gpu-num=4 \
    --output-dir=/dresden/users/jz704/results 2>&1 | tee ~/exp_result/iwslt_agree 