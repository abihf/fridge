################################################################################
#
# nerdctl
#
################################################################################

NERDCTL_VERSION = 0.18.0
NERDCTL_SITE = $(call github,containerd,nerdctl,v$(NERDCTL_VERSION))

NERDCTL_LICENSE = Apache-2.0
NERDCTL_LICENSE_FILES = LICENSE

#NERDCTL_DEPENDENCIES = host-pkgconf

NERDCTL_BUILD_TARGETS = cmd/nerdctl
NERDCTL_GOMOD = github.com/containerd/nerdctl

NERDCTL_LDFLAGS = \
	-X $(NERDCTL_GOMOD)/pkg/version.Version=$(NERDCTL_VERSION)
#	-X $(NERDCTL_GOMOD)/pkg/version.Revision=$(NERDCTL_VERSION) \

NERDCTL_INSTALL_BINS = $(notdir $(NERDCTL_BUILD_TARGETS))

define NERDCTL_POST_INSTALL_TARGET_HOOKS
	ln -sf nerdctl $(TARGET_DIR)/usr/bin/docker
endef

$(eval $(golang-package))
