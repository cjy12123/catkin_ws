# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


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
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/cjy/Desktop/my_log/px4_test/px4_dir/catkin_ws/src/pid

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/cjy/Desktop/my_log/px4_test/px4_dir/catkin_ws/build/pid

# Include any dependencies generated for this target.
include CMakeFiles/autotune.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/autotune.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/autotune.dir/flags.make

CMakeFiles/autotune.dir/src/autotune.cpp.o: CMakeFiles/autotune.dir/flags.make
CMakeFiles/autotune.dir/src/autotune.cpp.o: /home/cjy/Desktop/my_log/px4_test/px4_dir/catkin_ws/src/pid/src/autotune.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/cjy/Desktop/my_log/px4_test/px4_dir/catkin_ws/build/pid/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/autotune.dir/src/autotune.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/autotune.dir/src/autotune.cpp.o -c /home/cjy/Desktop/my_log/px4_test/px4_dir/catkin_ws/src/pid/src/autotune.cpp

CMakeFiles/autotune.dir/src/autotune.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/autotune.dir/src/autotune.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/cjy/Desktop/my_log/px4_test/px4_dir/catkin_ws/src/pid/src/autotune.cpp > CMakeFiles/autotune.dir/src/autotune.cpp.i

CMakeFiles/autotune.dir/src/autotune.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/autotune.dir/src/autotune.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/cjy/Desktop/my_log/px4_test/px4_dir/catkin_ws/src/pid/src/autotune.cpp -o CMakeFiles/autotune.dir/src/autotune.cpp.s

# Object files for target autotune
autotune_OBJECTS = \
"CMakeFiles/autotune.dir/src/autotune.cpp.o"

# External object files for target autotune
autotune_EXTERNAL_OBJECTS =

/home/cjy/Desktop/my_log/px4_test/px4_dir/catkin_ws/devel/.private/pid/lib/pid/autotune: CMakeFiles/autotune.dir/src/autotune.cpp.o
/home/cjy/Desktop/my_log/px4_test/px4_dir/catkin_ws/devel/.private/pid/lib/pid/autotune: CMakeFiles/autotune.dir/build.make
/home/cjy/Desktop/my_log/px4_test/px4_dir/catkin_ws/devel/.private/pid/lib/pid/autotune: /opt/ros/noetic/lib/libroscpp.so
/home/cjy/Desktop/my_log/px4_test/px4_dir/catkin_ws/devel/.private/pid/lib/pid/autotune: /usr/lib/x86_64-linux-gnu/libpthread.so
/home/cjy/Desktop/my_log/px4_test/px4_dir/catkin_ws/devel/.private/pid/lib/pid/autotune: /usr/lib/x86_64-linux-gnu/libboost_chrono.so.1.71.0
/home/cjy/Desktop/my_log/px4_test/px4_dir/catkin_ws/devel/.private/pid/lib/pid/autotune: /usr/lib/x86_64-linux-gnu/libboost_filesystem.so.1.71.0
/home/cjy/Desktop/my_log/px4_test/px4_dir/catkin_ws/devel/.private/pid/lib/pid/autotune: /opt/ros/noetic/lib/librosconsole.so
/home/cjy/Desktop/my_log/px4_test/px4_dir/catkin_ws/devel/.private/pid/lib/pid/autotune: /opt/ros/noetic/lib/librosconsole_log4cxx.so
/home/cjy/Desktop/my_log/px4_test/px4_dir/catkin_ws/devel/.private/pid/lib/pid/autotune: /opt/ros/noetic/lib/librosconsole_backend_interface.so
/home/cjy/Desktop/my_log/px4_test/px4_dir/catkin_ws/devel/.private/pid/lib/pid/autotune: /usr/lib/x86_64-linux-gnu/liblog4cxx.so
/home/cjy/Desktop/my_log/px4_test/px4_dir/catkin_ws/devel/.private/pid/lib/pid/autotune: /usr/lib/x86_64-linux-gnu/libboost_regex.so.1.71.0
/home/cjy/Desktop/my_log/px4_test/px4_dir/catkin_ws/devel/.private/pid/lib/pid/autotune: /opt/ros/noetic/lib/libxmlrpcpp.so
/home/cjy/Desktop/my_log/px4_test/px4_dir/catkin_ws/devel/.private/pid/lib/pid/autotune: /opt/ros/noetic/lib/libdynamic_reconfigure_config_init_mutex.so
/home/cjy/Desktop/my_log/px4_test/px4_dir/catkin_ws/devel/.private/pid/lib/pid/autotune: /opt/ros/noetic/lib/libroscpp_serialization.so
/home/cjy/Desktop/my_log/px4_test/px4_dir/catkin_ws/devel/.private/pid/lib/pid/autotune: /opt/ros/noetic/lib/librostime.so
/home/cjy/Desktop/my_log/px4_test/px4_dir/catkin_ws/devel/.private/pid/lib/pid/autotune: /usr/lib/x86_64-linux-gnu/libboost_date_time.so.1.71.0
/home/cjy/Desktop/my_log/px4_test/px4_dir/catkin_ws/devel/.private/pid/lib/pid/autotune: /opt/ros/noetic/lib/libcpp_common.so
/home/cjy/Desktop/my_log/px4_test/px4_dir/catkin_ws/devel/.private/pid/lib/pid/autotune: /usr/lib/x86_64-linux-gnu/libboost_system.so.1.71.0
/home/cjy/Desktop/my_log/px4_test/px4_dir/catkin_ws/devel/.private/pid/lib/pid/autotune: /usr/lib/x86_64-linux-gnu/libboost_thread.so.1.71.0
/home/cjy/Desktop/my_log/px4_test/px4_dir/catkin_ws/devel/.private/pid/lib/pid/autotune: /usr/lib/x86_64-linux-gnu/libconsole_bridge.so.0.4
/home/cjy/Desktop/my_log/px4_test/px4_dir/catkin_ws/devel/.private/pid/lib/pid/autotune: CMakeFiles/autotune.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/cjy/Desktop/my_log/px4_test/px4_dir/catkin_ws/build/pid/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable /home/cjy/Desktop/my_log/px4_test/px4_dir/catkin_ws/devel/.private/pid/lib/pid/autotune"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/autotune.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/autotune.dir/build: /home/cjy/Desktop/my_log/px4_test/px4_dir/catkin_ws/devel/.private/pid/lib/pid/autotune

.PHONY : CMakeFiles/autotune.dir/build

CMakeFiles/autotune.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/autotune.dir/cmake_clean.cmake
.PHONY : CMakeFiles/autotune.dir/clean

CMakeFiles/autotune.dir/depend:
	cd /home/cjy/Desktop/my_log/px4_test/px4_dir/catkin_ws/build/pid && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/cjy/Desktop/my_log/px4_test/px4_dir/catkin_ws/src/pid /home/cjy/Desktop/my_log/px4_test/px4_dir/catkin_ws/src/pid /home/cjy/Desktop/my_log/px4_test/px4_dir/catkin_ws/build/pid /home/cjy/Desktop/my_log/px4_test/px4_dir/catkin_ws/build/pid /home/cjy/Desktop/my_log/px4_test/px4_dir/catkin_ws/build/pid/CMakeFiles/autotune.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/autotune.dir/depend

