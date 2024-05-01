export KBUILD_BUILD_HOST="picasso09" #edit nama mu
export KBUILD_BUILD_USER="picasso" #edit nama mu
export PATH="$(pwd)/clang/bin:$PATH"
export USE_CCACHE=1
export CCACHE_EXEC=/usr/bin/ccache
    make -j$(nproc --all) O=out ARCH=arm64 \
			  oppo6765_defconfig # masukkan nama defconfig hp mu seperti <device>_defconfig
    make -j16 ARCH=arm64 O=out \
                          HOSTCC="ccache clang" \
                          HOSTCXX="ccache clang++" \
                          CC="ccache clang" \
                          LD=ld.lld \
                          AR=llvm-ar \
                          NM=llvm-nm \
                          OBJCOPY=llvm-objcopy \
                          OBJDUMP=llvm-objdump \
                          READELF=llvm-readelf \
                          OBJSIZE=llvm-size \
                          STRIP=llvm-strip \
                          CROSS_COMPILE=aarch64-linux-gnu- \
                          CROSS_COMPILE_ARM32=arm-linux-gnueabi-
