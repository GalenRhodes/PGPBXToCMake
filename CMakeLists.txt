cmake_minimum_required(VERSION 3.5.1)
project(PGPBXToCMake VERSION "0.1.0")
get_filename_component(PROJECT_DIR_NAME "${CMAKE_SOURCE_DIR}" NAME_WE CACHE)

list(APPEND CMAKE_MODULE_PATH "/usr/share/cmake-3.5/Modules")

if(CMAKE_INSTALL_PREFIX_INITIALIZED_TO_DEFAULT)
  set(CMAKE_INSTALL_PREFIX "$ENV{HOME}" CACHE PATH "..." FORCE)
endif()

find_program(GNUSTEP_CONFIG "gnustep-config")
find_program(UNIX_FIND "find")

set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -fblocks -std=gnu99")
set(CMAKE_C_FLAGS_RELEASE "-w -Ofast -g0")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fblocks -std=gnu99")
set(CMAKE_CXX_FLAGS_RELEASE "-w -Ofast -g0")

if(GNUSTEP_CONFIG)
    execute_process(COMMAND "${GNUSTEP_CONFIG}" "--variable=CC"  OUTPUT_VARIABLE objc_c_compiler     OUTPUT_STRIP_TRAILING_WHITESPACE)
    execute_process(COMMAND "${GNUSTEP_CONFIG}" "--variable=CXX" OUTPUT_VARIABLE objc_cxx_compiler   OUTPUT_STRIP_TRAILING_WHITESPACE)
    execute_process(COMMAND "${GNUSTEP_CONFIG}" "--objc-flags"   OUTPUT_VARIABLE objc_def_cc_flags   OUTPUT_STRIP_TRAILING_WHITESPACE)
    execute_process(COMMAND "${GNUSTEP_CONFIG}" "--gui-libs"     OUTPUT_VARIABLE objc_def_link_flags OUTPUT_STRIP_TRAILING_WHITESPACE)

    set(other_flags           "-fobjc-arc -fobjc-arc-exceptions -fobjc-nonfragile-abi")
#   set(CMAKE_C_COMPILER      "${objc_c_compiler}"                  CACHE FILEPATH "" FORCE)
#   set(CMAKE_CXX_COMPILER    "${objc_cxx_compiler}"                CACHE FILEPATH "" FORCE)
    set(CMAKE_OBJC_FLAGS      "${objc_def_cc_flags} ${other_flags}" CACHE STRING   "Additional command-line flags for Objective-C source files.")
    set(CMAKE_OBJC_LINK_FLAGS "${objc_def_link_flags}"              CACHE STRING   "Additional command-line flags for linking Objective-C objects.")
else()
    message(FATAL_ERROR "gnustep-config was not found.")
endif()

if(NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE "Release")
endif()

####################################################################################################################
# After we add the subdirectory for a library we can pull down it's public include directory and add it to the
# parent's include directory for other directories to inherit.
#
add_subdirectory("${PROJECT_DIR_NAME}")
get_directory_property(incdir DIRECTORY "${PROJECT_DIR_NAME}" DEFINITION "LIBPGPBXToCMake_SYSTEMINCDIR")
include_directories(BEFORE SYSTEM "${incdir}")
#
####################################################################################################################

if (UNIX)
    set(CPACK_STRIP_FILES            ON)
    set(CPACK_DEBIAN_PACKAGE_VERSION "${PGPBXToCMake_VERSION}")
    set(CPACK_DEBIAN_PACKAGE_DEPENDS "libc6 (>=2.7)")
endif ()

set(CPACK_PACKAGE_CONTACT             "Galen Rhodes <galenrhodes@me.com>")
set(CPACK_PACKAGE_NAME                "${CMAKE_PROJECT_NAME}-${PGPBXToCMake_VERSION}")
set(CPACK_PACKAGE_DESCRIPTION_SUMMARY "Build XCode Projects on Linux.")
set(CPACK_RESOURCE_FILE_LICENSE       "${PGPBXToCMake_SOURCE_DIR}/LICENSE")
set(CPACK_PACKAGE_DESCRIPTION_FILE    "${PGPBXToCMake_SOURCE_DIR}/README.md")
set(CPACK_PACKAGE_VERSION_MAJOR       "${PGPBXToCMake_VERSION_MAJOR}")
set(CPACK_PACKAGE_VERSION_MINOR       "${PGPBXToCMake_VERSION_MINOR}")
set(CPACK_PACKAGE_VERSION_PATCH       "${PGPBXToCMake_VERSION_PATCH}")
include (CPack)
