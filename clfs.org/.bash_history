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
