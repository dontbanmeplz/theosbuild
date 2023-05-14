
INSTALL_TARGET_PROCESSES = SpringBoard
TARGET = iphone:latest:15.2
include $(THEOS)/makefiles/common.mk

TWEAK_NAME = RedRectangle

RedRectangle_FILES = Tweak.x
RedRectangle_CFLAGS = -fobjc-arc
RedRectangle_LIBRARIES = colorpicker
include $(THEOS_MAKE_PATH)/tweak.mk
SUBPROJECTS += redrectangle
include $(THEOS_MAKE_PATH)/aggregate.mk
