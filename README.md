# libFreeRTOS

Simulate FreeRTOS on posix for easy testing of FreeRTOS applications

gcc and clang have TSAN on posix, which is helpful for detecting multi-threaded bugs

All source files are from the FreeRTOS-Kernel repo. The top level .c, .h and CMakeLists.txt is an example application

## usage

Get FreeRTOS kernel sources from https://github.com/FreeRTOS/FreeRTOS-Kernel.git

```sh
./cp_files.sh <FreeRTOS_root>
mkdir build && cd build
cmake ..
cmake --build .
```
