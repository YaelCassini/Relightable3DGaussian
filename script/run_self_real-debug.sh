#!/bin/bash

root_dir="../Data/SelfDataset/"
list="Liujing07"

for i in $list; do
python train.py --eval \
-s ${root_dir}${i} \
-m output/SelfDataset/${i}-opacity1.0-3/3dgs \
--lambda_normal_render_depth 0.01 \
--lambda_mask_entropy 0.1 \
--densification_interval 500 \
--save_training_vis \
--gui

python train.py --eval \
-s ${root_dir}${i} \
-m output/SelfDataset/${i}-opacity1.0-3/neilf \
-c output/SelfDataset/${i}-opacity1.0-3/3dgs/chkpnt30000.pth \
-t neilf \
--lambda_normal_render_depth 0.01 \
--use_global_shs \
--finetune_visibility \
--iterations 40000 \
--test_interval 1000 \
--checkpoint_interval 2500 \
--lambda_mask_entropy 0.1 \
--lambda_light 0.01 \
--lambda_base_color 0.005 \
--lambda_base_color_smooth 0.006 \
--lambda_metallic_smooth 0.002 \
--lambda_roughness_smooth 0.002 \
--lambda_visibility 0.1 \
--save_training_vis \
--gui
done