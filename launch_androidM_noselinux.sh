#!/bin/bash

android_home=/usr/local/google/home/cuiwl/android-M
kernel_home=/usr/local/google/home/cuiwl/linux-linaro-tracking-gem5-noselinux

./startover.sh $kernel_home/vexpress-v2p-ca15-tc1-gem5.dtb $kernel_home/vmlinux $android_home/myimage.img
