#
#    kernel/fs/fsstress testcases Makefile.
#
#    Copyright (C) 2009, Cisco Systems Inc.
#
#    This program is free software; you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation; either version 2 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License along
#    with this program; if not, write to the Free Software Foundation, Inc.,
#    51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
#
# Garrett Cooper, July 2009
#

top_srcdir			?= ./fsstress-support/
include $(top_srcdir)/include/mk/env_pre.mk

CPPFLAGS			= -m32 -DNO_XFS -I$(abs_srcdir) -D_LARGEFILE64_SOURCE -D_GNU_SOURCE

# if removed -DNO_XFS, you should unmask the following line
#LDLIBS				+= -lattr
LDLIBS				+= -lpthread -lrt
LDLIBS              += -m32

# XXX (garrcoop): not -Wuninitialized clean.
CPPFLAGS			+= -Wno-error
CPPFLAGS			+= -O0


#mkfile_path2 := $(abspath $(lastword $(MAKEFILE_LIST)))
#current_dir2 := $(notdir $(patsubst %/,%,$(dir $(mkfile_path2))))

current_dir2 = $(shell pwd)

LDLIBS += -static 

FILTER_OUT_MAKE_TARGETS := Makefile ski-barriers ski-hyper ski-params ski-test sync-test

include $(top_srcdir)/include/mk/generic_leaf_target.mk

$(MAKE_TARGETS): %: %.o ski-barriers.o ski-hyper.o ski-params.o ski-test.o

fsstress.o: Makefile
