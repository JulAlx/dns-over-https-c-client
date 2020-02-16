#
# Copyright (C) 2014 OpenWrt-dist
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=dns-over-https-c-client
PKG_VERSION:=1.00
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/sfionov/dns-over-https-c-client.git
#PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=master
#PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_SOURCE_VERSION).tar.gz
PKG_MAINTAINER:=Sergey Fionov <https://github.com/sfionov>
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)/$(BUILD_VARIANT)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/dns-over-https-c-client
	SECTION:=net
	CATEGORY:=Network
	TITLE:=DNS over HTTPS client written in C
	URL:=https://github.com/sfionov/dns-over-https-c-client.git
	DEPENDS:=+libevent2 +libopenssl +ca-certificates +zlib
endef

define Package/dns-over-https-c-client/description
Make an alternative to dnscrypt-proxy and cloudflared written in C.
endef

define Build/Prepare
	cmake CMakeLists.txt
endef

#define Package/dns-over-https-c-client/conffiles
#/etc/config/dns-over-https-c-client
#endef


define Package/dns-over-https-c-client/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/dns-over-https-c-client $(1)/usr/sbin
#	$(INSTALL_DIR) $(1)/etc/dns-over-https-c-client
#	$(INSTALL_DATA) ./files/dns-over-https-c-client.template $(1)/etc/dns-over-https-c-client/config.template
endef

$(eval $(call BuildPackage,dns-over-https-c-client))
