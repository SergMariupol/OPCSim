# Install script for directory: D:/QT/qtopcua/src/plugins/opcua/open62541

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

if(CMAKE_INSTALL_COMPONENT STREQUAL "Devel" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/Qt6OpcUa" TYPE FILE FILES
    "D:/QT/qtopcua/build/Desktop_Qt_6_9_1_MinGW_64_bit-Debug/lib/cmake/Qt6OpcUa/Qt6QOpen62541PluginConfig.cmake"
    "D:/QT/qtopcua/build/Desktop_Qt_6_9_1_MinGW_64_bit-Debug/lib/cmake/Qt6OpcUa/Qt6QOpen62541PluginConfigVersion.cmake"
    "D:/QT/qtopcua/build/Desktop_Qt_6_9_1_MinGW_64_bit-Debug/lib/cmake/Qt6OpcUa/Qt6QOpen62541PluginConfigVersionImpl.cmake"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/plugins/opcua" TYPE MODULE FILES "D:/QT/qtopcua/build/Desktop_Qt_6_9_1_MinGW_64_bit-Debug/plugins/opcua/open62541_backend.dll")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/plugins/opcua/open62541_backend.dll" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/plugins/opcua/open62541_backend.dll")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "D:/QT/qtopcua/build/Desktop_Qt_6_9_1_MinGW_64_bit-Debug/bin/qt-internal-strip.bat" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/plugins/opcua/open62541_backend.dll")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/Qt6OpcUa/Qt6QOpen62541PluginTargets.cmake")
    file(DIFFERENT _cmake_export_file_changed FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/Qt6OpcUa/Qt6QOpen62541PluginTargets.cmake"
         "D:/QT/qtopcua/build/Desktop_Qt_6_9_1_MinGW_64_bit-Debug/src/plugins/opcua/open62541/CMakeFiles/Export/a62b892d1848085576fd2321b08bf888/Qt6QOpen62541PluginTargets.cmake")
    if(_cmake_export_file_changed)
      file(GLOB _cmake_old_config_files "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/Qt6OpcUa/Qt6QOpen62541PluginTargets-*.cmake")
      if(_cmake_old_config_files)
        string(REPLACE ";" ", " _cmake_old_config_files_text "${_cmake_old_config_files}")
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/Qt6OpcUa/Qt6QOpen62541PluginTargets.cmake\" will be replaced.  Removing files [${_cmake_old_config_files_text}].")
        unset(_cmake_old_config_files_text)
        file(REMOVE ${_cmake_old_config_files})
      endif()
      unset(_cmake_old_config_files)
    endif()
    unset(_cmake_export_file_changed)
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/Qt6OpcUa" TYPE FILE FILES "D:/QT/qtopcua/build/Desktop_Qt_6_9_1_MinGW_64_bit-Debug/src/plugins/opcua/open62541/CMakeFiles/Export/a62b892d1848085576fd2321b08bf888/Qt6QOpen62541PluginTargets.cmake")
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/Qt6OpcUa" TYPE FILE FILES "D:/QT/qtopcua/build/Desktop_Qt_6_9_1_MinGW_64_bit-Debug/src/plugins/opcua/open62541/CMakeFiles/Export/a62b892d1848085576fd2321b08bf888/Qt6QOpen62541PluginTargets-debug.cmake")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/plugins/opcua" TYPE FILE FILES "D:/QT/qtopcua/build/Desktop_Qt_6_9_1_MinGW_64_bit-Debug/plugins/opcua/open62541_backend.debug")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/Qt6OpcUa" TYPE FILE FILES "D:/QT/qtopcua/build/Desktop_Qt_6_9_1_MinGW_64_bit-Debug/lib/cmake/Qt6OpcUa/Qt6QOpen62541PluginAdditionalTargetInfo.cmake")
endif()

