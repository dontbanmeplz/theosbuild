TARGET = iphone:clang:15.5:15.0
ARCHS = arm64 arm64e

DEBUG=0
FINALPACKAGE = 1
INSTALL_TARGET_PROCESSES = Preferences
THEOS_PACKAGE_SCHEME=rootless

export THEOS_DEVICE_IP=192.168.8.210
export THEOS_DEVICE_PORT=22

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = RedRectangle

RedRectangle_FILES = Tweak.x
RedRectangle_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
SUBPROJECTS += redrectangle
include $(THEOS_MAKE_PATH)/aggregate.mk
