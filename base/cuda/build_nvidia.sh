!/usr/bin/env sh

wget http://developer.download.nvidia.com/compute/cuda/7.5/Prod/local_installers/cuda_7.5.18_linux.run

chmod +x cuda_*_linux.run

cuda_*_linux.run --tar mxvf
./run_files/cuda-linux64-rel-*.run -noprompt

rm -rf cuda_*_linux.run \
   /run_files \
   InstallUtils.pm \
   cuda-installer.pl \
   uninstall_cuda.pl
