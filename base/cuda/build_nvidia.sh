!/usr/bin/env sh

chmod +x cuda_*_linux.run

cuda_*_linux.run --tar mxvf
./run_files/cuda-linux64-rel-*.run -noprompt

rm -rf cuda_*_linux.run \
   /run_files \
   InstallUtils.pm \
   cuda-installer.pl \
   uninstall_cuda.pl
