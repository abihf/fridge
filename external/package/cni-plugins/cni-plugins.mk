################################################################################
#
# cni-plugins
#
################################################################################

CNI_PLUGINS_VERSION = 1.1.1
CNI_PLUGINS_SITE = $(call github,containernetworking,plugins,v$(CNI_PLUGINS_VERSION))

CNI_PLUGINS_LICENSE = Apache-2.0
CNI_PLUGINS_LICENSE_FILES = LICENSE

#CNI_PLUGINS_DEPENDENCIES = host-pkgconf
CNI_PLUGINS_GOMOD = github.com/containernetworking/plugins

CNI_PLUGINS_BUILD_TARGETS = plugins/main/bridge plugins/ipam/host-local  plugins/meta/portmap

CNI_PLUGINS_INSTALL_BINS = $(notdir $(CNI_PLUGINS_BUILD_TARGETS))

define CNI_PLUGINS_INSTALL_TARGET_CMDS
	$(foreach d,$(CNI_PLUGINS_INSTALL_BINS),\
		$(INSTALL) -D -m 0755 $(@D)/bin/$(d) $(TARGET_DIR)/opt/cni/bin/$(d)
	)
endef

$(eval $(golang-package))
