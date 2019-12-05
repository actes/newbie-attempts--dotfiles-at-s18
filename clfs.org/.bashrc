set +h
umask 022
CLFS=/mnt/clfs
LC_ALL=POSIX
PATH=${CLFS}/cross-tools/bin:/bin:/usr/bin
export CLFS LC_ALL PATH
unset CFLAGS
export CLFS_HOST="x86_64-cross-linux-gnu"
export CLFS_TARGET="i586-linux-musl"
export CLFS_ARCH="x86"
export CLFS_CPU="i586"
