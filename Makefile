# Makefile
TREE_ROOT := $(shell pwd)
BASE_DIR := $(TREE_ROOT)
LIB_NAME ?= rest
#PROJECT_EXT_DEPEND ?= $(BASE_DIR)/libjson
INC_DIRS += $(sort $(foreach i, $(PROJECT_EXT_DEPEND), $(dir $(shell find $(i) -name \*.$(H_EXT) ))))
LIB_DIRS += $(sort $(foreach i, $(PROJECT_EXT_DEPEND), $(dir $(shell find $(i) -name \*.$(LIB_EXT) ))))
include common.mk
