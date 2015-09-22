#
# Define ARM tools
#


# Define the compiler/tools prefix
GCC_PREFIX ?= xtensa-lx106-elf-

include $(COMMON_BUILD)/common-tools.mk


#
# default flags for targeting ARM
#

# C compiler flags
CFLAGS +=  -g3 -gdwarf-2 -Os

# C++ specific flags
CPPFLAGS += -fno-exceptions -fno-rtti -fcheck-new

CONLYFLAGS +=

ASFLAGS +=  -g3 -gdwarf-2

LDFLAGS += -nostartfiles -Xlinker --gc-sections

ifeq ($(COMPILE_LTO),y)
CFLAGS += -flto
LDFLAGS += -flto -Os -fuse-linker-plugin
endif

# Check if the compiler version is the minimum required
lx106_gcc_version:=$(shell $(CC) --version | head -n 1)
lx106_gcc_version:=$(strip $(subst xtensa-lx106-elf-gcc,,$(lx106_gcc_version)))
lx106_expected_version:=4.8.2
quote="
lt=\<
dollar=$$
#$(info result $(shell test $(quote)$(lx106_gcc_version)$(quote) $(lt) $(quote)$(expected_version)$(quote);echo $$?))
ifeq ($(shell test $(quote)$(lx106_gcc_version)$(quote) $(lt) $(quote)$(expected_version)$(quote); echo $$?),0)
     $(error "Xtensa gcc version $(expected_version) or later required, but found $(lx106_gcc_version)")
endif


ifeq ($(shell test $(quote)$(lx106_gcc_version)$(quote) $(lt) $(quote)4.9.0$(quote); echo $$?),0)
     NANO_SUFFIX=_s
endif
