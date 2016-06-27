#!/bin/bash

gem5_home=/usr/local/google/home/cuiwl/gem5

rm $gem5_home/binaries/vexpress-v2p-ca15-tc1-gem5.dtb
rm $gem5_home/binaries/vmlinux.aarch32.ll_20131205.0-gem5

rm $gem5_home/disks/myimage.img

echo $1
echo $2
echo $3

ln -s $1 $gem5_home/binaries/vexpress-v2p-ca15-tc1-gem5.dtb
ln -s $2 $gem5_home/binaries/vmlinux.aarch32.ll_20131205.0-gem5

ln -s $3 $gem5_home/disks/myimage.img

M5_PATH=. build/ARM/gem5.opt configs/example/fs.py --cpu-type=atomic --mem-type=SimpleMemory --os-type=android-kitkat --disk-image=myimage.img --machine-type=VExpress_EMM --dtb-filename=vexpress-v2p-ca15-tc1-gem5.dtb -n 1 --mem-size=1800MB --script=/usr/local/google/home/cuiwl/gem5/configs/boot/aaa
