ll
mv .bashrc 1.bashr
cat > ~/.bashrc << "EOF"
set +h
umask 022
LFS=/mnt/lfs
LC_ALL=POSIX
LFS_TGT=$(uname -m)-lfs-linux-gnu
PATH=/tools/bin:/bin:/usr/bin
export LFS LC_ALL LFS_TGT PATH
EOF

set|less
mc
mc
cd /mnt/lfs/sources/
ll
ls -l
xz
xz binutils-2.32.tar.xz
xz --decompress binutils-2.32.tar.xz
ls -l
tar xvf binutils-2.32.tar.xz
ls -l
rm binutils-2.32.tar 
tar xvf binutils-2.32.tar.xz
ls -l
cd /mnt/lfs/sources/
tar xvf binutils-2.32.tar.xz
history 
mc
history 
cd /mnt/lfs/sources/
cd binutils-2.32/
mkdir -v build
cd build/
../configure --prefix=/tools                         --with-sysroot=$LFS                     --with-lib-path=/tools/lib              --target=$LFS_TGT                       --disable-nls                           --disable-werror
ll
ls
time make
case $(uname -m) in   x86_64) mkdir -v /tools/lib && ln -sv lib /tools/lib64 ;; esac
time make install
cd ..
cd ..
ll
ls
tar xvf linux-5.2.8.tar.xz 
ll
ls
du -sm  binutils-2.32
rm -r   binutils-2.32
rm -rf   binutils-2.32
du -sm  binutils-2.32
cd linux-5.2.8/
make mrproper
make INSTALL_HDR_PATH=dest headers_install
cp -rv dest/include/* /tools/include
mc
cp -rv dest/include/* /tools/include
mc
history 
mc
history -a
ls -la ~
chmod a+r ~/.bash_history 
ls -la ~
history -a
cd ..
ll
ls
rm -rf   linux-5.2.8
history -a
