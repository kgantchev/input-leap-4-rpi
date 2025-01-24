# Specify the cross-compilation toolchain
set(CMAKE_SYSTEM_NAME Linux)
set(CMAKE_SYSTEM_PROCESSOR arm)

# Specify the path to the ARM cross-compiler
set(CMAKE_C_COMPILER /usr/bin/arm-linux-gnueabihf-gcc)
set(CMAKE_CXX_COMPILER /usr/bin/arm-linux-gnueabihf-g++)

# Specify the flags for the ARM build
set(CMAKE_FIND_ROOT_PATH /usr/arm-linux-gnueabihf)

# Adjust library search paths
set(CMAKE_LIBRARY_PATH /usr/arm-linux-gnueabihf/lib)

# Set the architecture of the Raspberry Pi (ARMv7 or ARMv8)
set(CMAKE_C_FLAGS "-march=armv7-a")
set(CMAKE_CXX_FLAGS "-march=armv7-a")
