tmux setenv CUDA_VISIBLE_DEVICES 0,2,3,6
CUDA_VISIBLE_DEVICES=0,2,3,6

./language/labs/consistent_zero_shot_nmt/scripts/datagen_uncorpus.sh \
~/data/uncorpus \
~/data/tmp \
~/data/3lang-exp \
~/data/3lang-exp \
~/data/4lang-exp \
~/data/4lang-exp