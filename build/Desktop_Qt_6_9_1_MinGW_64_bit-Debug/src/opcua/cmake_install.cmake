# Install script for directory: D:/QT/qtopcua/src/opcua

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/./metatypes" TYPE FILE FILES "D:/QT/qtopcua/build/Desktop_Qt_6_9_1_MinGW_64_bit-Debug/src/opcua/meta_types/qt6opcua_debug_metatypes.json")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Devel" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/Qt6OpcUa" TYPE FILE FILES
    "D:/QT/qtopcua/build/Desktop_Qt_6_9_1_MinGW_64_bit-Debug/lib/cmake/Qt6OpcUa/Qt6OpcUaConfig.cmake"
    "D:/QT/qtopcua/build/Desktop_Qt_6_9_1_MinGW_64_bit-Debug/lib/cmake/Qt6OpcUa/Qt6OpcUaConfigVersion.cmake"
    "D:/QT/qtopcua/build/Desktop_Qt_6_9_1_MinGW_64_bit-Debug/lib/cmake/Qt6OpcUa/Qt6OpcUaConfigVersionImpl.cmake"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Devel" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/Qt6OpcUa" TYPE FILE FILES "D:/QT/qtopcua/src/opcua/Qt6OpcUaMacros.cmake")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Devel" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/Qt6OpcUaPrivate" TYPE FILE FILES
    "D:/QT/qtopcua/build/Desktop_Qt_6_9_1_MinGW_64_bit-Debug/lib/cmake/Qt6OpcUaPrivate/Qt6OpcUaPrivateConfig.cmake"
    "D:/QT/qtopcua/build/Desktop_Qt_6_9_1_MinGW_64_bit-Debug/lib/cmake/Qt6OpcUaPrivate/Qt6OpcUaPrivateConfigVersion.cmake"
    "D:/QT/qtopcua/build/Desktop_Qt_6_9_1_MinGW_64_bit-Debug/lib/cmake/Qt6OpcUaPrivate/Qt6OpcUaPrivateConfigVersionImpl.cmake"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "D:/QT/qtopcua/build/Desktop_Qt_6_9_1_MinGW_64_bit-Debug/lib/libQt6OpcUa.a")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "D:/QT/qtopcua/build/Desktop_Qt_6_9_1_MinGW_64_bit-Debug/bin/Qt6OpcUa.dll")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/Qt6OpcUa.dll" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/Qt6OpcUa.dll")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "D:/QT/qtopcua/build/Desktop_Qt_6_9_1_MinGW_64_bit-Debug/bin/qt-internal-strip.bat" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/Qt6OpcUa.dll")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/Qt6OpcUa/Qt6OpcUaTargets.cmake")
    file(DIFFERENT _cmake_export_file_changed FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/Qt6OpcUa/Qt6OpcUaTargets.cmake"
         "D:/QT/qtopcua/build/Desktop_Qt_6_9_1_MinGW_64_bit-Debug/src/opcua/CMakeFiles/Export/a62b892d1848085576fd2321b08bf888/Qt6OpcUaTargets.cmake")
    if(_cmake_export_file_changed)
      file(GLOB _cmake_old_config_files "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/Qt6OpcUa/Qt6OpcUaTargets-*.cmake")
      if(_cmake_old_config_files)
        string(REPLACE ";" ", " _cmake_old_config_files_text "${_cmake_old_config_files}")
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/Qt6OpcUa/Qt6OpcUaTargets.cmake\" will be replaced.  Removing files [${_cmake_old_config_files_text}].")
        unset(_cmake_old_config_files_text)
        file(REMOVE ${_cmake_old_config_files})
      endif()
      unset(_cmake_old_config_files)
    endif()
    unset(_cmake_export_file_changed)
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/Qt6OpcUa" TYPE FILE FILES "D:/QT/qtopcua/build/Desktop_Qt_6_9_1_MinGW_64_bit-Debug/src/opcua/CMakeFiles/Export/a62b892d1848085576fd2321b08bf888/Qt6OpcUaTargets.cmake")
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/Qt6OpcUa" TYPE FILE FILES "D:/QT/qtopcua/build/Desktop_Qt_6_9_1_MinGW_64_bit-Debug/src/opcua/CMakeFiles/Export/a62b892d1848085576fd2321b08bf888/Qt6OpcUaTargets-debug.cmake")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Devel" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/Qt6OpcUa" TYPE FILE FILES
    "D:/QT/qtopcua/build/Desktop_Qt_6_9_1_MinGW_64_bit-Debug/lib/cmake/Qt6OpcUa/Qt6OpcUaVersionlessAliasTargets.cmake"
    "D:/QT/qtopcua/build/Desktop_Qt_6_9_1_MinGW_64_bit-Debug/lib/cmake/Qt6OpcUa/Qt6OpcUaVersionlessTargets.cmake"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Devel" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/Qt6OpcUa" TYPE FILE FILES
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/Qt6OpcUaPrivate/Qt6OpcUaPrivateTargets.cmake")
    file(DIFFERENT _cmake_export_file_changed FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/Qt6OpcUaPrivate/Qt6OpcUaPrivateTargets.cmake"
         "D:/QT/qtopcua/build/Desktop_Qt_6_9_1_MinGW_64_bit-Debug/src/opcua/CMakeFiles/Export/df3c417e2998d7b34b9193b95f1545ea/Qt6OpcUaPrivateTargets.cmake")
    if(_cmake_export_file_changed)
      file(GLOB _cmake_old_config_files "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/Qt6OpcUaPrivate/Qt6OpcUaPrivateTargets-*.cmake")
      if(_cmake_old_config_files)
        string(REPLACE ";" ", " _cmake_old_config_files_text "${_cmake_old_config_files}")
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/Qt6OpcUaPrivate/Qt6OpcUaPrivateTargets.cmake\" will be replaced.  Removing files [${_cmake_old_config_files_text}].")
        unset(_cmake_old_config_files_text)
        file(REMOVE ${_cmake_old_config_files})
      endif()
      unset(_cmake_old_config_files)
    endif()
    unset(_cmake_export_file_changed)
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/Qt6OpcUaPrivate" TYPE FILE FILES "D:/QT/qtopcua/build/Desktop_Qt_6_9_1_MinGW_64_bit-Debug/src/opcua/CMakeFiles/Export/df3c417e2998d7b34b9193b95f1545ea/Qt6OpcUaPrivateTargets.cmake")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Devel" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/Qt6OpcUaPrivate" TYPE FILE FILES
    "D:/QT/qtopcua/build/Desktop_Qt_6_9_1_MinGW_64_bit-Debug/lib/cmake/Qt6OpcUaPrivate/Qt6OpcUaPrivateVersionlessAliasTargets.cmake"
    "D:/QT/qtopcua/build/Desktop_Qt_6_9_1_MinGW_64_bit-Debug/lib/cmake/Qt6OpcUaPrivate/Qt6OpcUaPrivateVersionlessTargets.cmake"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Devel" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/Qt6OpcUaPrivate" TYPE FILE FILES
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE FILE FILES "D:/QT/qtopcua/build/Desktop_Qt_6_9_1_MinGW_64_bit-Debug/bin/Qt6OpcUa.debug")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/modules" TYPE FILE FILES "D:/QT/qtopcua/build/Desktop_Qt_6_9_1_MinGW_64_bit-Debug/modules/OpcUa.json")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "_install_html_docs_OpcUa")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/doc/qtopcua" TYPE DIRECTORY FILES "D:/QT/qtopcua/build/Desktop_Qt_6_9_1_MinGW_64_bit-Debug/doc/qtopcua/")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "_install_qch_docs_OpcUa")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/doc" TYPE FILE FILES "D:/QT/qtopcua/build/Desktop_Qt_6_9_1_MinGW_64_bit-Debug/doc/qtopcua.qch")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/Qt6OpcUa" TYPE FILE FILES "D:/QT/qtopcua/build/Desktop_Qt_6_9_1_MinGW_64_bit-Debug/lib/cmake/Qt6OpcUa/Qt6OpcUaAdditionalTargetInfo.cmake")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/Qt6OpcUaPrivate" TYPE FILE FILES "D:/QT/qtopcua/build/Desktop_Qt_6_9_1_MinGW_64_bit-Debug/lib/cmake/Qt6OpcUaPrivate/Qt6OpcUaPrivateAdditionalTargetInfo.cmake")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/QtOpcUa" TYPE DIRECTORY FILES "D:/QT/qtopcua/build/Desktop_Qt_6_9_1_MinGW_64_bit-Debug/include/QtOpcUa/.syncqt_staging/")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/QtOpcUa" TYPE FILE FILES
    "D:/QT/qtopcua/build/Desktop_Qt_6_9_1_MinGW_64_bit-Debug/include/QtOpcUa/qtopcuaexports.h"
    "D:/QT/qtopcua/src/opcua/client/qopcuaaddnodeitem.h"
    "D:/QT/qtopcua/src/opcua/client/qopcuaaddreferenceitem.h"
    "D:/QT/qtopcua/src/opcua/client/qopcuaapplicationdescription.h"
    "D:/QT/qtopcua/src/opcua/client/qopcuaapplicationidentity.h"
    "D:/QT/qtopcua/src/opcua/client/qopcuaapplicationrecorddatatype.h"
    "D:/QT/qtopcua/src/opcua/client/qopcuaargument.h"
    "D:/QT/qtopcua/src/opcua/client/qopcuaattributeoperand.h"
    "D:/QT/qtopcua/src/opcua/client/qopcuaauthenticationinformation.h"
    "D:/QT/qtopcua/src/opcua/client/qopcuaaxisinformation.h"
    "D:/QT/qtopcua/src/opcua/client/qopcuabinarydataencoding.h"
    "D:/QT/qtopcua/src/opcua/client/qopcuabrowsepathtarget.h"
    "D:/QT/qtopcua/src/opcua/client/qopcuabrowserequest.h"
    "D:/QT/qtopcua/src/opcua/client/qopcuaclient.h"
    "D:/QT/qtopcua/src/opcua/client/qopcuacomplexnumber.h"
    "D:/QT/qtopcua/src/opcua/client/qopcuaconnectionsettings.h"
    "D:/QT/qtopcua/src/opcua/client/qopcuacontentfilterelement.h"
    "D:/QT/qtopcua/src/opcua/client/qopcuacontentfilterelementresult.h"
    "D:/QT/qtopcua/src/opcua/client/qopcuadatavalue.h"
    "D:/QT/qtopcua/src/opcua/client/qopcuadeletereferenceitem.h"
    "D:/QT/qtopcua/src/opcua/client/qopcuadoublecomplexnumber.h"
    "D:/QT/qtopcua/src/opcua/client/qopcuaelementoperand.h"
    "D:/QT/qtopcua/src/opcua/client/qopcuaendpointdescription.h"
    "D:/QT/qtopcua/src/opcua/client/qopcuaenumdefinition.h"
    "D:/QT/qtopcua/src/opcua/client/qopcuaenumfield.h"
    "D:/QT/qtopcua/src/opcua/client/qopcuaerrorstate.h"
    "D:/QT/qtopcua/src/opcua/client/qopcuaeuinformation.h"
    "D:/QT/qtopcua/src/opcua/client/qopcuaeventfilterresult.h"
    "D:/QT/qtopcua/src/opcua/client/qopcuaexpandednodeid.h"
    "D:/QT/qtopcua/src/opcua/client/qopcuaextensionobject.h"
    "D:/QT/qtopcua/src/opcua/client/qopcuahistorydata.h"
    "D:/QT/qtopcua/src/opcua/client/qopcuahistoryevent.h"
    "D:/QT/qtopcua/src/opcua/client/qopcuahistoryreadrawrequest.h"
    "D:/QT/qtopcua/src/opcua/client/qopcuahistoryreadeventrequest.h"
    "D:/QT/qtopcua/src/opcua/client/qopcuahistoryreadresponse.h"
    "D:/QT/qtopcua/src/opcua/client/qopcuagenericstructvalue.h"
    "D:/QT/qtopcua/src/opcua/client/qopcuagenericstructhandler.h"
    "D:/QT/qtopcua/src/opcua/client/qopcualiteraloperand.h"
    "D:/QT/qtopcua/src/opcua/client/qopcualocalizedtext.h"
    "D:/QT/qtopcua/src/opcua/client/qopcuamonitoringparameters.h"
    "D:/QT/qtopcua/src/opcua/client/qopcuamultidimensionalarray.h"
    "D:/QT/qtopcua/src/opcua/client/qopcuanode.h"
    "D:/QT/qtopcua/src/opcua/client/qopcuanodecreationattributes.h"
    "D:/QT/qtopcua/src/opcua/client/qopcuanodeids.h"
    "D:/QT/qtopcua/src/opcua/client/qopcuapkiconfiguration.h"
    "D:/QT/qtopcua/src/opcua/client/qopcuaqualifiedname.h"
    "D:/QT/qtopcua/src/opcua/client/qopcuarange.h"
    "D:/QT/qtopcua/src/opcua/client/qopcuareaditem.h"
    "D:/QT/qtopcua/src/opcua/client/qopcuareadresult.h"
    "D:/QT/qtopcua/src/opcua/client/qopcuareferencedescription.h"
    "D:/QT/qtopcua/src/opcua/client/qopcuarelativepathelement.h"
    "D:/QT/qtopcua/src/opcua/client/qopcuasimpleattributeoperand.h"
    "D:/QT/qtopcua/src/opcua/client/qopcuastructuredefinition.h"
    "D:/QT/qtopcua/src/opcua/client/qopcuastructurefield.h"
    "D:/QT/qtopcua/src/opcua/client/qopcuatype.h"
    "D:/QT/qtopcua/src/opcua/client/qopcuausertokenpolicy.h"
    "D:/QT/qtopcua/src/opcua/client/qopcuawriteitem.h"
    "D:/QT/qtopcua/src/opcua/client/qopcuawriteresult.h"
    "D:/QT/qtopcua/src/opcua/client/qopcuaxvalue.h"
    "D:/QT/qtopcua/src/opcua/client/qopcuadiagnosticinfo.h"
    "D:/QT/qtopcua/src/opcua/client/qopcuavariant.h"
    "D:/QT/qtopcua/src/opcua/core/qopcuaplugin.h"
    "D:/QT/qtopcua/src/opcua/core/qopcuaprovider.h"
    "D:/QT/qtopcua/src/opcua/qopcuaglobal.h"
    "D:/QT/qtopcua/build/Desktop_Qt_6_9_1_MinGW_64_bit-Debug/src/opcua/qtopcua-config.h"
    "D:/QT/qtopcua/build/Desktop_Qt_6_9_1_MinGW_64_bit-Debug/include/QtOpcUa/QtOpcUaDepends"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/QtOpcUa/6.9.1/QtOpcUa/private" TYPE FILE FILES
    "D:/QT/qtopcua/src/opcua/client/qopcuabackend_p.h"
    "D:/QT/qtopcua/src/opcua/client/qopcuaclient_p.h"
    "D:/QT/qtopcua/src/opcua/client/qopcuaclientimpl_p.h"
    "D:/QT/qtopcua/src/opcua/client/qopcuahistoryreadresponseimpl_p.h"
    "D:/QT/qtopcua/src/opcua/client/qopcuahistoryreadresponse_p.h"
    "D:/QT/qtopcua/src/opcua/client/qopcuainternaldatatypenode_p.h"
    "D:/QT/qtopcua/src/opcua/client/qopcuagenericstructhandler_p.h"
    "D:/QT/qtopcua/src/opcua/client/qopcuamonitoringparameters_p.h"
    "D:/QT/qtopcua/src/opcua/client/qopcuanode_p.h"
    "D:/QT/qtopcua/src/opcua/client/qopcuanodecreationattributes_p.h"
    "D:/QT/qtopcua/src/opcua/client/qopcuanodeimpl_p.h"
    "D:/QT/qtopcua/build/Desktop_Qt_6_9_1_MinGW_64_bit-Debug/src/opcua/qtopcua-config_p.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/mkspecs/modules" TYPE FILE FILES
    "D:/QT/qtopcua/build/Desktop_Qt_6_9_1_MinGW_64_bit-Debug/mkspecs/modules/qt_lib_opcua.pri"
    "D:/QT/qtopcua/build/Desktop_Qt_6_9_1_MinGW_64_bit-Debug/mkspecs/modules/qt_lib_opcua_private.pri"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "D:/QT/qtopcua/build/Desktop_Qt_6_9_1_MinGW_64_bit-Debug/lib/pkgconfig/Qt6OpcUa.pc")
endif()

