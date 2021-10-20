#! /usr/bin/env bash

mkdir build

pushd build

echo ${PKG_VERSION}
dfdfsdf

cmake -GNinja -DCMAKE_BUILD_WITH_INSTALL_RPATH=ON -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_LIBDIR=${PREFIX}/lib -DCMAKE_INSTALL_PREFIX=${PREFIX}  -DKALDI_BUILD_TEST=OFF  -DMATHLIB=OpenBLAS -DOVERRIDE_KALDI_VERSION=${PKG_VERSION} ..

cmake --build . --target install --config Release -- -j ${CPU_COUNT}

ls lib/ | grep ^libfst.*so$ | xargs -d"\n" rm #  Clean up libfst.so style files to prevent compatibility issues with openfst package

popd
