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

export TARGET    ?= mppa256
export PROCESSOR := bostan
export CLUSTER   := k1b-cluster
export CORE      := k1b

export CFLAGS := -D __mppa256__ # Target
export CFLAGS += -D __bostan__  # Processor
export CFLAGS += -D __k1b__     # Cluster and Core

#===============================================================================
# Toolchain Configuration
#===============================================================================

# Toolchain Directory
export TOOLCHAIN_DIR ?= /usr/local/k1tools

# Toolchain
export CC := $(TOOLCHAIN_DIR)/bin/k1-gcc
export LD := $(TOOLCHAIN_DIR)/bin/k1-gcc
export AR := $(TOOLCHAIN_DIR)/bin/k1-ar

# Timeout Variable
export TIMEOUT ?= 600

# Compiler Options
export CFLAGS += -mos=bare -march=k1b -mboard=developer
export CFLAGS += -nostdlib
export CFLAGS += -D __HAS_HW_DIVISION=1 -D__HAS_HW_MULTIPLICATION=1
export CFLAGS += -D __GLIBC_BUG__

# Linker Options
export LDFLAGS := -nostdlib -ffreestanding

#===============================================================================
# Libraries
#===============================================================================

export THEIR_LIBS := -lc -lgloss
export THEIR_LIBS += -Wl,--whole-archive -lmOS -Wl,--no-whole-archive
export THEIR_LIBS += -lvbsp -mhypervisor -lboard -lmppa_fdt -lcore -lc

export LIBLWIP :=
