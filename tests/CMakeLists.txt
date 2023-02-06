# The gtest/gtest_main targets carry header search path
# dependencies automatically when using CMake 2.8.11 or
# later. Otherwise we have to add them here ourselves.
if (CMAKE_VERSION VERSION_LESS 2.8.11)
  include_directories("${gtest_SOURCE_DIR}/include")
endif()

# Include tests here...
add_executable(bar bar.cpp)

if (APPLE)
  set(GTEST_LIBS
    /usr/local/lib/libgtest.a
    /usr/local/lib/libgtest_main.a
  )
else()
  set(GTEST_LIBS
    gtest
    gtest_main
)
endif()

add_test(TestBAR bar)
