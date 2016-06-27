#!/bin/bash
# run in <gem5>/
# first arg is num of cpts to profile, no need to specify -r
# example usage: ./profile_checkpoints.sh 200 -s 2000000 --rel-max-tick=5000000 --caches --l2cache --checkpoint-dir=/usr/local/google/home/cuiwl/gem5/m5out/linpack_cpts/run_100

dir="stats_$(date +%Y%m%d_%H%M%S)"
mkdir "m5out/$dir"

num_cpts=$1

shift

args=$@

echo "Profiling $num_cpts cpts..."
echo "Running with these addtional arguments: $args..."

for i in $(seq 1 $num_cpts); do
  M5_PATH=. build/ARM/gem5.opt configs/example/fs.py -r $i --restore-with-cpu=atomic --mem-type=SimpleMemory --os-type=android-kitkat --disk-image=myimage.img --machine-type=VExpress_EMM --dtb-filename=vexpress-v2p-ca15-tc1-gem5.dtb -n 1 --mem-size=1800MB --script=/usr/local/google/home/cuiwl/gem5/configs/boot/aaa $args

  echo "Moving stats to m5out/$dir/"

  mv "m5out/stats.txt" "m5out/$dir/stats_$i.txt"

done
