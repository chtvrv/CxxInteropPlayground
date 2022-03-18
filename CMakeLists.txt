cmake_minimum_required(VERSION 3.18)

project(CxxInteropPlayground LANGUAGES CXX Swift)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED YES)
set(CMAKE_CXX_EXTENSIONS OFF)

add_library(cxx-support ./src/cxx/cxx.cpp)
target_compile_options(cxx-support PRIVATE
  -I${SWIFT_CXX_TOOLCHAIN}/usr/include/c++/v1
  -fno-exceptions
  -fignore-exceptions
  -nostdinc++)

target_include_directories(cxx-support PUBLIC
  ${CMAKE_SOURCE_DIR}/src/cxx)

add_executable(playground
  ./src/main.swift
  ./src/swift/test_vector_push_back.swift
  ./src/swift/extensions/vector_to_array.swift
)

target_compile_options(playground PRIVATE
  "SHELL:-Xfrontend -enable-cxx-interop"
  "SHELL:-Xfrontend -validate-tbd-against-ir=none"
  "SHELL:-Xcc -nostdinc++"
  "SHELL:-Xcc -fno-exceptions"
  "SHELL:-Xcc -fignore-exceptions"
  "SHELL:-Xcc -I${SWIFT_CXX_TOOLCHAIN}/usr/include/c++/v1"
  -lc++
)
target_link_libraries(playground PRIVATE cxx-support)