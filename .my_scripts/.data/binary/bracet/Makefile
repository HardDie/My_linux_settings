ifndef V
	QUIET_CC       = @echo '  ' CC '       ' $@;
	QUIET_BUILT_IN = @echo '  ' BUILTIN '  ' $@;
	QUIET_CLEAN    = @echo '  ' CLEAN '    ' $<;
	QUIET_AR       = @echo '  ' AR '       ' $@;
endif

CC = gcc
AR = ar
EXT = c

BINDIR = bin
SRCDIR = src
TARGET = bracet


# Init empty
CFLAGS =
LDFLAGS =

# Warrnings
CFLAGS += -Wall -Wextra -Wwrite-strings -Werror -Wshadow -Wpedantic -Wdouble-promotion -Wformat-security -Wformat-signedness -Wunsafe-loop-optimizations -Wunused-macros -Wbad-function-cast -Wcast-qual -Wcast-align -Wcast-align=strict -Wconversion -Warith-conversion -Wenum-compare -Wjump-misses-init -Wlogical-op -Waggregate-return -Wstrict-prototypes -Wold-style-definition -Wmissing-prototypes -Wmissing-declarations -Wpacked -Wredundant-decls -Wnested-externs -Winline -Winvalid-pch -Wstack-protector

# Debug options
#CFLAGS += -g

# Release options
CFLAGS += -Ofast

# Static analysers
CFLAGS += -fanalyzer -Wanalyzer-too-complex -fdiagnostics-generate-patch -fdiagnostics-path-format=inline-events -fstack-protector -fsanitize=address -fno-omit-frame-pointer

# Flag for shared library
CFLAGS += -fPIC

# include directory
CFLAGS += -I./include

LDFLAGS += -pthread

SRC ?= $(wildcard ${SRCDIR}/*.${EXT})
OBJ ?= $(SRC:${SRCDIR}/%.${EXT}=${BINDIR}/%.o)

# Compile binary file
all : ${BINDIR}/${TARGET}
${BINDIR}/${TARGET} : ${OBJ}
	${QUIET_BUILT_IN}${CC} $^ -o $@ ${CFLAGS} ${LDFLAGS}

# Compile static library
lib : ${BINDIR}/lib${TARGET}.a
${BINDIR}/lib${TARGET}.a : ${OBJ}
	${QUIET_AR}${AR} rcs $@ $^

# Compile shared library
so : ${BINDIR}/lib${TARGET}.so
${BINDIR}/lib${TARGET}.so : ${OBJ}
	${QUIET_BUILT_IN}${CC} -shared $^ -o $@ ${CFLAGS} ${LDFLAGS}

# Compile object files
${BINDIR}/%.o : ${SRCDIR}/%.${EXT}
	@mkdir -p ${BINDIR}
	${QUIET_CC}${CC} -c $< -o $@ ${CFLAGS}

.PHONY: clean
clean : ${BINDIR}
	${QUIET_CLEAN}rm -rf $<

-include $(OBJ:%.o=%.h)
