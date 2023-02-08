cmake_minimum_required(VERSION 3.15)
project(foo)

# Set some compilation options.
set(CMAKE_CXX_STANDARD 17)
add_compile_options(-Wall -Wpedantic -Wextra)

# Add option to enable testing
option(ENABLE_TESTS "Enable tests" OFF)

# External package dependencies.
find_package(GTSAM 4.1 REQUIRED)
find_package(Eigen3 3.3 REQUIRED)

add_library(foo src/foo.cpp)
target_include_directories(foo PUBLIC include)
target_link_libraries(foo PUBLIC gtsam Eigen3::Eigen)

# Make library accessible to other cmake projects
export(PACKAGE foo)
export(TARGETS foo FILE fooConfig.cmake)

# Include unit tests directory to the project.
if (${ENABLE_TESTS})
  message(STATUS "Testing enabled. Building tests.")
  enable_testing()
  add_subdirectory(tests)
endif()
