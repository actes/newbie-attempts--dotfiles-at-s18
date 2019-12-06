cat > ~/.bash_profile << "EOF"
exec env -i HOME=${HOME} TERM=${TERM} PS1='\u:\w\$ ' /bin/bash
EOF

cat > ~/.bashrc << "EOF"
set +h
umask 022
CLFS=/mnt/clfs
LC_ALL=POSIX
PATH=${CLFS}/cross-tools/bin:/bin:/usr/bin
export CLFS LC_ALL PATH
EOF

set|less
ll
ls -l
ls -la
set|less
unset CFLAGS
echo unset CFLAGS >> ~/.bashrc
export CLFS_HOST=$(echo ${MACHTYPE} | sed "s/-[^-]*/-cross/")
export CLFS_TARGET=[target triplet]
export CLFS_TARGET=i586-linux-musl
export CLFS_CPU=i586
export CLFS_ARCH="x86"
echo export CLFS_HOST=\""${CLFS_HOST}\"" >> ~/.bashrc
echo export CLFS_TARGET=\""${CLFS_TARGET}\"" >> ~/.bashrc
echo export CLFS_ARCH=\""${CLFS_ARCH}\"" >> ~/.bashrc
echo export CLFS_CPU=\""${CLFS_CPU}\"" >> ~/.bashrc
cat .bashrc 
set|less
history -a
mkdir -p ${CLFS}/cross-tools/${CLFS_TARGET}
ln -sfv . ${CLFS}/cross-tools/${CLFS_TARGET}/usr
ls -l 
ls -l $CLFS
cd $CLFS
cd sources/
ll
ls
tar xvf linux-4.9.22.tar.xz 
cd linux-4.9.22
make mrproper
make ARCH=${CLFS_ARCH} headers_check
make ARCH=${CLFS_ARCH} INSTALL_HDR_PATH=${CLFS}/cross-tools/${CLFS_TARGET} headers_install
history -a
chmod a+r ~/.bash*
history -a
cd ..
rm -rf linux-4.9.22
tar xvf binutils-2.27.tar.bz2 
cd binutils-2.27
mkdir -v ../binutils-build
cd ../binutils-build
../binutils-2.27/configure    --prefix=${CLFS}/cross-tools    --target=${CLFS_TARGET}    --with-sysroot=${CLFS}/cross-tools/${CLFS_TARGET}    --disable-nls    --disable-multilib
make configure-host
make
make install
cd ..
rm -rf binutils-build/
rm -rf binutils-2.27
tar xvf gcc-6.2.0.tar.bz2 
cd gcc-6.2.0
tar xf ../mpfr-3.1.4.tar.bz2
mv -v mpfr-3.1.4 mpfr
tar xf ../gmp-6.1.1.tar.bz2
mv -v gmp-6.1.1 gmp
tar xf ../mpc-1.0.3.tar.gz
mv -v mpc-1.0.3 mpc
mkdir -v ../gcc-build
cd ../gcc-build
echo ../gcc-6.2.0/configure   --prefix=${CLFS}/cross-tools   --build=${CLFS_HOST}   --host=${CLFS_HOST}   --target=${CLFS_TARGET}   --with-sysroot=${CLFS}/cross-tools/${CLFS_TARGET}   --disable-nls    --disable-shared   --without-headers   --with-newlib   --disable-decimal-float   --disable-libgomp   --disable-libmudflap   --disable-libssp   --disable-libatomic   --disable-libquadmath   --disable-threads   --enable-languages=c   --disable-multilib   --with-mpfr-include=$(pwd)/../gcc-6.2.0/mpfr/src   --with-mpfr-lib=$(pwd)/mpfr/src/.libs   --with-arch=${CLFS_CPU}
history -a
../gcc-6.2.0/configure   --prefix=${CLFS}/cross-tools   --build=${CLFS_HOST}   --host=${CLFS_HOST}   --target=${CLFS_TARGET}   --with-sysroot=${CLFS}/cross-tools/${CLFS_TARGET}   --disable-nls    --disable-shared   --without-headers   --with-newlib   --disable-decimal-float   --disable-libgomp   --disable-libmudflap   --disable-libssp   --disable-libatomic   --disable-libquadmath   --disable-threads   --enable-languages=c   --disable-multilib   --with-mpfr-include=$(pwd)/../gcc-6.2.0/mpfr/src   --with-mpfr-lib=$(pwd)/mpfr/src/.libs   --with-arch=${CLFS_CPU}
make all-gcc all-target-libgcc
gcc --version
history -a
history 
cd ..
rm -rf gcc-6.2.0
rm -rf gcc-build/
ls -la
history -a
history -a
