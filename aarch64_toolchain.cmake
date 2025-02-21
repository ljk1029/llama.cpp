# 设置交叉编译的系统信息
set(CMAKE_SYSTEM_NAME Linux)
set(CMAKE_SYSTEM_PROCESSOR aarch64)

# 设置 C 和 C++ 编译器选项以支持 ARM NEON
#set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -march=armv8-a+neon")
#set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -march=armv8-a+neon")

# 定义 GCC_AARCH64_BASE_PATH
set(GCC_AARCH64_BASE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/../aarch64--glibc--stable-2022.03-1")

# 根据原设置计算路径
set(GCC_AARCH64_BIN_PATH "${GCC_AARCH64_BASE_PATH}/bin")
set(GCC_AARCH64_HOST "${GCC_AARCH64_BASE_PATH}")
set(GCC_AARCH64_HOST_INCLUDE "${GCC_AARCH64_BASE_PATH}/include")
set(GCC_AARCH64_TARGET "${GCC_AARCH64_BASE_PATH}/aarch64-buildroot-linux-gnu")
set(GCC_AARCH64_TARGET_INCLUDE "${GCC_AARCH64_TARGET}/include/c++/9.3.0")

# 设置 C 和 C++ 编译器
set(CMAKE_C_COMPILER "${GCC_AARCH64_BIN_PATH}/aarch64-buildroot-linux-gnu-gcc")
set(CMAKE_CXX_COMPILER "${GCC_AARCH64_BIN_PATH}/aarch64-buildroot-linux-gnu-g++")

# 设置搜索路径
set(CMAKE_FIND_ROOT_PATH ${GCC_AARCH64_BASE_PATH})
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)

# 添加目标的 C++ 头文件路径
include_directories(${GCC_AARCH64_TARGET_INCLUDE})



# # # 定义 CUDA 工具路径
# set(CUDA_TOOLS "${CMAKE_CURRENT_SOURCE_DIR}/../cuda-11.4.20")
# set(CUDA_COMPILER "${CUDA_TOOLS}/bin/nvcc")
# set(CUDA_INCLUDE_DIRS "${CUDA_TOOLS}/include")
# set(CUDA_LIBRARIES "${CUDA_TOOLS}/lib64")

# # # 启用 CUDA 支持
# #find_package(CUDA REQUIRED)

# # # 设置 CUDA 编译器
# set(CUDA_NVCC_EXECUTABLE ${CUDA_COMPILER})

# # # 设置 CUDA 包含路径
# include_directories(${CUDA_INCLUDE_DIRS})

# # # 设置 CUDA 库路径
# link_directories(${CUDA_LIBRARIES})

# # 设置 CUDA 编译标志
# set(CUDA_PROPAGATE_HOST_FLAGS OFF)
# set(CUDA_SEPARABLE_COMPILATION ON)
# set(CUDA_NVCC_FLAGS "${CUDA_NVCC_FLAGS} -O3 -gencode arch=compute_70,code=sm_70")

# # 查找 CUDA 库
# find_library(CUDA_CUBLAS_LIBRARIES cublas PATHS ${CUDA_LIBRARIES})
# find_library(CUDA_CUDART_LIBRARIES cudart PATHS ${CUDA_LIBRARIES})
# find_library(CUDA_CUFFT_LIBRARIES cufft PATHS ${CUDA_LIBRARIES})
# find_library(CUDA_NPP_LIBRARIES nppc PATHS ${CUDA_LIBRARIES})

# # 在项目中启用 CUDA 语言支持
# enable_language(CUDA)

# # 确保在交叉编译环境中正确处理 CUDA 编译
# if (CMAKE_CROSSCOMPILING)
#     set(CMAKE_CUDA_COMPILER_FORCED TRUE)
# endif()

# # 设置 CUDA 主机编译器（需要与主机系统匹配）
# set(CMAKE_CUDA_HOST_COMPILER /usr/bin/g++)



# 定义 CUDA 相关路径
# set(CUDA_TOOLS "${CMAKE_CURRENT_SOURCE_DIR}/../cuda-11.4.20")
# set(CUDA_COMPILER "${CUDA_TOOLS}/bin/nvcc")
# # 查找并启用 CUDA 支持
# find_package(CUDA 11.4.20 REQUIRED)
# # 设置 CUDA 编译器
# set(CUDA_NVCC_EXECUTABLE ${CUDA_COMPILER})
# # 设置 CUDA 相关的包含路径和库路径
# include_directories(${CUDA_TOOLS}/include)
# link_directories(${CUDA_TOOLS}/lib64)
# # 设置 CUDA 编译选项
# set(CUDA_PROPAGATE_HOST_FLAGS OFF)
# # 请根据你的 GPU 架构替换 sm_XX
# set(CUDA_NVCC_FLAGS "${CUDA_NVCC_FLAGS};-arch=sm_XX") 
# # 检查 CUDA 是否找到
# if(CUDA_FOUND)
#     message(STATUS "CUDA found: ${CUDA_VERSION}")
#     message(STATUS "CUDA include directories: ${CUDA_INCLUDE_DIRS}")
#     message(STATUS "CUDA libraries: ${CUDA_LIBRARIES}")
# else()
#     message(FATAL_ERROR "CUDA not found.")
# endif()
# # 添加一些调试信息，方便排查问题
# message(STATUS "GCC_AARCH64_BASE_PATH: ${GCC_AARCH64_BASE_PATH}")
# message(STATUS "CUDA_TOOLS: ${CUDA_TOOLS}")
# message(STATUS "CMAKE_C_COMPILER: ${CMAKE_C_COMPILER}")
# message(STATUS "CMAKE_CXX_COMPILER: ${CMAKE_CXX_COMPILER}")
