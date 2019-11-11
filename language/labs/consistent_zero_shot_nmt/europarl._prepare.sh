cd /dresden/users/jz704/language

tmux setenv CUDA_VISIBLE_DEVICES 4,5,6,7

#download
./language/labs/consistent_zero_shot_nmt/scripts/download_and_preproc_europarl.sh \
--data-dir=/dresden/users/jz704/data \
--dataset-name=europarl \
--model-name=basic_multilingual_nmt \
--problem-name=translate_europarl_nonoverlap \
--output-dir=/dresden/users/jz704/results


#datagen

./language/labs/consistent_zero_shot_nmt/scripts/datagen_europarl.sh \
--data-dir=/dresden/users/jz704/data \
--dataset-name=europarl \
--model-name=basic_multilingual_nmt \
--problem-name=translate_europarl_nonoverlap \
--output-dir=/dresden/users/jz704/results


./language/labs/consistent_zero_shot_nmt/scripts/run_nmt_experiment.sh \
    --data-dir=/dresden/users/jz704/data \
    --dataset-name=europarl \
    --model-name=basic_multilingual_nmt \
    --problem-name=translate_europarl_nonoverlap \
    --output-dir=/dresden/users/jz704/results 2>&1  | tee  ~/exp_result/europarl_basic 


./language/labs/consistent_zero_shot_nmt/scripts/run_nmt_experiment.sh \
    --data-dir=/dresden/users/jz704/data \
    --dataset-name=europarl \
    --model-name=agreement_multilingual_nmt \
    --conf-name=ag_gnmt_luong_att \
    --problem-name=translate_europarl_nonoverlap \
    --output-dir=/dresden/users/jz704/results \
    --gpu-num=3 2>&1  | tee ~/exp_result/europarl_agree 