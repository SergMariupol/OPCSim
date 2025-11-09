# Install script for directory: D:/QT/qtopcua/examples/opcua/waterpump

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/Qt/6.9.1/mingw_64")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Debug")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

# Set path to fallback-tool for dependency-resolution.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "C:/Qt/Tools/mingw1310_64/bin/objdump.exe")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  
# Unset the CMAKE_INSTALL_PREFIX in the current cmake_install.cmake file so that it can be
# overridden in the included add_subdirectory-specific cmake_install.cmake files instead.
# Also unset the deployment prefix, so it can be recomputed for each example subdirectory.
unset(CMAKE_INSTALL_PREFIX)
unset(QT_DEPLOY_PREFIX)

endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("D:/QT/qtopcua/build/Desktop_Qt_6_9_1_MinGW_64_bit-Debug/examples/opcua/waterpump/simulationserver/cmake_install.cmake")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  
# Unset the CMAKE_INSTALL_PREFIX in the current cmake_install.cmake file so that it can be
# overridden in the included add_subdirectory-specific cmake_install.cmake files instead.
# Also unset the deployment prefix, so it can be recomputed for each example subdirectory.
unset(CMAKE_INSTALL_PREFIX)
unset(QT_DEPLOY_PREFIX)

endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("D:/QT/qtopcua/build/Desktop_Qt_6_9_1_MinGW_64_bit-Debug/examples/opcua/waterpump/waterpump-qmlcpp/cmake_install.cmake")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  
# Unset the CMAKE_INSTALL_PREFIX in the current cmake_install.cmake file so that it can be
# overridden in the included add_subdirectory-specific cmake_install.cmake files instead.
# Also unset the deployment prefix, so it can be recomputed for each example subdirectory.
unset(CMAKE_INSTALL_PREFIX)
unset(QT_DEPLOY_PREFIX)

endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("D:/QT/qtopcua/build/Desktop_Qt_6_9_1_MinGW_64_bit-Debug/examples/opcua/waterpump/waterpump-qml/cmake_install.cmake")
endif()

