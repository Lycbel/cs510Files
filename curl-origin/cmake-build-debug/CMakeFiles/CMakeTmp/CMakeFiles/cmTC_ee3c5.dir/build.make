# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.12

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
CMAKE_COMMAND = /home/andy/Downloads/clion-2018.2.3/bin/cmake/linux/bin/cmake

# The command to remove a file.
RM = /home/andy/Downloads/clion-2018.2.3/bin/cmake/linux/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/andy/Desktop/test598/curl/cmake-build-debug/CMakeFiles/CMakeTmp

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/andy/Desktop/test598/curl/cmake-build-debug/CMakeFiles/CMakeTmp

# Include any dependencies generated for this target.
include CMakeFiles/cmTC_ee3c5.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/cmTC_ee3c5.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/cmTC_ee3c5.dir/flags.make

CMakeFiles/cmTC_ee3c5.dir/HAVE_SGTTY_H.c.o: CMakeFiles/cmTC_ee3c5.dir/flags.make
CMakeFiles/cmTC_ee3c5.dir/HAVE_SGTTY_H.c.o: /home/andy/Desktop/test598/curl/cmake-build-debug/CMakeFiles/CheckIncludeFiles/HAVE_SGTTY_H.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --progress-dir=/home/andy/Desktop/test598/curl/cmake-build-debug/CMakeFiles/CMakeTmp/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/cmTC_ee3c5.dir/HAVE_SGTTY_H.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/cmTC_ee3c5.dir/HAVE_SGTTY_H.c.o   -c /home/andy/Desktop/test598/curl/cmake-build-debug/CMakeFiles/CheckIncludeFiles/HAVE_SGTTY_H.c

CMakeFiles/cmTC_ee3c5.dir/HAVE_SGTTY_H.c.i: cmake_force
	@echo "Preprocessing C source to CMakeFiles/cmTC_ee3c5.dir/HAVE_SGTTY_H.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/andy/Desktop/test598/curl/cmake-build-debug/CMakeFiles/CheckIncludeFiles/HAVE_SGTTY_H.c > CMakeFiles/cmTC_ee3c5.dir/HAVE_SGTTY_H.c.i

CMakeFiles/cmTC_ee3c5.dir/HAVE_SGTTY_H.c.s: cmake_force
	@echo "Compiling C source to assembly CMakeFiles/cmTC_ee3c5.dir/HAVE_SGTTY_H.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/andy/Desktop/test598/curl/cmake-build-debug/CMakeFiles/CheckIncludeFiles/HAVE_SGTTY_H.c -o CMakeFiles/cmTC_ee3c5.dir/HAVE_SGTTY_H.c.s

# Object files for target cmTC_ee3c5
cmTC_ee3c5_OBJECTS = \
"CMakeFiles/cmTC_ee3c5.dir/HAVE_SGTTY_H.c.o"

# External object files for target cmTC_ee3c5
cmTC_ee3c5_EXTERNAL_OBJECTS =

cmTC_ee3c5: CMakeFiles/cmTC_ee3c5.dir/HAVE_SGTTY_H.c.o
cmTC_ee3c5: CMakeFiles/cmTC_ee3c5.dir/build.make
cmTC_ee3c5: CMakeFiles/cmTC_ee3c5.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --progress-dir=/home/andy/Desktop/test598/curl/cmake-build-debug/CMakeFiles/CMakeTmp/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable cmTC_ee3c5"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/cmTC_ee3c5.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/cmTC_ee3c5.dir/build: cmTC_ee3c5

.PHONY : CMakeFiles/cmTC_ee3c5.dir/build

CMakeFiles/cmTC_ee3c5.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/cmTC_ee3c5.dir/cmake_clean.cmake
.PHONY : CMakeFiles/cmTC_ee3c5.dir/clean

CMakeFiles/cmTC_ee3c5.dir/depend:
	cd /home/andy/Desktop/test598/curl/cmake-build-debug/CMakeFiles/CMakeTmp && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/andy/Desktop/test598/curl/cmake-build-debug/CMakeFiles/CMakeTmp /home/andy/Desktop/test598/curl/cmake-build-debug/CMakeFiles/CMakeTmp /home/andy/Desktop/test598/curl/cmake-build-debug/CMakeFiles/CMakeTmp /home/andy/Desktop/test598/curl/cmake-build-debug/CMakeFiles/CMakeTmp /home/andy/Desktop/test598/curl/cmake-build-debug/CMakeFiles/CMakeTmp/CMakeFiles/cmTC_ee3c5.dir/DependInfo.cmake
.PHONY : CMakeFiles/cmTC_ee3c5.dir/depend

