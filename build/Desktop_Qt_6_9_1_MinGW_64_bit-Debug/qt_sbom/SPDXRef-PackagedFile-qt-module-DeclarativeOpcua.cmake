
        if(NOT EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/Qt6DeclarativeOpcua.dll"
                AND NOT QT_SBOM_BUILD_TIME AND NOT QT_SBOM_FAKE_CHECKSUM)
            if(NOT FALSE)
                message(FATAL_ERROR "Cannot find 'bin/Qt6DeclarativeOpcua.dll' to compute its checksum. "
                    "Expected to find it at '$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/Qt6DeclarativeOpcua.dll' ")
            endif()
        else()
            if(NOT QT_SBOM_BUILD_TIME)
                if(QT_SBOM_FAKE_CHECKSUM)
                    set(sha1 "158942a783ee1095eafacaffd93de73edeadbeef")
                else()
                    file(SHA1 "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/Qt6DeclarativeOpcua.dll" sha1)
                endif()
                list(APPEND QT_SBOM_VERIFICATION_CODES ${sha1})
            endif()
            file(APPEND "D:/QT/qtopcua/build/Desktop_Qt_6_9_1_MinGW_64_bit-Debug/qt_sbom/staging-qtopcua.spdx.in"
"
FileName: ./bin/Qt6DeclarativeOpcua.dll
SPDXID: SPDXRef-PackagedFile-qt-module-DeclarativeOpcua
FileType: BINARY
FileChecksum: SHA1: ${sha1}
LicenseConcluded: LicenseRef-Qt-Commercial OR LGPL-3.0-only OR GPL-2.0-only OR GPL-3.0-only
FileCopyrightText: <text>Copyright (C) The Qt Company Ltd. and other contributors.</text>
LicenseInfoInFile: NOASSERTION
Relationship: SPDXRef-Package-qtopcua-qt-module-DeclarativeOpcua CONTAINS SPDXRef-PackagedFile-qt-module-DeclarativeOpcua
Relationship: SPDXRef-PackagedFile-qt-module-DeclarativeOpcua GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/declarative_opcua//src_dir/qtopcua/build/Desktop_Qt_6_9_1_MinGW_64_bit-Debug/src/declarative_opcua/DeclarativeOpcua_resource.rc
Relationship: SPDXRef-PackagedFile-qt-module-DeclarativeOpcua GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/declarative_opcua/opcuaattributecache.cpp
Relationship: SPDXRef-PackagedFile-qt-module-DeclarativeOpcua GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/declarative_opcua/opcuaattributecache_p.h
Relationship: SPDXRef-PackagedFile-qt-module-DeclarativeOpcua GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/declarative_opcua/opcuaattributeoperand.cpp
Relationship: SPDXRef-PackagedFile-qt-module-DeclarativeOpcua GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/declarative_opcua/opcuaattributeoperand_p.h
Relationship: SPDXRef-PackagedFile-qt-module-DeclarativeOpcua GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/declarative_opcua/opcuaattributevalue.cpp
Relationship: SPDXRef-PackagedFile-qt-module-DeclarativeOpcua GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/declarative_opcua/opcuaattributevalue_p.h
Relationship: SPDXRef-PackagedFile-qt-module-DeclarativeOpcua GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/declarative_opcua/opcuaconnection.cpp
Relationship: SPDXRef-PackagedFile-qt-module-DeclarativeOpcua GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/declarative_opcua/opcuaconnection_p.h
Relationship: SPDXRef-PackagedFile-qt-module-DeclarativeOpcua GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/declarative_opcua/opcuadatachangefilter.cpp
Relationship: SPDXRef-PackagedFile-qt-module-DeclarativeOpcua GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/declarative_opcua/opcuadatachangefilter_p.h
Relationship: SPDXRef-PackagedFile-qt-module-DeclarativeOpcua GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/declarative_opcua/opcuaelementoperand.cpp
Relationship: SPDXRef-PackagedFile-qt-module-DeclarativeOpcua GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/declarative_opcua/opcuaelementoperand_p.h
Relationship: SPDXRef-PackagedFile-qt-module-DeclarativeOpcua GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/declarative_opcua/opcuaendpointdiscovery.cpp
Relationship: SPDXRef-PackagedFile-qt-module-DeclarativeOpcua GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/declarative_opcua/opcuaendpointdiscovery_p.h
Relationship: SPDXRef-PackagedFile-qt-module-DeclarativeOpcua GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/declarative_opcua/opcuaeventfilter.cpp
Relationship: SPDXRef-PackagedFile-qt-module-DeclarativeOpcua GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/declarative_opcua/opcuaeventfilter_p.h
Relationship: SPDXRef-PackagedFile-qt-module-DeclarativeOpcua GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/declarative_opcua/opcuafilterelement.cpp
Relationship: SPDXRef-PackagedFile-qt-module-DeclarativeOpcua GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/declarative_opcua/opcuafilterelement_p.h
Relationship: SPDXRef-PackagedFile-qt-module-DeclarativeOpcua GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/declarative_opcua/opcuaforeign.cpp
Relationship: SPDXRef-PackagedFile-qt-module-DeclarativeOpcua GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/declarative_opcua/opcuaforeign_p.h
Relationship: SPDXRef-PackagedFile-qt-module-DeclarativeOpcua GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/declarative_opcua/opcualiteraloperand.cpp
Relationship: SPDXRef-PackagedFile-qt-module-DeclarativeOpcua GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/declarative_opcua/opcualiteraloperand_p.h
Relationship: SPDXRef-PackagedFile-qt-module-DeclarativeOpcua GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/declarative_opcua/opcuamethodargument.cpp
Relationship: SPDXRef-PackagedFile-qt-module-DeclarativeOpcua GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/declarative_opcua/opcuamethodargument_p.h
Relationship: SPDXRef-PackagedFile-qt-module-DeclarativeOpcua GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/declarative_opcua/opcuamethodnode.cpp
Relationship: SPDXRef-PackagedFile-qt-module-DeclarativeOpcua GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/declarative_opcua/opcuamethodnode_p.h
Relationship: SPDXRef-PackagedFile-qt-module-DeclarativeOpcua GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/declarative_opcua/opcuanode.cpp
Relationship: SPDXRef-PackagedFile-qt-module-DeclarativeOpcua GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/declarative_opcua/opcuanode_p.h
Relationship: SPDXRef-PackagedFile-qt-module-DeclarativeOpcua GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/declarative_opcua/opcuanodeid.cpp
Relationship: SPDXRef-PackagedFile-qt-module-DeclarativeOpcua GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/declarative_opcua/opcuanodeid_p.h
Relationship: SPDXRef-PackagedFile-qt-module-DeclarativeOpcua GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/declarative_opcua/opcuanodeidtype.cpp
Relationship: SPDXRef-PackagedFile-qt-module-DeclarativeOpcua GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/declarative_opcua/opcuanodeidtype_p.h
Relationship: SPDXRef-PackagedFile-qt-module-DeclarativeOpcua GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/declarative_opcua/opcuaoperandbase.cpp
Relationship: SPDXRef-PackagedFile-qt-module-DeclarativeOpcua GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/declarative_opcua/opcuaoperandbase_p.h
Relationship: SPDXRef-PackagedFile-qt-module-DeclarativeOpcua GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/declarative_opcua/opcuapathresolver.cpp
Relationship: SPDXRef-PackagedFile-qt-module-DeclarativeOpcua GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/declarative_opcua/opcuapathresolver_p.h
Relationship: SPDXRef-PackagedFile-qt-module-DeclarativeOpcua GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/declarative_opcua/opcuareaditem.cpp
Relationship: SPDXRef-PackagedFile-qt-module-DeclarativeOpcua GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/declarative_opcua/opcuareaditem_p.h
Relationship: SPDXRef-PackagedFile-qt-module-DeclarativeOpcua GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/declarative_opcua/opcuareadresult.cpp
Relationship: SPDXRef-PackagedFile-qt-module-DeclarativeOpcua GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/declarative_opcua/opcuareadresult_p.h
Relationship: SPDXRef-PackagedFile-qt-module-DeclarativeOpcua GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/declarative_opcua/opcuarelativenodeid.cpp
Relationship: SPDXRef-PackagedFile-qt-module-DeclarativeOpcua GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/declarative_opcua/opcuarelativenodeid_p.h
Relationship: SPDXRef-PackagedFile-qt-module-DeclarativeOpcua GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/declarative_opcua/opcuarelativenodepath.cpp
Relationship: SPDXRef-PackagedFile-qt-module-DeclarativeOpcua GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/declarative_opcua/opcuarelativenodepath_p.h
Relationship: SPDXRef-PackagedFile-qt-module-DeclarativeOpcua GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/declarative_opcua/opcuaserverdiscovery.cpp
Relationship: SPDXRef-PackagedFile-qt-module-DeclarativeOpcua GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/declarative_opcua/opcuaserverdiscovery_p.h
Relationship: SPDXRef-PackagedFile-qt-module-DeclarativeOpcua GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/declarative_opcua/opcuasimpleattributeoperand.cpp
Relationship: SPDXRef-PackagedFile-qt-module-DeclarativeOpcua GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/declarative_opcua/opcuasimpleattributeoperand_p.h
Relationship: SPDXRef-PackagedFile-qt-module-DeclarativeOpcua GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/declarative_opcua/opcuastatus.cpp
Relationship: SPDXRef-PackagedFile-qt-module-DeclarativeOpcua GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/declarative_opcua/opcuastatus_p.h
Relationship: SPDXRef-PackagedFile-qt-module-DeclarativeOpcua GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/declarative_opcua/opcuavaluenode.cpp
Relationship: SPDXRef-PackagedFile-qt-module-DeclarativeOpcua GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/declarative_opcua/opcuavaluenode_p.h
Relationship: SPDXRef-PackagedFile-qt-module-DeclarativeOpcua GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/declarative_opcua/opcuawriteitem.cpp
Relationship: SPDXRef-PackagedFile-qt-module-DeclarativeOpcua GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/declarative_opcua/opcuawriteitem_p.h
Relationship: SPDXRef-PackagedFile-qt-module-DeclarativeOpcua GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/declarative_opcua/opcuawriteresult.cpp
Relationship: SPDXRef-PackagedFile-qt-module-DeclarativeOpcua GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/declarative_opcua/opcuawriteresult_p.h
Relationship: SPDXRef-PackagedFile-qt-module-DeclarativeOpcua GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/declarative_opcua/universalnode.cpp
Relationship: SPDXRef-PackagedFile-qt-module-DeclarativeOpcua GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/declarative_opcua/universalnode_p.h
Relationship: SPDXRef-PackagedFile-qt-module-DeclarativeOpcua GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/build/Desktop_Qt_6_9_1_MinGW_64_bit-Debug/src/declarative_opcua/declarativeopcua_qmltyperegistrations.cpp
Relationship: SPDXRef-PackagedFile-qt-module-DeclarativeOpcua GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/build/Desktop_Qt_6_9_1_MinGW_64_bit-Debug/src/declarative_opcua/.qt/rcc/qrc_qmake_QtOpcUa.cpp
"
                )
        endif()
