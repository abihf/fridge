#!/bin/sh

set -u
set -e

sed -i 's#:/root:#:/storage/root:#' "${TARGET_DIR}/etc/passwd"
sed -i 's#ssh-keygen -A#ssh-keygen -A -f /storage#' "${TARGET_DIR}/etc/init.d/S50sshd"

${BUILD_DIR}/linux-custom/usr/gen_init_cpio ${BR2_EXTERNAL_FRIDGE_PATH}/boards/rpi4-fridge/initramfs | zstd > ${BINARIES_DIR}/initrd
