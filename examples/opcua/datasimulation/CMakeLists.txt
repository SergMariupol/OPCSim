cmake_minimum_required(VERSION 3.16)
project(datasimulation LANGUAGES CXX C)

if (ANDROID)
    message(FATAL_ERROR "This project cannot be built on Android.")
endif()

if(NOT DEFINED INSTALL_EXAMPLESDIR)
    set(INSTALL_EXAMPLESDIR "examples")
endif()

set(INSTALL_EXAMPLEDIR "${INSTALL_EXAMPLESDIR}/opcua/datasimulation")

find_package(Qt6 REQUIRED COMPONENTS Core OpcUa)

qt_standard_project_setup()

if (EXISTS ../../../../../${Qt6_VERSION}/Src/qtopcua/)
    set(MODULE_SOURCE ../../../../../${Qt6_VERSION}/Src/qtopcua/)
else()
    set(MODULE_SOURCE ../../../../)
endif()

qt_add_executable(datasimulation
    main.cpp
    simulationserver.cpp simulationserver.h
)

set_target_properties(datasimulation PROPERTIES
    OUTPUT_NAME datasimulationserver
    WIN32_EXECUTABLE FALSE
    MACOSX_BUNDLE TRUE
)

target_link_libraries(datasimulation PRIVATE
    Qt6::Core
    Qt6::OpcUa
    Qt6::OpcUaPrivate
)

if (QT_FEATURE_open62541 AND NOT QT_FEATURE_system_open62541)
    target_sources(datasimulation PRIVATE
        ${MODULE_SOURCE}/src/3rdparty/open62541/open62541.h
        ${MODULE_SOURCE}/src/3rdparty/open62541/open62541.c
    )
    target_include_directories(datasimulation PRIVATE
        ${MODULE_SOURCE}/src/3rdparty/open62541
    )
endif()

qt_opcua_disable_optimizations_in_current_dir()

if (QT_FEATURE_open62541 AND NOT QT_FEATURE_system_open62541)
    if(WIN32 AND (GCC OR CLANG))
        target_link_libraries(datasimulation PRIVATE
            iphlpapi
        )
    elseif(WIN32 AND MSVC)
        target_link_libraries(datasimulation PRIVATE
            iphlpapi.lib
        )
    endif()

    if (APPLE)
        set_source_files_properties(${MODULE_SOURCE}/src/3rdparty/open62541/open62541.c PROPERTIES
        COMPILE_DEFINITIONS
            "_DARWIN_C_SOURCE")
    endif()

    if (NOT (WINRT OR WIN32 AND MSVC))
        set_source_files_properties(${MODULE_SOURCE}/src/3rdparty/open62541/open62541.c
        PROPERTIES COMPILE_OPTIONS
            "-Wno-unused-parameter;-Wno-incompatible-pointer-types;-Wno-maybe-uninitialized;-Wno-format-overflow;-std=c99")
    elseif(WIN32 AND MSVC)
        set_source_files_properties(${MODULE_SOURCE}/src/3rdparty/open62541/open62541.c
            PROPERTIES COMPILE_OPTIONS
                "/Zc:strictStrings-;/permissive;/wd4133")
    endif()
endif()

if (QT_FEATURE_system_open62541)
    find_package(open62541)
    if (OPEN62541_SYSTEM_ENCRYPTION)
        find_package(WrapOpenSSL)
        target_link_libraries(datasimulation PRIVATE
            WrapOpenSSL::WrapOpenSSL
        )
    endif()
    target_compile_definitions(datasimulation PRIVATE USE_SYSTEM_OPEN62541)
endif()

if(QT_FEATURE_system_open62541 OR NOT QT_FEATURE_open62541)
    target_link_libraries(datasimulation PRIVATE
        open62541::open62541
    )
endif()

install(TARGETS datasimulation
    RUNTIME DESTINATION "${INSTALL_EXAMPLEDIR}"
    BUNDLE DESTINATION "${INSTALL_EXAMPLEDIR}"
    LIBRARY DESTINATION "${INSTALL_EXAMPLEDIR}"
)
