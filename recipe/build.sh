#! /bin/bash

set -e
set -x

# clone abc now that its a submodule
wget https://github.com/YosysHQ/yosys/releases/download/yosys-0.43/abc.tar.gz
tar xfzv abc.tar.gz
mv abc-yosys-experimental abc

if [[ "${target_platform}" == "linux-64" ]]; then
    # expects `gcc`
    ln -s $GCC $BUILD_PREFIX/bin/gcc

    # TODO this doesnt work
    # alias gcc=$CC

    make CONFIG=gcc -j $(nproc)

else
    make CONFIG=clang -j $(sysctl -n hw.physicalcpu)
    
fi


# install
make install
