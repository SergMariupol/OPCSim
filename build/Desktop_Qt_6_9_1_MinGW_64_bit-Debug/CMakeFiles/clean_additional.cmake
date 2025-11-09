# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "Debug")
  file(REMOVE_RECURSE
  "examples\\opcua\\datasimulation\\CMakeFiles\\datasimulation_autogen.dir\\AutogenUsed.txt"
  "examples\\opcua\\datasimulation\\CMakeFiles\\datasimulation_autogen.dir\\ParseCache.txt"
  "examples\\opcua\\datasimulation\\datasimulation_autogen"
  "examples\\opcua\\opcuaviewer\\CMakeFiles\\opcuaviewer_autogen.dir\\AutogenUsed.txt"
  "examples\\opcua\\opcuaviewer\\CMakeFiles\\opcuaviewer_autogen.dir\\ParseCache.txt"
  "examples\\opcua\\opcuaviewer\\opcuaviewer_autogen"
  "examples\\opcua\\waterpump\\simulationserver\\CMakeFiles\\simulationserver_autogen.dir\\AutogenUsed.txt"
  "examples\\opcua\\waterpump\\simulationserver\\CMakeFiles\\simulationserver_autogen.dir\\ParseCache.txt"
  "examples\\opcua\\waterpump\\simulationserver\\simulationserver_autogen"
  "examples\\opcua\\waterpump\\waterpump-qml\\CMakeFiles\\waterpump-qml_autogen.dir\\AutogenUsed.txt"
  "examples\\opcua\\waterpump\\waterpump-qml\\CMakeFiles\\waterpump-qml_autogen.dir\\ParseCache.txt"
  "examples\\opcua\\waterpump\\waterpump-qml\\waterpump-qml_autogen"
  "examples\\opcua\\waterpump\\waterpump-qmlcpp\\CMakeFiles\\waterpump-qmlcpp_autogen.dir\\AutogenUsed.txt"
  "examples\\opcua\\waterpump\\waterpump-qmlcpp\\CMakeFiles\\waterpump-qmlcpp_autogen.dir\\ParseCache.txt"
  "examples\\opcua\\waterpump\\waterpump-qmlcpp\\waterpump-qmlcpp_autogen"
  "src\\declarative_opcua\\CMakeFiles\\DeclarativeOpcua_autogen.dir\\AutogenUsed.txt"
  "src\\declarative_opcua\\CMakeFiles\\DeclarativeOpcua_autogen.dir\\ParseCache.txt"
  "src\\declarative_opcua\\CMakeFiles\\DeclarativeOpcuaplugin_autogen.dir\\AutogenUsed.txt"
  "src\\declarative_opcua\\CMakeFiles\\DeclarativeOpcuaplugin_autogen.dir\\ParseCache.txt"
  "src\\declarative_opcua\\DeclarativeOpcua_autogen"
  "src\\declarative_opcua\\DeclarativeOpcuaplugin_autogen"
  "src\\opcua\\CMakeFiles\\OpcUa_autogen.dir\\AutogenUsed.txt"
  "src\\opcua\\CMakeFiles\\OpcUa_autogen.dir\\ParseCache.txt"
  "src\\opcua\\OpcUa_autogen"
  "src\\plugins\\opcua\\open62541\\CMakeFiles\\QOpen62541Plugin_autogen.dir\\AutogenUsed.txt"
  "src\\plugins\\opcua\\open62541\\CMakeFiles\\QOpen62541Plugin_autogen.dir\\ParseCache.txt"
  "src\\plugins\\opcua\\open62541\\QOpen62541Plugin_autogen"
  "tools\\datatypecodegenerator\\CMakeFiles\\qopcuaxmldatatypes2cpp_autogen.dir\\AutogenUsed.txt"
  "tools\\datatypecodegenerator\\CMakeFiles\\qopcuaxmldatatypes2cpp_autogen.dir\\ParseCache.txt"
  "tools\\datatypecodegenerator\\qopcuaxmldatatypes2cpp_autogen"
  )
endif()
