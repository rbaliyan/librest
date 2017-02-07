# Makefile

# Project Directory Name
PROJECT_DIR:=$(shell basename $(CURDIR))

# Peoject Name, Name of current Directory
PROJECT_NAME ?= $(PROJECT_DIR)

# Project dependency
TARGET_EXT_DEPEND ?= $(PROJECT_EXT_DEPEND)

# Directory Structure
SRC_DIR ?= src
OBJ_DIR ?= obj
LIB_DIR ?= lib
BIN_DIR ?= bin
INC_DIR ?= inc

# Execuatbles
CC := gcc
CPP := g++
AR := ar
RM := rm -rf
CSCOPE := cscope
TAG := etags
MAKE := make

# Supported Extension
C_EXT := c
H_EXT := h
OBJ_EXT := o
LIB_EXT := a
LIB_PREFIX := lib
DEPEND_EXT := d

# Get OS Name
OS := $(shell uname)

# If SRC dir is empty search in Current Directory
ifeq "$(wildcard $(SRC_DIR) )" ""
	# src does not exists or is empty use current directory
	SRC_DIR :=.
	C_FILES := $(wildcard $(SRC_DIR)/*.$(C_EXT))
else
	# C Langauge
	C_FILES := $(shell find $(SRC_DIR) -name \*.$(C_EXT) )
endif

# If INC dir is empty search in Current Directory
ifeq "$(wildcard $(INC_DIR) )" ""
	INC_DIRS +=.
else
	# Include dirs
	INC_DIRS += $(sort $(dir $(shell find $(INC_DIR) -name \*.$(H_EXT) )))
endif

# Object Files and dependency files
C_OBJFILES := $(patsubst $(SRC_DIR)/%.$(C_EXT),$(OBJ_DIR)/%.$(OBJ_EXT),$(C_FILES))
C_DEPEND_FILES := $(patsubst %.$(OBJ_EXT),%.$(DEPEND_EXT),$(C_OBJFILES))


# Objects
OBJECTS := $(C_OBJFILES)

# Depend Files
DEPEND_FILES := $(C_DEPEND_FILES)

############################################
# Create obj and bin Dirs
############################################
OBJ_DIRS:=$(dir $(OBJECTS))

ifneq  ("$(OBJ_DIRS)","")
    $(shell mkdir -p $(OBJ_DIRS))
endif

ifneq  ("$(BIN_DIR)","")
    $(shell mkdir -p $(BIN_DIR))
endif


# If Verbose mode is not requsted then silent output
ifeq (,$(V))
.SILENT:
endif


###########################################
# Flags
############################################
# Optimization level
OPTIMIZE := -O0

# Debug Flag
DEBUG := -g

GLOBAL_CFLAG += -Wall -Werror

LIB_FLAG +=$(addprefix -L,$(LIB_DIRS))
LIB_FLAG +=$(addprefix -l,$(LIBS))

INCLUDE_FLAG = $(addprefix -I,$(INC_DIRS))
GLOBAL_CFLAG += $(INCLUDE_FLAG)

# Target Binary
ifeq (,$(TARGET_NAME))
    ifneq (,$(LIB_NAME))
        LIB_FULL_NAME ?= $(LIB_PREFIX)$(LIB_NAME).$(LIB_EXT)
        TARGET ?= $(LIB_DIR)/$(LIB_FULL_NAME)
    else
        TARGET_NAME := $(BIN_DIR)/$(PROJECT_NAME)
		TARGET ?= $(BIN_DIR)/$(TARGET_NAME)
		BIN_NAME = $(TARGET_NAME)
    endif
else
    TARGET ?= $(BIN_DIR)/$(TARGET_NAME)
	BIN_NAME = $(TARGET_NAME)
endif

# OS Specific Flags
ifeq ($(OS),Darwin)
    GLOBAL_CFLAG += '-DFUNOPEN_SUPPORT' '-DDARWIN_SYS'
else
    ifeq ($(OS),Linux)
        GLOBAL_CFLAG += '-DFMEMOPEN_SUPPORT'
    endif
endif

#Disable logging
ifneq (,$(TRACE_LEVEL))
    GLOBAL_CFLAG+='-D_TRACE_LEVEL_'=$(TRACE_LEVEL)
else
    GLOBAL_CFLAG+='-D_TRACE_LEVEL_'=3
endif

CFLAGS += $(GLOBAL_CFLAG)
LDFLAGS += $(LIB_FLAG)

############################################
# Targets
############################################
all: release lib bin $(TARGET)
release: CFLAGS += $(OPTIMIZE)
release:$(TARGET) 

debug: CFLAGS += $(DEBUG)
debug: $(TARGET)

lib bin : $(TARGET)
clean : $(TARGET_EXT_DEPEND)

# Include Depend Files
-include $(DEPEND_FILES)

$(TARGET):$(TARGET_EXT_DEPEND)

###########################################
# Rules
###########################################
#Compile C files
$(C_OBJFILES): $(OBJ_DIR)/%.$(OBJ_EXT): $(SRC_DIR)/%.$(C_EXT)
	@$(CC) -E $(CFLAGS) $< > $(OBJ_DIR)/$*.E
	$(CC) $(CFLAGS) -c $< -o $@
	@$(CC) -MM $(CFLAGS) $< > $(OBJ_DIR)/$*.d
	@mv -f $(OBJ_DIR)/$*.d $(OBJ_DIR)/$*.d.tmp;
	@sed -e 's|.*:|$(OBJ_DIR)/$*.o:|' < $(OBJ_DIR)/$*.d.tmp > $(OBJ_DIR)/$*.d
	@$(RM) $(OBJ_DIR)/$*.d.tmp

# Library File
$(LIB_DIR)/%.$(LIB_EXT) : $(OBJECTS)
	echo $(OBJECTS)
	mkdir -p $(LIB_DIR);
	$(AR) $(ARFLAGS) $@ $(OBJECTS)

# Executable file
$(BIN_DIR)/$(TARGET_NAME):  $(OBJECTS)
	$(CC) $(OBJECTS) $(LDFLAGS) -o $@

# Clean Everything
clean cleanDebug cleanRelease:
	@echo "Remove Files"
	$(RM) $(OBJ_DIR)
	$(RM) $(LIB_DIR)
	$(RM) $(BIN_DIR)

# Generate Tag files
# ctags
tags: cscope $(C_FILES) $(CPP_FILES) $(ASM_FILES)
	$(TAG) $(TAG_FLAGS) $(C_FILES) $(CPP_FILES) $(ASM_FILES)

# cscope tags
cscope : $(C_FILES) $(CPP_FILES) $(ASM_FILES)
	$(CSCOPE) $(CSCOPE_FLAGS)

$(TARGET_EXT_DEPEND)::
	$(MAKE) -C $@ $(MAKECMDGOALS)

.PHONY: clean install connect tags cscope $(TARGET_EXT_DEPEND)
