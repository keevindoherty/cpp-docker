include(FetchContent)

FetchContent_Declare(googletest
    GIT_REPOSITORY https://github.com/google/googletest.git
    GIT_TAG        v1.13.0
)
FetchContent_MakeAvailable(googletest)

# Include tests here...
add_executable(bar bar.cpp)
target_link_libraries(bar PRIVATE foo gtest)

add_test(TestBAR bar)
