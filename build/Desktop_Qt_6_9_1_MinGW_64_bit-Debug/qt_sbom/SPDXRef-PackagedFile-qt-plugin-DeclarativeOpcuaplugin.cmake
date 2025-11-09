
        if(NOT EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/qml/QtOpcUa/declarativeopcuaplugin.dll"
                AND NOT QT_SBOM_BUILD_TIME AND NOT QT_SBOM_FAKE_CHECKSUM)
            if(NOT FALSE)
                message(FATAL_ERROR "Cannot find 'qml/QtOpcUa/declarativeopcuaplugin.dll' to compute its checksum. "
                    "Expected to find it at '$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/qml/QtOpcUa/declarativeopcuaplugin.dll' ")
            endif()
        else()
            if(NOT QT_SBOM_BUILD_TIME)
                if(QT_SBOM_FAKE_CHECKSUM)
                    set(sha1 "158942a783ee1095eafacaffd93de73edeadbeef")
                else()
                    file(SHA1 "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/qml/QtOpcUa/declarativeopcuaplugin.dll" sha1)
                endif()
                list(APPEND QT_SBOM_VERIFICATION_CODES ${sha1})
            endif()
            file(APPEND "D:/QT/qtopcua/build/Desktop_Qt_6_9_1_MinGW_64_bit-Debug/qt_sbom/staging-qtopcua.spdx.in"
"
FileName: ./qml/QtOpcUa/declarativeopcuaplugin.dll
SPDXID: SPDXRef-PackagedFile-qt-plugin-DeclarativeOpcuaplugin
FileType: BINARY
FileChecksum: SHA1: ${sha1}
LicenseConcluded: LicenseRef-Qt-Commercial OR LGPL-3.0-only OR GPL-2.0-only OR GPL-3.0-only
FileCopyrightText: <text>Copyright (C) The Qt Company Ltd. and other contributors.</text>
LicenseInfoInFile: NOASSERTION
Relationship: SPDXRef-Package-qtopcua-qt-plugin-DeclarativeOpcuaplugin CONTAINS SPDXRef-PackagedFile-qt-plugin-DeclarativeOpcuaplugin
Relationship: SPDXRef-PackagedFile-qt-plugin-DeclarativeOpcuaplugin GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/build/Desktop_Qt_6_9_1_MinGW_64_bit-Debug/src/declarative_opcua/DeclarativeOpcuaplugin_QtOpcUaPlugin.cpp
Relationship: SPDXRef-PackagedFile-qt-plugin-DeclarativeOpcuaplugin GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/declarative_opcua//src_dir/qtopcua/build/Desktop_Qt_6_9_1_MinGW_64_bit-Debug/src/declarative_opcua/DeclarativeOpcuaplugin_resource.rc
"
                )
        endif()
