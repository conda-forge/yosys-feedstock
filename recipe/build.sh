#!/bin/bash

set -e
set -x

cmake -S . -B build ${CMAKE_ARGS} -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_PREFIX_PATH="${PREFIX}" \
    -DYOSYS_ENABLE_HOMEBREW=OFF \
    -DYOSYS_USE_BUNDLED_LIBS=OFF \
    -DCMAKE_REQUIRE_FIND_PACKAGE_fmt=ON \
    -DCMAKE_REQUIRE_FIND_PACKAGE_Boost=ON \
    -DCMAKE_REQUIRE_FIND_PACKAGE_tomlplusplus=ON
cmake --build build --parallel "${CPU_COUNT:-2}"
cmake --install build
