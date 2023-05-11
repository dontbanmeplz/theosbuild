include $(THEOS)/makefiles/common.mk

TWEAK_NAME = RedRectangle

RedRectangle_FILES = Tweak.x
RedRectangle_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
