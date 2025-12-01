cmake_minimum_required(VERSION 3.16)

# Minimal datasimulation-only build
project(datasimulation LANGUAGES C CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOUIC ON)

find_package(Qt6 REQUIRED COMPONENTS Core Widgets OpcUa)

set(DATA_SIMULATION_ROOT "${CMAKE_CURRENT_SOURCE_DIR}/examples/opcua/datasimulation")
set(OPEN62541_ROOT "${CMAKE_CURRENT_SOURCE_DIR}/src/3rdparty/open62541")
set(OPEN62541_C "${OPEN62541_ROOT}/open62541.c")
set(OPEN62541_H "${OPEN62541_ROOT}/open62541.h")

add_executable(datasimulation
    ${DATA_SIMULATION_ROOT}/main.cpp
    ${DATA_SIMULATION_ROOT}/controlwindow.cpp
    ${DATA_SIMULATION_ROOT}/controlwindow.h
    ${DATA_SIMULATION_ROOT}/simulationserver.cpp
    ${DATA_SIMULATION_ROOT}/simulationserver.h
    ${OPEN62541_C}
    ${OPEN62541_H}
)

set_target_properties(datasimulation PROPERTIES
    OUTPUT_NAME datasimulationserver
    WIN32_EXECUTABLE FALSE
    MACOSX_BUNDLE TRUE
)

target_include_directories(datasimulation PRIVATE
    ${DATA_SIMULATION_ROOT}
    ${OPEN62541_ROOT}
)

if(APPLE)
    set_source_files_properties(${OPEN62541_C} PROPERTIES
        COMPILE_DEFINITIONS "_DARWIN_C_SOURCE")
endif()

if(NOT (WINRT OR (WIN32 AND MSVC)))
    set_source_files_properties(${OPEN62541_C} PROPERTIES COMPILE_OPTIONS
        "-Wno-unused-parameter;-Wno-incompatible-pointer-types;-Wno-maybe-uninitialized;-Wno-format-overflow;-std=c99")
elseif(WIN32 AND MSVC)
    set_source_files_properties(${OPEN62541_C} PROPERTIES COMPILE_OPTIONS
        "/Zc:strictStrings-;/permissive;/wd4133")
endif()

if(WIN32)
    target_link_libraries(datasimulation PRIVATE iphlpapi)
endif()

target_link_libraries(datasimulation PRIVATE
    Qt6::Core
    Qt6::Widgets
    Qt6::OpcUa
)

install(TARGETS datasimulation
    RUNTIME DESTINATION bin
    BUNDLE  DESTINATION bin
    LIBRARY DESTINATION bin
)
