#
# MIT License
#
# Copyright(c) 2011-2020 The Maintainers of Nanvix
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
#

#===============================================================================
# Target Configuration
#===============================================================================

export TARGET    ?= qemu-arm64
export PROCESSOR := arm64
export CLUSTER   := arm64-cluster
export CORE      := arm64-core

export CFLAGS := -D __qemu_arm64__      # Target
export CFLAGS += -D __arm64__         # Processor
export CFLAGS += -D __arm64_cluster__ # Cluster
export CFLAGS += -D __arm64_core__          # Core

#===============================================================================
# Toolchain Configuration
#===============================================================================

# Toolchain Directory
export TOOLCHAIN_DIR ?= /home/josef/opt/cross64/bin/

# Toolchain
export CC := $(TOOLCHAIN_DIR)/aarch64-elf-gcc
export LD := $(TOOLCHAIN_DIR)/aarch64-elf-ld
export AR := $(TOOLCHAIN_DIR)/aarch64-elf-ar

# Timeout Variable
export TIMEOUT ?= 120

# Compiler Options
export CFLAGS += -march=armv8-a -mabi=lp64 -mtune=cortex-a53
export CFLAGS += -ffunction-sections -fdata-sections
export CFLAGS += -nostdlib -nostdinc -ffreestanding
export CFLAGS += -pedantic-errors
export CFLAGS += -Wstack-usage=4096
export CFLAGS += -Wno-error=type-limits
export CFLAGS += -D __HAS_HW_DIVISION=1 -D__HAS_HW_MULTIPLICATION=1

# Linker Options
export LDFLAGS := -march=armv8-a -mabi=lp64 -mtune=cortex-a53
export LDFLAGS += -Wl,--nmagic -Wl,--gc-sections
export LDFLAGS += -nostdlib -nostdinc -ffreestanding

# Suffix for Objects
export OBJ_SUFFIX := qemu-arm64

#===============================================================================
# Libraries
#===============================================================================

export THEIR_LIBS := -lgcc
export LIBLWIP :=
