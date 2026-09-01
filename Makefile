.SUFFIXES:

ifeq ($(strip $(DEVKITXENON)),)
$(error "Please set DEVKITXENON in your environment")
endif

include $(DEVKITXENON)/rules

TARGET := x360tube_test
BUILD := build
SOURCES := .

DATA :=
INCLUDES :=

CFLAGS = -g -O2 -Wall $(MACHDEP) $(INCLUDE)
CXXFLAGS = $(CFLAGS)
LDFLAGS = -g $(MACHDEP) -Wl,--gc-sections -Wl,-Map,$(notdir $@).map
LIBS := -lxenon -lm
LIBDIRS :=

ifneq ($(BUILD),$(notdir $(CURDIR)))
export OUTPUT := $(CURDIR)/$(TARGET)
export VPATH := $(CURDIR)
export DEPSDIR := $(CURDIR)/$(BUILD)

CFILES := $(notdir $(wildcard *.c))
CPPFILES := $(notdir $(wildcard *.cpp))
sFILES := $(notdir $(wildcard *.s))
SFILES := $(notdir $(wildcard *.S))

export LD := $(CC)
export OFILES := $(CFILES:.c=.o) $(CPPFILES:.cpp=.o) $(sFILES:.s=.o) $(SFILES:.S=.o)
export INCLUDE := $(foreach dir,$(INCLUDES),-I$(CURDIR)/$(dir)) $(foreach dir,$(LIBDIRS),-I$(dir)/include) -I$(CURDIR)/$(BUILD) -I$(LIBXENON_INC)
export LIBPATHS := $(foreach dir,$(LIBDIRS),-L$(dir)/lib) -L$(LIBXENON_LIB)

.PHONY: $(BUILD) clean

$(BUILD):
	@[ -d $@ ] || mkdir -p $@
	@$(MAKE) --no-print-directory -C $@ -f $(CURDIR)/Makefile

clean:
	@rm -fr $(BUILD) $(OUTPUT).elf $(OUTPUT).elf32

else

DEPENDS := $(OFILES:.o=.d)

$(OUTPUT).elf32: $(OUTPUT).elf

$(OUTPUT).elf: $(OFILES)
	$(LD) $(LDFLAGS) $(OFILES) $(LIBPATHS) $(LIBS) -o $@

-include $(DEPENDS)

endif
