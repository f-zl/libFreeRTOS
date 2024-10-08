cmake_minimum_required(VERSION 3.20)
project(libFreeRTOS)

if(UNIX)
	set(FREERTOS_PORT GCC_POSIX CACHE STRING "")
	set(FREERTOS_HEAP 4 CACHE STRING "")
else()
	message(FATAL "Unsupported arch")
endif()

add_library(freertos_config INTERFACE) # needed by freertos_kernel
target_include_directories(freertos_config SYSTEM INTERFACE
	. # directory of FreeRTOSConfig.h
)
target_compile_definitions(freertos_config INTERFACE
	projCOVERAGE_TEST=0)
add_subdirectory(FreeRTOS) # library freertos_kernel

add_executable(demo demo.c)
# applications should link to freertos_kernel
target_link_libraries(demo PRIVATE freertos_kernel)
