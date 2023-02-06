cmake_minimum_required(VERSION 3.10)
project(foo)

# Set some compilation options.
set(CMAKE_CXX_STANDARD 17)
add_compile_options(-Wall -Wpedantic -Wextra)

# Add option to enable testing
option(ENABLE_TESTS "Enable tests" OFF)

# External package dependencies.
find_package(GTSAM 4.1 REQUIRED)
find_package(Eigen3 3.3 REQUIRED)

set(FOO_HDRS
  include/foo.h
  )

set(FOO_SRCS
  src/foo.cpp
  )

set(FOO_LIBS
  gtsam
  Eigen3::Eigen
  )

add_library(foo STATIC ${FOO_SRCS} ${FOO_HDRS})
target_include_directories(foo PUBLIC include)
target_link_libraries(foo PUBLIC ${FOO_LIBS})

# Make library accessible to other cmake projects
export(PACKAGE foo)
export(TARGETS foo FILE fooConfig.cmake)

# Include unit tests directory to the project.
if (${ENABLE_TESTS})
  message(STATUS "Testing enabled. Building tests.")
  enable_testing()
  add_subdirectory(tests)
endif()
