MAKE := make
LIB_NAME ?= rest
LIBS ?= $(LIB_NAME) json curl
GLOBAL_CFLAG += $(shell curl-config --cflags)
LIB_FLAG += $(shell curl-config --libs)
PROJECT_EXT_DEPEND ?= $(BASE_DIR) $(BASE_DIR)/libjson
include $(BASE_DIR)/common.mk
