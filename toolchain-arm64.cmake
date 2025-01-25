# Specify the cross-compilation toolchain for Raspberry Pi 4 (ARM64)
set(CMAKE_SYSTEM_NAME Linux)
set(CMAKE_SYSTEM_PROCESSOR aarch64)  # Use aarch64 for 64-bit ARM architecture

# Specify the path to the ARM64 cross-compilers
set(CMAKE_C_COMPILER /usr/bin/aarch64-linux-gnu-gcc)
set(CMAKE_CXX_COMPILER /usr/bin/aarch64-linux-gnu-g++)

# Specify the flags for the ARM64 build (ARMv8)
set(CMAKE_FIND_ROOT_PATH /usr/arm-linux-gnueabihf)  # Use the correct cross-root path for ARM64

# Adjust library search paths for ARM64
set(CMAKE_LIBRARY_PATH /usr/arm-linux-gnueabihf/lib)

# Set the architecture of the ARM64 target
set(CMAKE_C_FLAGS "-march=armv8-a")
set(CMAKE_CXX_FLAGS "-march=armv8-a")