# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.15

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Produce verbose output by default.
VERBOSE = 1

# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/local/bin/cmake

# The command to remove a file.
RM = /usr/local/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /chos

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /chos

# Include any dependencies generated for this target.
include CMakeFiles/kernel.img.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/kernel.img.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/kernel.img.dir/flags.make

CMakeFiles/kernel.img.dir/boot/init_c.c.o: CMakeFiles/kernel.img.dir/flags.make
CMakeFiles/kernel.img.dir/boot/init_c.c.o: boot/init_c.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/chos/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/kernel.img.dir/boot/init_c.c.o"
	/usr/bin/aarch64-linux-gnu-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/kernel.img.dir/boot/init_c.c.o   -c /chos/boot/init_c.c

CMakeFiles/kernel.img.dir/boot/init_c.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/kernel.img.dir/boot/init_c.c.i"
	/usr/bin/aarch64-linux-gnu-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /chos/boot/init_c.c > CMakeFiles/kernel.img.dir/boot/init_c.c.i

CMakeFiles/kernel.img.dir/boot/init_c.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/kernel.img.dir/boot/init_c.c.s"
	/usr/bin/aarch64-linux-gnu-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /chos/boot/init_c.c -o CMakeFiles/kernel.img.dir/boot/init_c.c.s

CMakeFiles/kernel.img.dir/boot/mmu.c.o: CMakeFiles/kernel.img.dir/flags.make
CMakeFiles/kernel.img.dir/boot/mmu.c.o: boot/mmu.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/chos/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object CMakeFiles/kernel.img.dir/boot/mmu.c.o"
	/usr/bin/aarch64-linux-gnu-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/kernel.img.dir/boot/mmu.c.o   -c /chos/boot/mmu.c

CMakeFiles/kernel.img.dir/boot/mmu.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/kernel.img.dir/boot/mmu.c.i"
	/usr/bin/aarch64-linux-gnu-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /chos/boot/mmu.c > CMakeFiles/kernel.img.dir/boot/mmu.c.i

CMakeFiles/kernel.img.dir/boot/mmu.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/kernel.img.dir/boot/mmu.c.s"
	/usr/bin/aarch64-linux-gnu-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /chos/boot/mmu.c -o CMakeFiles/kernel.img.dir/boot/mmu.c.s

CMakeFiles/kernel.img.dir/boot/print/macro.S.o: CMakeFiles/kernel.img.dir/flags.make
CMakeFiles/kernel.img.dir/boot/print/macro.S.o: boot/print/macro.S
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/chos/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building ASM object CMakeFiles/kernel.img.dir/boot/print/macro.S.o"
	/usr/bin/aarch64-linux-gnu-gcc $(ASM_DEFINES) $(ASM_INCLUDES) $(ASM_FLAGS) -o CMakeFiles/kernel.img.dir/boot/print/macro.S.o -c /chos/boot/print/macro.S

CMakeFiles/kernel.img.dir/boot/print/printf.c.o: CMakeFiles/kernel.img.dir/flags.make
CMakeFiles/kernel.img.dir/boot/print/printf.c.o: boot/print/printf.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/chos/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building C object CMakeFiles/kernel.img.dir/boot/print/printf.c.o"
	/usr/bin/aarch64-linux-gnu-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/kernel.img.dir/boot/print/printf.c.o   -c /chos/boot/print/printf.c

CMakeFiles/kernel.img.dir/boot/print/printf.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/kernel.img.dir/boot/print/printf.c.i"
	/usr/bin/aarch64-linux-gnu-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /chos/boot/print/printf.c > CMakeFiles/kernel.img.dir/boot/print/printf.c.i

CMakeFiles/kernel.img.dir/boot/print/printf.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/kernel.img.dir/boot/print/printf.c.s"
	/usr/bin/aarch64-linux-gnu-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /chos/boot/print/printf.c -o CMakeFiles/kernel.img.dir/boot/print/printf.c.s

CMakeFiles/kernel.img.dir/boot/print/uart.c.o: CMakeFiles/kernel.img.dir/flags.make
CMakeFiles/kernel.img.dir/boot/print/uart.c.o: boot/print/uart.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/chos/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building C object CMakeFiles/kernel.img.dir/boot/print/uart.c.o"
	/usr/bin/aarch64-linux-gnu-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/kernel.img.dir/boot/print/uart.c.o   -c /chos/boot/print/uart.c

CMakeFiles/kernel.img.dir/boot/print/uart.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/kernel.img.dir/boot/print/uart.c.i"
	/usr/bin/aarch64-linux-gnu-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /chos/boot/print/uart.c > CMakeFiles/kernel.img.dir/boot/print/uart.c.i

CMakeFiles/kernel.img.dir/boot/print/uart.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/kernel.img.dir/boot/print/uart.c.s"
	/usr/bin/aarch64-linux-gnu-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /chos/boot/print/uart.c -o CMakeFiles/kernel.img.dir/boot/print/uart.c.s

CMakeFiles/kernel.img.dir/boot/start.S.o: CMakeFiles/kernel.img.dir/flags.make
CMakeFiles/kernel.img.dir/boot/start.S.o: boot/start.S
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/chos/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building ASM object CMakeFiles/kernel.img.dir/boot/start.S.o"
	/usr/bin/aarch64-linux-gnu-gcc $(ASM_DEFINES) $(ASM_INCLUDES) $(ASM_FLAGS) -o CMakeFiles/kernel.img.dir/boot/start.S.o -c /chos/boot/start.S

CMakeFiles/kernel.img.dir/boot/tools.S.o: CMakeFiles/kernel.img.dir/flags.make
CMakeFiles/kernel.img.dir/boot/tools.S.o: boot/tools.S
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/chos/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building ASM object CMakeFiles/kernel.img.dir/boot/tools.S.o"
	/usr/bin/aarch64-linux-gnu-gcc $(ASM_DEFINES) $(ASM_INCLUDES) $(ASM_FLAGS) -o CMakeFiles/kernel.img.dir/boot/tools.S.o -c /chos/boot/tools.S

# Object files for target kernel.img
kernel_img_OBJECTS = \
"CMakeFiles/kernel.img.dir/boot/init_c.c.o" \
"CMakeFiles/kernel.img.dir/boot/mmu.c.o" \
"CMakeFiles/kernel.img.dir/boot/print/macro.S.o" \
"CMakeFiles/kernel.img.dir/boot/print/printf.c.o" \
"CMakeFiles/kernel.img.dir/boot/print/uart.c.o" \
"CMakeFiles/kernel.img.dir/boot/start.S.o" \
"CMakeFiles/kernel.img.dir/boot/tools.S.o"

# External object files for target kernel.img
kernel_img_EXTERNAL_OBJECTS = \
"/chos/kernel/CMakeFiles/chos-arch.dir/head.S.o" \
"/chos/kernel/CMakeFiles/chos-arch.dir/main.c.o" \
"/chos/kernel/CMakeFiles/chos-arch.dir/monitor.c.o" \
"/chos/kernel/CMakeFiles/chos-arch.dir/common/tools.S.o" \
"/chos/kernel/CMakeFiles/chos-arch.dir/common/uart.c.o" \
"/chos/kernel/CMakeFiles/chos-arch.dir/common/printk.c.o" \
"/chos/kernel/CMakeFiles/chos-arch.dir/mm/page_table.S.o" \
"/chos/kernel/CMakeFiles/chos-arch.dir/mm/memcpy.S.o" \
"/chos/kernel/CMakeFiles/chos-arch.dir/mm/memmove.S.o" \
"/chos/kernel/CMakeFiles/chos-arch.dir/mm/memset.S.o" \
"/chos/kernel/CMakeFiles/chos-arch.dir/mm/bzero.S.o" \
"/chos/kernel/mm/CMakeFiles/chos-mm.dir/buddy.c.o" \
"/chos/kernel/mm/CMakeFiles/chos-mm.dir/cache.c.o" \
"/chos/kernel/mm/CMakeFiles/chos-mm.dir/kmalloc.c.o" \
"/chos/kernel/mm/CMakeFiles/chos-mm.dir/mm.c.o" \
"/chos/kernel/mm/CMakeFiles/chos-mm.dir/mmparse.c.o" \
"/chos/kernel/mm/CMakeFiles/chos-mm.dir/page_table.c.o" \
"/chos/kernel/mm/CMakeFiles/chos-mm.dir/slab.c.o" \
"/chos/kernel/mm/CMakeFiles/chos-mm.dir/uaccess.c.o" \
"/chos/kernel/mm/CMakeFiles/chos-mm.dir/vmspace.c.o"

kernel.img: CMakeFiles/kernel.img.dir/boot/init_c.c.o
kernel.img: CMakeFiles/kernel.img.dir/boot/mmu.c.o
kernel.img: CMakeFiles/kernel.img.dir/boot/print/macro.S.o
kernel.img: CMakeFiles/kernel.img.dir/boot/print/printf.c.o
kernel.img: CMakeFiles/kernel.img.dir/boot/print/uart.c.o
kernel.img: CMakeFiles/kernel.img.dir/boot/start.S.o
kernel.img: CMakeFiles/kernel.img.dir/boot/tools.S.o
kernel.img: kernel/CMakeFiles/chos-arch.dir/head.S.o
kernel.img: kernel/CMakeFiles/chos-arch.dir/main.c.o
kernel.img: kernel/CMakeFiles/chos-arch.dir/monitor.c.o
kernel.img: kernel/CMakeFiles/chos-arch.dir/common/tools.S.o
kernel.img: kernel/CMakeFiles/chos-arch.dir/common/uart.c.o
kernel.img: kernel/CMakeFiles/chos-arch.dir/common/printk.c.o
kernel.img: kernel/CMakeFiles/chos-arch.dir/mm/page_table.S.o
kernel.img: kernel/CMakeFiles/chos-arch.dir/mm/memcpy.S.o
kernel.img: kernel/CMakeFiles/chos-arch.dir/mm/memmove.S.o
kernel.img: kernel/CMakeFiles/chos-arch.dir/mm/memset.S.o
kernel.img: kernel/CMakeFiles/chos-arch.dir/mm/bzero.S.o
kernel.img: kernel/mm/CMakeFiles/chos-mm.dir/buddy.c.o
kernel.img: kernel/mm/CMakeFiles/chos-mm.dir/cache.c.o
kernel.img: kernel/mm/CMakeFiles/chos-mm.dir/kmalloc.c.o
kernel.img: kernel/mm/CMakeFiles/chos-mm.dir/mm.c.o
kernel.img: kernel/mm/CMakeFiles/chos-mm.dir/mmparse.c.o
kernel.img: kernel/mm/CMakeFiles/chos-mm.dir/page_table.c.o
kernel.img: kernel/mm/CMakeFiles/chos-mm.dir/slab.c.o
kernel.img: kernel/mm/CMakeFiles/chos-mm.dir/uaccess.c.o
kernel.img: kernel/mm/CMakeFiles/chos-mm.dir/vmspace.c.o
kernel.img: CMakeFiles/kernel.img.dir/build.make
kernel.img: CMakeFiles/kernel.img.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/chos/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Linking C executable kernel.img"
	/usr/bin/aarch64-linux-gnu-gcc -E -x c -I/chos/boot/include ./linker.lds.S | grep -v ^# > linker.lds
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/kernel.img.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/kernel.img.dir/build: kernel.img

.PHONY : CMakeFiles/kernel.img.dir/build

CMakeFiles/kernel.img.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/kernel.img.dir/cmake_clean.cmake
.PHONY : CMakeFiles/kernel.img.dir/clean

CMakeFiles/kernel.img.dir/depend:
	cd /chos && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /chos /chos /chos /chos /chos/CMakeFiles/kernel.img.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/kernel.img.dir/depend

