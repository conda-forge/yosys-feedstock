#! /bin/bash

set -e
set -x

# clone abc now that its a submodule
git clone git@github.com:YosysHQ/abc.git
pushd abc
# NOTE: this should match in yosys
git checkout 237d81397fcc85dd3894bf1a449d2955cd3df02d
popd

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
