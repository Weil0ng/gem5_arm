#!/bin/bash

M5_PATH=. build/ARM/gem5.opt configs/example/fs.py --restore-with-cpu=atomic --caches --l2cache --mem-type=SimpleMemory --os-type=android-kitkat --disk-image=myimage.img --machine-type=VExpress_EMM --dtb-filename=vexpress-v2p-ca15-tc1-gem5.dtb -n 1 --mem-size=1800MB --script=/usr/local/google/home/cuiwl/gem5/configs/boot/aaa -r $1 --checkpoint-dir=$2
