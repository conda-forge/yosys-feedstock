#!/bin/bash

set -e
set -x

cmake -S . -B build ${CMAKE_ARGS} -DCMAKE_BUILD_TYPE=Release
cmake --build build --parallel "${CPU_COUNT:-2}"
cmake --install build
