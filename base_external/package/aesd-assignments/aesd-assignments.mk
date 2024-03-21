
##############################################################
#
# AESD-ASSIGNMENTS
#
##############################################################

#TODO: Fill up the contents below in order to reference your assignment 3 git contents
AESD_ASSIGNMENTS_VERSION = 'f53a169a5e8ff0c3083f18e4bddb90d64e7c7063'
# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
AESD_ASSIGNMENTS_SITE = 'git@github.com:cu-ecen-aeld/assignments-3-and-later-Youssef-74.git'
AESD_ASSIGNMENTS_SITE_METHOD = git
AESD_ASSIGNMENTS_GIT_SUBMODULES = YES

# edit number one for assignment-5-part-2: cross compile an aesdsocket 
# application for the target by running make from the server subdirectory.

define AESD_ASSIGNMENTS_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/finder-app all
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/server STATIC_LIBS=true all
endef

#$(INSTALL) -m 0755 $(@D)/server/libmanipulate_file.so $(TARGET_DIR)/bin/manipulate_file.so 
#$(INSTALL) -m 0755 $(@D)/server/libsignal_func.so $(TARGET_DIR)/bin/signal_func.so

# TODO add your writer, finder and finder-test utilities/scripts to the installation steps below
# edit number two for assignment-5-part-2: install the cross compiled aesdsocket program to /usr/bin/
# edit number three for assignment-5-part-2: install the aesdsocket-start-stop script to /etc/init.d/S99aesdsocket

define AESD_ASSIGNMENTS_INSTALL_TARGET_CMDS
	$(INSTALL) -d $(@D)/conf/ $(TARGET_DIR)/etc/finder-app/conf/
	$(INSTALL) -m 0755 $(@D)/conf/* $(TARGET_DIR)/etc/finder-app/conf/
	$(INSTALL) -m 0755 $(@D)/assignment-autotest/test/assignment4/* $(TARGET_DIR)/bin
	$(INSTALL) -m 0755 $(@D)/finder-app/writer $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0755 $(@D)/finder-app/finder.sh $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0755 $(@D)/finder-app/finder-test.sh $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0755 $(@D)/server/aesdsocket $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0755 -D $(@D)/server/aesdsocket-start-stop $(@D)/server/S99aesdsocket
	$(INSTALL) -m 0755 $(@D)/server/S99aesdsocket $(TARGET_DIR)/etc/init.d
endef

$(eval $(generic-package))
