QT.opcua.VERSION = 6.9.1
QT.opcua.name = QtOpcUa
QT.opcua.module = Qt6OpcUa
QT.opcua.libs = $$QT_MODULE_LIB_BASE
QT.opcua.ldflags = 
QT.opcua.includes = $$QT_MODULE_INCLUDE_BASE $$QT_MODULE_INCLUDE_BASE/QtOpcUa
QT.opcua.frameworks = 
QT.opcua.bins = $$QT_MODULE_BIN_BASE
QT.opcua.plugin_types = opcua
QT.opcua.depends =  core network
QT.opcua.uses = 
QT.opcua.module_config = v2
QT.opcua.DEFINES = QT_OPCUA_LIB
QT.opcua.enabled_features = open62541
QT.opcua.disabled_features = gds open62541-security
QT_CONFIG += open62541
QT_MODULES += opcua

