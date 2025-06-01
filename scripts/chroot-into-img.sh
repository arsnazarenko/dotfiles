#!/bin/bash

IMG_ROOT_OFFSET=31457280
TMP_DIR="${TMP_DIR:-./tmp-rootfs}"
QEMU_BIN="${QEMU_BIN:-/bin/qemu-riscv64-static}"

if [ -z "$1" ]
then 
    echo "Error: argument required."
    echo "Run: ./chroot-into-img.sh <image_file.img>"
    exit 1
fi

mkdir -p ${TMP_DIR} 

mount -o loop,offset=${IMG_ROOT_OFFSET} $1 ${TMP_DIR}
mount -t proc none ${TMP_DIR}/proc
mount --bind /dev ${TMP_DIR}/dev
mount --bind /sys ${TMP_DIR}/sys

if [ ! -f ${TMP_DIR}/bin/qemu-riscv64-static ]
then
    cp ${QEMU_BIN} ${TMP_DIR}/bin/
fi

chroot ${TMP_DIR} ${QEMU_BIN} /bin/bash

# After exit from chroot automaticly unmounted and removed
umount -R ${TMP_DIR} 
rm -rf ./${TMP_DIR}
