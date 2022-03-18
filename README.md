# Playground for Swift and C++ interoperability testing.

## Configuring & Generating
```
cmake -GNinja -B./build \
  -DCMAKE_Swift_COMPILER="your/path/to/swiftc" \
  -DCMAKE_CXX_COMPILER="your/path/to/clang++" \
  -DSWIFT_CXX_TOOLCHAIN="your/path/to/xctoolchain" .
```
## Build
```
ninja -C./build
```
## Running
```
./build/playground
```