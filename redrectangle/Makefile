TARGET = iphone:clang:15.5:15.0

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = redrectangle

redrectangle_FILES = rraRootListController.m
redrectangle_FRAMEWORKS = UIKit
redrectangle_PRIVATE_FRAMEWORKS = Preferences
redrectangle_INSTALL_PATH = /Library/PreferenceBundles
redrectangle_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/bundle.mk