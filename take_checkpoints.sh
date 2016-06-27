#!/bin/bash
# run in <gem5>/
# example usage: ./take_checkpoints.sh -r 2 --take-checkpoints=6359694026210500,10000000 --max-checkpoints=200 --checkpoint-dir=/usr/local/google/home/cuiwl/gem5/m5out/base_cpts --stat-prefix linpack

dir="cpts_$(date +%Y%m%d_%H%M%S)"
args=$@

echo "Running with these addtional arguments: $args..."

M5_PATH=. build/ARM/gem5.opt configs/example/fs.py --restore-with-cpu=atomic --mem-type=SimpleMemory --os-type=android-kitkat --disk-image=myimage.img --machine-type=VExpress_EMM --dtb-filename=vexpress-v2p-ca15-tc1-gem5.dtb -n 1 --mem-size=1800MB --script=/usr/local/google/home/cuiwl/gem5/configs/boot/aaa $args

cd /usr/local/google/home/cuiwl/gem5/m5out/

mkdir $dir

echo "Moving all cpts to m5out/$dir/"

mv cpt.* $dir/
