# Install script for directory: D:/QT/qtopcua/src/declarative_opcua

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/./metatypes" TYPE FILE FILES "D:/QT/qtopcua/build/Desktop_Qt_6_9_1_MinGW_64_bit-Debug/src/declarative_opcua/meta_types/qt6declarativeopcua_debug_metatypes.json")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Devel" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/Qt6DeclarativeOpcua" TYPE FILE FILES
    "D:/QT/qtopcua/build/Desktop_Qt_6_9_1_MinGW_64_bit-Debug/lib/cmake/Qt6DeclarativeOpcua/Qt6DeclarativeOpcuaConfig.cmake"
    "D:/QT/qtopcua/build/Desktop_Qt_6_9_1_MinGW_64_bit-Debug/lib/cmake/Qt6DeclarativeOpcua/Qt6DeclarativeOpcuaConfigVersion.cmake"
    "D:/QT/qtopcua/build/Desktop_Qt_6_9_1_MinGW_64_bit-Debug/lib/cmake/Qt6DeclarativeOpcua/Qt6DeclarativeOpcuaConfigVersionImpl.cmake"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Devel" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/Qt6DeclarativeOpcuaPrivate" TYPE FILE FILES
    "D:/QT/qtopcua/build/Desktop_Qt_6_9_1_MinGW_64_bit-Debug/lib/cmake/Qt6DeclarativeOpcuaPrivate/Qt6DeclarativeOpcuaPrivateConfig.cmake"
    "D:/QT/qtopcua/build/Desktop_Qt_6_9_1_MinGW_64_bit-Debug/lib/cmake/Qt6DeclarativeOpcuaPrivate/Qt6DeclarativeOpcuaPrivateConfigVersion.cmake"
    "D:/QT/qtopcua/build/Desktop_Qt_6_9_1_MinGW_64_bit-Debug/lib/cmake/Qt6DeclarativeOpcuaPrivate/Qt6DeclarativeOpcuaPrivateConfigVersionImpl.cmake"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "D:/QT/qtopcua/build/Desktop_Qt_6_9_1_MinGW_64_bit-Debug/lib/libQt6DeclarativeOpcua.a")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "D:/QT/qtopcua/build/Desktop_Qt_6_9_1_MinGW_64_bit-Debug/bin/Qt6DeclarativeOpcua.dll")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/Qt6DeclarativeOpcua.dll" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/Qt6DeclarativeOpcua.dll")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "D:/QT/qtopcua/build/Desktop_Qt_6_9_1_MinGW_64_bit-Debug/bin/qt-internal-strip.bat" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/Qt6DeclarativeOpcua.dll")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/Qt6DeclarativeOpcua/Qt6DeclarativeOpcuaTargets.cmake")
    file(DIFFERENT _cmake_export_file_changed FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/Qt6DeclarativeOpcua/Qt6DeclarativeOpcuaTargets.cmake"
         "D:/QT/qtopcua/build/Desktop_Qt_6_9_1_MinGW_64_bit-Debug/src/declarative_opcua/CMakeFiles/Export/93397afbf95e9a086b2a8dcec610b7e1/Qt6DeclarativeOpcuaTargets.cmake")
    if(_cmake_export_file_changed)
      file(GLOB _cmake_old_config_files "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/Qt6DeclarativeOpcua/Qt6DeclarativeOpcuaTargets-*.cmake")
      if(_cmake_old_config_files)
        string(REPLACE ";" ", " _cmake_old_config_files_text "${_cmake_old_config_files}")
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/Qt6DeclarativeOpcua/Qt6DeclarativeOpcuaTargets.cmake\" will be replaced.  Removing files [${_cmake_old_config_files_text}].")
        unset(_cmake_old_config_files_text)
        file(REMOVE ${_cmake_old_config_files})
      endif()
      unset(_cmake_old_config_files)
    endif()
    unset(_cmake_export_file_changed)
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/Qt6DeclarativeOpcua" TYPE FILE FILES "D:/QT/qtopcua/build/Desktop_Qt_6_9_1_MinGW_64_bit-Debug/src/declarative_opcua/CMakeFiles/Export/93397afbf95e9a086b2a8dcec610b7e1/Qt6DeclarativeOpcuaTargets.cmake")
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/Qt6DeclarativeOpcua" TYPE FILE FILES "D:/QT/qtopcua/build/Desktop_Qt_6_9_1_MinGW_64_bit-Debug/src/declarative_opcua/CMakeFiles/Export/93397afbf95e9a086b2a8dcec610b7e1/Qt6DeclarativeOpcuaTargets-debug.cmake")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Devel" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/Qt6DeclarativeOpcua" TYPE FILE FILES
    "D:/QT/qtopcua/build/Desktop_Qt_6_9_1_MinGW_64_bit-Debug/lib/cmake/Qt6DeclarativeOpcua/Qt6DeclarativeOpcuaVersionlessAliasTargets.cmake"
    "D:/QT/qtopcua/build/Desktop_Qt_6_9_1_MinGW_64_bit-Debug/lib/cmake/Qt6DeclarativeOpcua/Qt6DeclarativeOpcuaVersionlessTargets.cmake"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Devel" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/Qt6DeclarativeOpcua" TYPE FILE FILES
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/Qt6DeclarativeOpcuaPrivate/Qt6DeclarativeOpcuaPrivateTargets.cmake")
    file(DIFFERENT _cmake_export_file_changed FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/Qt6DeclarativeOpcuaPrivate/Qt6DeclarativeOpcuaPrivateTargets.cmake"
         "D:/QT/qtopcua/build/Desktop_Qt_6_9_1_MinGW_64_bit-Debug/src/declarative_opcua/CMakeFiles/Export/919b03c8d6f2d4c957d5d0eea1a285ee/Qt6DeclarativeOpcuaPrivateTargets.cmake")
    if(_cmake_export_file_changed)
      file(GLOB _cmake_old_config_files "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/Qt6DeclarativeOpcuaPrivate/Qt6DeclarativeOpcuaPrivateTargets-*.cmake")
      if(_cmake_old_config_files)
        string(REPLACE ";" ", " _cmake_old_config_files_text "${_cmake_old_config_files}")
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/Qt6DeclarativeOpcuaPrivate/Qt6DeclarativeOpcuaPrivateTargets.cmake\" will be replaced.  Removing files [${_cmake_old_config_files_text}].")
        unset(_cmake_old_config_files_text)
        file(REMOVE ${_cmake_old_config_files})
      endif()
      unset(_cmake_old_config_files)
    endif()
    unset(_cmake_export_file_changed)
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/Qt6DeclarativeOpcuaPrivate" TYPE FILE FILES "D:/QT/qtopcua/build/Desktop_Qt_6_9_1_MinGW_64_bit-Debug/src/declarative_opcua/CMakeFiles/Export/919b03c8d6f2d4c957d5d0eea1a285ee/Qt6DeclarativeOpcuaPrivateTargets.cmake")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Devel" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/Qt6DeclarativeOpcuaPrivate" TYPE FILE FILES
    "D:/QT/qtopcua/build/Desktop_Qt_6_9_1_MinGW_64_bit-Debug/lib/cmake/Qt6DeclarativeOpcuaPrivate/Qt6DeclarativeOpcuaPrivateVersionlessAliasTargets.cmake"
    "D:/QT/qtopcua/build/Desktop_Qt_6_9_1_MinGW_64_bit-Debug/lib/cmake/Qt6DeclarativeOpcuaPrivate/Qt6DeclarativeOpcuaPrivateVersionlessTargets.cmake"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Devel" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/Qt6DeclarativeOpcuaPrivate" TYPE FILE FILES
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE FILE FILES "D:/QT/qtopcua/build/Desktop_Qt_6_9_1_MinGW_64_bit-Debug/bin/Qt6DeclarativeOpcua.debug")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/modules" TYPE FILE FILES "D:/QT/qtopcua/build/Desktop_Qt_6_9_1_MinGW_64_bit-Debug/modules/DeclarativeOpcua.json")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Devel" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/Qt6Qml/QmlPlugins" TYPE FILE FILES
    "D:/QT/qtopcua/build/Desktop_Qt_6_9_1_MinGW_64_bit-Debug/lib/cmake/Qt6Qml/QmlPlugins/Qt6DeclarativeOpcuapluginConfig.cmake"
    "D:/QT/qtopcua/build/Desktop_Qt_6_9_1_MinGW_64_bit-Debug/lib/cmake/Qt6Qml/QmlPlugins/Qt6DeclarativeOpcuapluginConfigVersion.cmake"
    "D:/QT/qtopcua/build/Desktop_Qt_6_9_1_MinGW_64_bit-Debug/lib/cmake/Qt6Qml/QmlPlugins/Qt6DeclarativeOpcuapluginConfigVersionImpl.cmake"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/qml/QtOpcUa" TYPE MODULE FILES "D:/QT/qtopcua/build/Desktop_Qt_6_9_1_MinGW_64_bit-Debug/qml/QtOpcUa/declarativeopcuaplugin.dll")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/qml/QtOpcUa/declarativeopcuaplugin.dll" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/qml/QtOpcUa/declarativeopcuaplugin.dll")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "D:/QT/qtopcua/build/Desktop_Qt_6_9_1_MinGW_64_bit-Debug/bin/qt-internal-strip.bat" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/qml/QtOpcUa/declarativeopcuaplugin.dll")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/Qt6Qml/QmlPlugins/Qt6DeclarativeOpcuapluginTargets.cmake")
    file(DIFFERENT _cmake_export_file_changed FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/Qt6Qml/QmlPlugins/Qt6DeclarativeOpcuapluginTargets.cmake"
         "D:/QT/qtopcua/build/Desktop_Qt_6_9_1_MinGW_64_bit-Debug/src/declarative_opcua/CMakeFiles/Export/a1553df5751c39c799cb845445fde701/Qt6DeclarativeOpcuapluginTargets.cmake")
    if(_cmake_export_file_changed)
      file(GLOB _cmake_old_config_files "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/Qt6Qml/QmlPlugins/Qt6DeclarativeOpcuapluginTargets-*.cmake")
      if(_cmake_old_config_files)
        string(REPLACE ";" ", " _cmake_old_config_files_text "${_cmake_old_config_files}")
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/Qt6Qml/QmlPlugins/Qt6DeclarativeOpcuapluginTargets.cmake\" will be replaced.  Removing files [${_cmake_old_config_files_text}].")
        unset(_cmake_old_config_files_text)
        file(REMOVE ${_cmake_old_config_files})
      endif()
      unset(_cmake_old_config_files)
    endif()
    unset(_cmake_export_file_changed)
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/Qt6Qml/QmlPlugins" TYPE FILE FILES "D:/QT/qtopcua/build/Desktop_Qt_6_9_1_MinGW_64_bit-Debug/src/declarative_opcua/CMakeFiles/Export/a1553df5751c39c799cb845445fde701/Qt6DeclarativeOpcuapluginTargets.cmake")
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/Qt6Qml/QmlPlugins" TYPE FILE FILES "D:/QT/qtopcua/build/Desktop_Qt_6_9_1_MinGW_64_bit-Debug/src/declarative_opcua/CMakeFiles/Export/a1553df5751c39c799cb845445fde701/Qt6DeclarativeOpcuapluginTargets-debug.cmake")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/qml/QtOpcUa" TYPE FILE FILES "D:/QT/qtopcua/build/Desktop_Qt_6_9_1_MinGW_64_bit-Debug/qml/QtOpcUa/declarativeopcuaplugin.debug")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/qml/QtOpcUa" TYPE FILE FILES "D:/QT/qtopcua/build/Desktop_Qt_6_9_1_MinGW_64_bit-Debug/qml/QtOpcUa/plugins.qmltypes")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/qml/QtOpcUa" TYPE FILE FILES "D:/QT/qtopcua/build/Desktop_Qt_6_9_1_MinGW_64_bit-Debug/qml/QtOpcUa/qmldir")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/Qt6DeclarativeOpcua" TYPE FILE FILES "D:/QT/qtopcua/build/Desktop_Qt_6_9_1_MinGW_64_bit-Debug/lib/cmake/Qt6DeclarativeOpcua/Qt6DeclarativeOpcuaAdditionalTargetInfo.cmake")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/Qt6DeclarativeOpcuaPrivate" TYPE FILE FILES "D:/QT/qtopcua/build/Desktop_Qt_6_9_1_MinGW_64_bit-Debug/lib/cmake/Qt6DeclarativeOpcuaPrivate/Qt6DeclarativeOpcuaPrivateAdditionalTargetInfo.cmake")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/Qt6Qml/QmlPlugins" TYPE FILE FILES "D:/QT/qtopcua/build/Desktop_Qt_6_9_1_MinGW_64_bit-Debug/lib/cmake/Qt6Qml/QmlPlugins/Qt6DeclarativeOpcuapluginAdditionalTargetInfo.cmake")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/QtDeclarativeOpcua" TYPE DIRECTORY FILES "D:/QT/qtopcua/build/Desktop_Qt_6_9_1_MinGW_64_bit-Debug/include/QtDeclarativeOpcua/.syncqt_staging/")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/QtDeclarativeOpcua" TYPE FILE FILES "D:/QT/qtopcua/build/Desktop_Qt_6_9_1_MinGW_64_bit-Debug/include/QtDeclarativeOpcua/QtDeclarativeOpcuaDepends")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/QtDeclarativeOpcua/6.9.1/QtDeclarativeOpcua/private" TYPE FILE FILES
    "D:/QT/qtopcua/src/declarative_opcua/opcuaattributecache_p.h"
    "D:/QT/qtopcua/src/declarative_opcua/opcuaattributeoperand_p.h"
    "D:/QT/qtopcua/src/declarative_opcua/opcuaattributevalue_p.h"
    "D:/QT/qtopcua/src/declarative_opcua/opcuaconnection_p.h"
    "D:/QT/qtopcua/src/declarative_opcua/opcuadatachangefilter_p.h"
    "D:/QT/qtopcua/src/declarative_opcua/opcuaelementoperand_p.h"
    "D:/QT/qtopcua/src/declarative_opcua/opcuaendpointdiscovery_p.h"
    "D:/QT/qtopcua/src/declarative_opcua/opcuaeventfilter_p.h"
    "D:/QT/qtopcua/src/declarative_opcua/opcuafilterelement_p.h"
    "D:/QT/qtopcua/src/declarative_opcua/opcuaforeign_p.h"
    "D:/QT/qtopcua/src/declarative_opcua/opcualiteraloperand_p.h"
    "D:/QT/qtopcua/src/declarative_opcua/opcuamethodargument_p.h"
    "D:/QT/qtopcua/src/declarative_opcua/opcuamethodnode_p.h"
    "D:/QT/qtopcua/src/declarative_opcua/opcuanode_p.h"
    "D:/QT/qtopcua/src/declarative_opcua/opcuanodeid_p.h"
    "D:/QT/qtopcua/src/declarative_opcua/opcuanodeidtype_p.h"
    "D:/QT/qtopcua/src/declarative_opcua/opcuaoperandbase_p.h"
    "D:/QT/qtopcua/src/declarative_opcua/opcuapathresolver_p.h"
    "D:/QT/qtopcua/src/declarative_opcua/opcuareaditem_p.h"
    "D:/QT/qtopcua/src/declarative_opcua/opcuareadresult_p.h"
    "D:/QT/qtopcua/src/declarative_opcua/opcuarelativenodeid_p.h"
    "D:/QT/qtopcua/src/declarative_opcua/opcuarelativenodepath_p.h"
    "D:/QT/qtopcua/src/declarative_opcua/opcuaserverdiscovery_p.h"
    "D:/QT/qtopcua/src/declarative_opcua/opcuasimpleattributeoperand_p.h"
    "D:/QT/qtopcua/src/declarative_opcua/opcuastatus_p.h"
    "D:/QT/qtopcua/src/declarative_opcua/opcuavaluenode_p.h"
    "D:/QT/qtopcua/src/declarative_opcua/opcuawriteitem_p.h"
    "D:/QT/qtopcua/src/declarative_opcua/opcuawriteresult_p.h"
    "D:/QT/qtopcua/src/declarative_opcua/universalnode_p.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/mkspecs/modules" TYPE FILE FILES
    "D:/QT/qtopcua/build/Desktop_Qt_6_9_1_MinGW_64_bit-Debug/mkspecs/modules/qt_lib_declarativeopcua.pri"
    "D:/QT/qtopcua/build/Desktop_Qt_6_9_1_MinGW_64_bit-Debug/mkspecs/modules/qt_lib_declarativeopcua_private.pri"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "D:/QT/qtopcua/build/Desktop_Qt_6_9_1_MinGW_64_bit-Debug/lib/pkgconfig/Qt6DeclarativeOpcua.pc")
endif()

