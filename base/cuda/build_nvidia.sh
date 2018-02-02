#!/bin/sh

#export TERM='/bin/sh'

#echo $(ls /usr/lib/perl5/core_perl)

chmod +x /cuda/cuda_*_linux.run

./cuda_*_linux.run --toolkit --driver --samples --override --silent

#/cuda/*.run -s -N --no-kernel-module 

#./cuda_*_linux.run --tar mxvf
#copy InstallUtils.pm to /usr/lib/x86_64-linux-gnu/perl-base 

#./run_files/cuda-linux64-rel-*.run -noprompt

#rm -rf cuda_*_linux.run \
#   /run_files \
#   InstallUtils.pm \
#   cuda-installer.pl \
#   uninstall_cuda.pl
