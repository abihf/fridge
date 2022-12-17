hash=$(curl -Ls "https://raw.githubusercontent.com/raspberrypi/firmware/master/extra/git_hash")

sed -i "/^BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION=/c\\BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION=\"\$(call github,raspberrypi,linux,$hash)/linux-$hash.tar.gz\"" 4/.config external/configs/rpi4_fridge_defconfig
