
        if(NOT EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/plugins/opcua/open62541_backend.dll"
                AND NOT QT_SBOM_BUILD_TIME AND NOT QT_SBOM_FAKE_CHECKSUM)
            if(NOT FALSE)
                message(FATAL_ERROR "Cannot find 'plugins/opcua/open62541_backend.dll' to compute its checksum. "
                    "Expected to find it at '$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/plugins/opcua/open62541_backend.dll' ")
            endif()
        else()
            if(NOT QT_SBOM_BUILD_TIME)
                if(QT_SBOM_FAKE_CHECKSUM)
                    set(sha1 "158942a783ee1095eafacaffd93de73edeadbeef")
                else()
                    file(SHA1 "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/plugins/opcua/open62541_backend.dll" sha1)
                endif()
                list(APPEND QT_SBOM_VERIFICATION_CODES ${sha1})
            endif()
            file(APPEND "D:/QT/qtopcua/build/Desktop_Qt_6_9_1_MinGW_64_bit-Debug/qt_sbom/staging-qtopcua.spdx.in"
"
FileName: ./plugins/opcua/open62541_backend.dll
SPDXID: SPDXRef-PackagedFile-qt-plugin-QOpen62541Plugin
FileType: BINARY
FileChecksum: SHA1: ${sha1}
LicenseConcluded: LicenseRef-Qt-Commercial OR LGPL-3.0-only OR GPL-2.0-only OR GPL-3.0-only
FileCopyrightText: <text>Copyright (C) The Qt Company Ltd. and other contributors.</text>
LicenseInfoInFile: NOASSERTION
Relationship: SPDXRef-Package-qtopcua-qt-plugin-QOpen62541Plugin CONTAINS SPDXRef-PackagedFile-qt-plugin-QOpen62541Plugin
Relationship: SPDXRef-PackagedFile-qt-plugin-QOpen62541Plugin GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/plugins/opcua/open62541/qopen62541.h
Relationship: SPDXRef-PackagedFile-qt-plugin-QOpen62541Plugin GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/plugins/opcua/open62541/qopen62541backend.cpp
Relationship: SPDXRef-PackagedFile-qt-plugin-QOpen62541Plugin GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/plugins/opcua/open62541/qopen62541backend.h
Relationship: SPDXRef-PackagedFile-qt-plugin-QOpen62541Plugin GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/plugins/opcua/open62541/qopen62541client.cpp
Relationship: SPDXRef-PackagedFile-qt-plugin-QOpen62541Plugin GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/plugins/opcua/open62541/qopen62541client.h
Relationship: SPDXRef-PackagedFile-qt-plugin-QOpen62541Plugin GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/plugins/opcua/open62541/qopen62541node.cpp
Relationship: SPDXRef-PackagedFile-qt-plugin-QOpen62541Plugin GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/plugins/opcua/open62541/qopen62541node.h
Relationship: SPDXRef-PackagedFile-qt-plugin-QOpen62541Plugin GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/plugins/opcua/open62541/qopen62541plugin.cpp
Relationship: SPDXRef-PackagedFile-qt-plugin-QOpen62541Plugin GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/plugins/opcua/open62541/qopen62541plugin.h
Relationship: SPDXRef-PackagedFile-qt-plugin-QOpen62541Plugin GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/plugins/opcua/open62541/qopen62541subscription.cpp
Relationship: SPDXRef-PackagedFile-qt-plugin-QOpen62541Plugin GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/plugins/opcua/open62541/qopen62541subscription.h
Relationship: SPDXRef-PackagedFile-qt-plugin-QOpen62541Plugin GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/plugins/opcua/open62541/qopen62541utils.cpp
Relationship: SPDXRef-PackagedFile-qt-plugin-QOpen62541Plugin GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/plugins/opcua/open62541/qopen62541utils.h
Relationship: SPDXRef-PackagedFile-qt-plugin-QOpen62541Plugin GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/plugins/opcua/open62541/qopen62541valueconverter.cpp
Relationship: SPDXRef-PackagedFile-qt-plugin-QOpen62541Plugin GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/plugins/opcua/open62541/qopen62541valueconverter.h
Relationship: SPDXRef-PackagedFile-qt-plugin-QOpen62541Plugin GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/3rdparty/open62541/open62541.h
Relationship: SPDXRef-PackagedFile-qt-plugin-QOpen62541Plugin GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/3rdparty/open62541/open62541.c
Relationship: SPDXRef-PackagedFile-qt-plugin-QOpen62541Plugin GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/plugins/opcua/open62541//src_dir/qtopcua/build/Desktop_Qt_6_9_1_MinGW_64_bit-Debug/src/plugins/opcua/open62541/QOpen62541Plugin_resource.rc
"
                )
        endif()
