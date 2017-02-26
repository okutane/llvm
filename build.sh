#!/bin/bash

# Exit on failure
set -e

LLVM_CCACHE="$HOME/.ccache"

case `uname` in
    Linux)
        if [[ ! -f "cmake-3.4.3-Linux-x86_64/bin/cmake" ]]; then wget --no-check-certificate http://cmake.org/files/v3.4/cmake-3.4.3-Linux-x86_64.tar.gz && tar -xf cmake-3.4.3-Linux-x86_64.tar.gz; fi
        CMAKE=`pwd`/cmake-3.4.3-Linux-x86_64/bin/cmake
    ;;
    Darwin)
        CMAKE=cmake
    ;;
    *)
        echo Unknown environment: `uname`
        exit 1
    ;;
esac

mkdir build && cd build

$CMAKE -G "Unix Makefiles" \
	-DLLVM_CCACHE_BUILD=ON \
        -DLLVM_CCACHE_SIZE=4G \
        -DLLVM_CCACHE_DIR=$LLVM_CCACHE \
        -DLLVM_TARGETS_TO_BUILD=X86 \
        ..

make -j2 LLVMCore LLVMAsmParser LLVMBitReader LLVMProfileData LLVMMC LLVMMCParser LLVMObject LLVMAnalysis LLVMIRReader LLVMTransformUtils LLVMDebugInfoMSF LLVMDebugInfoCodeView
make -j2 llvm-config llvm-dis

