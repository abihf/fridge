#!/bin/sh

set -u
set -e

sed -i 's#:/root:#:/storage/root:#' "${TARGET_DIR}/etc/passwd"
#depmod -a -b "${TARGET_DIR}" $LINUX_VERSION_PROBED
depmod -a -b ${TARGET_DIR} $(ls ${TARGET_DIR}/lib/modules)

