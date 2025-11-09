cmake_minimum_required(VERSION 3.16)

# -----------------------------------------------------------------------------
# datasimulation — Qt OPC UA example with robust open62541 detection
# -----------------------------------------------------------------------------
project(datasimulation LANGUAGES C CXX)

if(ANDROID)
    message(FATAL_ERROR "This project cannot be built on Android.")
endif()

# -----------------------------------------------------------------------------
# Install dirs for examples
# -----------------------------------------------------------------------------
if(NOT DEFINED INSTALL_EXAMPLESDIR)
    set(INSTALL_EXAMPLESDIR "examples")
endif()
set(INSTALL_EXAMPLEDIR "${INSTALL_EXAMPLESDIR}/opcua/datasimulation")

# -----------------------------------------------------------------------------
# Qt
# -----------------------------------------------------------------------------
find_package(Qt6 REQUIRED COMPONENTS Core Widgets OpcUa)
qt_standard_project_setup()

# -----------------------------------------------------------------------------
# Figure out MODULE_SOURCE (root of qtopcua sources)
# Priority:
#   1) -DMODULE_SOURCE=...
#   2) relative to this file: qtopcua/ (../../..)
#   3) legacy layout via Qt6_VERSION/Src/qtopcua
# Fallback to (2), but we will verify the files later.
# -----------------------------------------------------------------------------
if(NOT DEFINED MODULE_SOURCE OR MODULE_SOURCE STREQUAL "")
    # Our file is: qtopcua/examples/opcua/datasimulation/CMakeLists.txt
    get_filename_component(_QTOPCUA_ROOT "${CMAKE_CURRENT_LIST_DIR}/../../.." ABSOLUTE)

    # Legacy layout: <Qt>/Src/qtopcua
    set(_LEGACY_ROOT "${CMAKE_CURRENT_LIST_DIR}/../../../../../${Qt6_VERSION}/Src/qtopcua")

    if(EXISTS "${_QTOPCUA_ROOT}/src/3rdparty/open62541/open62541.h")
        set(MODULE_SOURCE "${_QTOPCUA_ROOT}")
    elseif(EXISTS "${_LEGACY_ROOT}/src/3rdparty/open62541/open62541.h")
        set(MODULE_SOURCE "${_LEGACY_ROOT}")
    else()
        # default guess
        set(MODULE_SOURCE "${_QTOPCUA_ROOT}")
    endif()
endif()
get_filename_component(MODULE_SOURCE "${MODULE_SOURCE}" ABSOLUTE)
message(STATUS "QtOpcUa module source root: ${MODULE_SOURCE}")

# Paths to bundled open62541 (amalgamation)
set(_O62541_DIR "${MODULE_SOURCE}/src/3rdparty/open62541")
set(_O62541_H   "${_O62541_DIR}/open62541.h")
set(_O62541_C   "${_O62541_DIR}/open62541.c")

# -----------------------------------------------------------------------------
# Target
# -----------------------------------------------------------------------------
qt_add_executable(datasimulation
    main.cpp
    simulationserver.cpp
    simulationserver.h
    controlwindow.cpp
    controlwindow.h
)

set_target_properties(datasimulation PROPERTIES
    OUTPUT_NAME datasimulationserver
    WIN32_EXECUTABLE FALSE
    MACOSX_BUNDLE TRUE
)

target_link_libraries(datasimulation PRIVATE
    Qt6::Core
    Qt6::Widgets
    Qt6::OpcUa
    Qt6::OpcUaPrivate
)

# -----------------------------------------------------------------------------
# Use bundled open62541 if available and not using system one
# -----------------------------------------------------------------------------
if(QT_FEATURE_open62541 AND NOT QT_FEATURE_system_open62541)
    # Early diagnostics (clear fatal if files are missing)
    if(NOT EXISTS "${_O62541_H}")
        message(FATAL_ERROR
            "open62541.h not found at: ${_O62541_H}\n"
            "Hint: init submodule (git submodule update --init --recursive) or pass "
            "-DMODULE_SOURCE=D:/QT/qtopcua"
        )
    endif()
    if(NOT EXISTS "${_O62541_C}")
        message(FATAL_ERROR
            "open62541.c not found at: ${_O62541_C}\n"
            "The datasimulation example needs the amalgamated .c file."
        )
    endif()

    target_sources(datasimulation PRIVATE
        "${_O62541_H}"
        "${_O62541_C}"
    )
    target_include_directories(datasimulation PRIVATE
        "${_O62541_DIR}"
    )

    # Platform-specific compile options for the amalgamated C file
    if(APPLE)
        set_source_files_properties("${_O62541_C}" PROPERTIES
            COMPILE_DEFINITIONS "_DARWIN_C_SOURCE"
        )
    endif()

    if(NOT (WINRT OR (WIN32 AND MSVC)))
        # GCC/Clang (Linux/macOS/MinGW/Clang-cl): silence some warnings; enforce C99 on that file
        set_source_files_properties("${_O62541_C}" PROPERTIES COMPILE_OPTIONS
            "-Wno-unused-parameter;-Wno-incompatible-pointer-types;-Wno-maybe-uninitialized;-Wno-format-overflow;-std=c99"
        )
    elseif(WIN32 AND MSVC)
        # MSVC-specific flags used by Qt's example
        set_source_files_properties("${_O62541_C}" PROPERTIES COMPILE_OPTIONS
            "/Zc:strictStrings-;/permissive;/wd4133"
        )
    endif()

    # Windows extra libs for open62541
    if(WIN32 AND (GCC OR CLANG))
        target_link_libraries(datasimulation PRIVATE iphlpapi)
    elseif(WIN32 AND MSVC)
        target_link_libraries(datasimulation PRIVATE iphlpapi.lib)
    endif()
endif()

# -----------------------------------------------------------------------------
# System open62541 (if Qt was built against system lib)
# -----------------------------------------------------------------------------
if(QT_FEATURE_system_open62541)
    find_package(open62541 REQUIRED)
    if(OPEN62541_SYSTEM_ENCRYPTION)
        find_package(WrapOpenSSL REQUIRED)
        target_link_libraries(datasimulation PRIVATE WrapOpenSSL::WrapOpenSSL)
    endif()
    target_compile_definitions(datasimulation PRIVATE USE_SYSTEM_OPEN62541)
endif()

# If Qt expects a system open62541 target or its own feature is off,
# link against the imported target provided by the package.
if(QT_FEATURE_system_open62541 OR NOT QT_FEATURE_open62541)
    target_link_libraries(datasimulation PRIVATE open62541::open62541)
endif()

# -----------------------------------------------------------------------------
# Qt helper from QtOpcUa (kept from original example)
# -----------------------------------------------------------------------------
qt_opcua_disable_optimizations_in_current_dir()

# -----------------------------------------------------------------------------
# Install
# -----------------------------------------------------------------------------
install(TARGETS datasimulation
    RUNTIME DESTINATION "${INSTALL_EXAMPLEDIR}"
    BUNDLE  DESTINATION "${INSTALL_EXAMPLEDIR}"
    LIBRARY DESTINATION "${INSTALL_EXAMPLEDIR}"
)

install(FILES
    CMakeLists.txt
    datasimulation.pro
    main.cpp
    simulationserver.cpp
    simulationserver.h
    DESTINATION "${INSTALL_EXAMPLEDIR}"
)

install(FILES doc/datasimulation.qdoc
    DESTINATION "${INSTALL_EXAMPLEDIR}/doc"
)
