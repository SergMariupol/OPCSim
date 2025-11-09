
        if(NOT EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/qopcuaxmldatatypes2cpp.exe"
                AND NOT QT_SBOM_BUILD_TIME AND NOT QT_SBOM_FAKE_CHECKSUM)
            if(NOT FALSE)
                message(FATAL_ERROR "Cannot find 'bin/qopcuaxmldatatypes2cpp.exe' to compute its checksum. "
                    "Expected to find it at '$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/qopcuaxmldatatypes2cpp.exe' ")
            endif()
        else()
            if(NOT QT_SBOM_BUILD_TIME)
                if(QT_SBOM_FAKE_CHECKSUM)
                    set(sha1 "158942a783ee1095eafacaffd93de73edeadbeef")
                else()
                    file(SHA1 "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/qopcuaxmldatatypes2cpp.exe" sha1)
                endif()
                list(APPEND QT_SBOM_VERIFICATION_CODES ${sha1})
            endif()
            file(APPEND "D:/QT/qtopcua/build/Desktop_Qt_6_9_1_MinGW_64_bit-Debug/qt_sbom/staging-qtopcua.spdx.in"
"
FileName: ./bin/qopcuaxmldatatypes2cpp.exe
SPDXID: SPDXRef-PackagedFile-qt-tool-qopcuaxmldatatypes2cpp
FileType: BINARY
FileChecksum: SHA1: ${sha1}
LicenseConcluded: LicenseRef-Qt-Commercial OR GPL-3.0-only WITH Qt-GPL-exception-1.0
FileCopyrightText: <text>Copyright (C) The Qt Company Ltd. and other contributors.</text>
LicenseInfoInFile: NOASSERTION
Relationship: SPDXRef-Package-qtopcua-qt-tool-qopcuaxmldatatypes2cpp CONTAINS SPDXRef-PackagedFile-qt-tool-qopcuaxmldatatypes2cpp
Relationship: SPDXRef-PackagedFile-qt-tool-qopcuaxmldatatypes2cpp GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/tools/datatypecodegenerator//src_dir/qtopcua/build/Desktop_Qt_6_9_1_MinGW_64_bit-Debug/tools/datatypecodegenerator/qopcuaxmldatatypes2cpp_resource.rc
Relationship: SPDXRef-PackagedFile-qt-tool-qopcuaxmldatatypes2cpp GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/tools/datatypecodegenerator/main.cpp
Relationship: SPDXRef-PackagedFile-qt-tool-qopcuaxmldatatypes2cpp GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/tools/datatypecodegenerator/util.cpp
Relationship: SPDXRef-PackagedFile-qt-tool-qopcuaxmldatatypes2cpp GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/tools/datatypecodegenerator/util.h
Relationship: SPDXRef-PackagedFile-qt-tool-qopcuaxmldatatypes2cpp GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/tools/datatypecodegenerator/datatypefilewriter.cpp
Relationship: SPDXRef-PackagedFile-qt-tool-qopcuaxmldatatypes2cpp GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/tools/datatypecodegenerator/datatypefilewriter.h
Relationship: SPDXRef-PackagedFile-qt-tool-qopcuaxmldatatypes2cpp GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/tools/datatypecodegenerator/dependencydatatypevalidator.cpp
Relationship: SPDXRef-PackagedFile-qt-tool-qopcuaxmldatatypes2cpp GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/tools/datatypecodegenerator/dependencydatatypevalidator.h
Relationship: SPDXRef-PackagedFile-qt-tool-qopcuaxmldatatypes2cpp GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/tools/datatypecodegenerator/enumeratedtype.cpp
Relationship: SPDXRef-PackagedFile-qt-tool-qopcuaxmldatatypes2cpp GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/tools/datatypecodegenerator/enumeratedtype.h
Relationship: SPDXRef-PackagedFile-qt-tool-qopcuaxmldatatypes2cpp GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/tools/datatypecodegenerator/enumeratedvalue.cpp
Relationship: SPDXRef-PackagedFile-qt-tool-qopcuaxmldatatypes2cpp GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/tools/datatypecodegenerator/enumeratedvalue.h
Relationship: SPDXRef-PackagedFile-qt-tool-qopcuaxmldatatypes2cpp GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/tools/datatypecodegenerator/field.cpp
Relationship: SPDXRef-PackagedFile-qt-tool-qopcuaxmldatatypes2cpp GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/tools/datatypecodegenerator/field.h
Relationship: SPDXRef-PackagedFile-qt-tool-qopcuaxmldatatypes2cpp GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/tools/datatypecodegenerator/import.cpp
Relationship: SPDXRef-PackagedFile-qt-tool-qopcuaxmldatatypes2cpp GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/tools/datatypecodegenerator/import.h
Relationship: SPDXRef-PackagedFile-qt-tool-qopcuaxmldatatypes2cpp GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/tools/datatypecodegenerator/mappingfilegenerator.cpp
Relationship: SPDXRef-PackagedFile-qt-tool-qopcuaxmldatatypes2cpp GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/tools/datatypecodegenerator/mappingfilegenerator.h
Relationship: SPDXRef-PackagedFile-qt-tool-qopcuaxmldatatypes2cpp GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/tools/datatypecodegenerator/nodeidgenerator.cpp
Relationship: SPDXRef-PackagedFile-qt-tool-qopcuaxmldatatypes2cpp GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/tools/datatypecodegenerator/nodeidgenerator.h
Relationship: SPDXRef-PackagedFile-qt-tool-qopcuaxmldatatypes2cpp GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/tools/datatypecodegenerator/recursivedescentparser.cpp
Relationship: SPDXRef-PackagedFile-qt-tool-qopcuaxmldatatypes2cpp GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/tools/datatypecodegenerator/recursivedescentparser.h
Relationship: SPDXRef-PackagedFile-qt-tool-qopcuaxmldatatypes2cpp GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/tools/datatypecodegenerator/stringidentifier.cpp
Relationship: SPDXRef-PackagedFile-qt-tool-qopcuaxmldatatypes2cpp GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/tools/datatypecodegenerator/stringidentifier.h
Relationship: SPDXRef-PackagedFile-qt-tool-qopcuaxmldatatypes2cpp GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/tools/datatypecodegenerator/structuredtype.cpp
Relationship: SPDXRef-PackagedFile-qt-tool-qopcuaxmldatatypes2cpp GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/tools/datatypecodegenerator/structuredtype.h
Relationship: SPDXRef-PackagedFile-qt-tool-qopcuaxmldatatypes2cpp GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/tools/datatypecodegenerator/typedictionary.cpp
Relationship: SPDXRef-PackagedFile-qt-tool-qopcuaxmldatatypes2cpp GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/tools/datatypecodegenerator/typedictionary.h
Relationship: SPDXRef-PackagedFile-qt-tool-qopcuaxmldatatypes2cpp GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/tools/datatypecodegenerator/visitor.h
Relationship: SPDXRef-PackagedFile-qt-tool-qopcuaxmldatatypes2cpp GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/tools/datatypecodegenerator/xmlelement.cpp
Relationship: SPDXRef-PackagedFile-qt-tool-qopcuaxmldatatypes2cpp GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/tools/datatypecodegenerator/xmlelement.h
Relationship: SPDXRef-PackagedFile-qt-tool-qopcuaxmldatatypes2cpp GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/build/Desktop_Qt_6_9_1_MinGW_64_bit-Debug/tools/datatypecodegenerator/qopcuaxmldatatypes2cpp_longpath.rc
Relationship: SPDXRef-PackagedFile-qt-tool-qopcuaxmldatatypes2cpp GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/build/Desktop_Qt_6_9_1_MinGW_64_bit-Debug/tools/datatypecodegenerator/qopcuaxmldatatypes2cpp_longpath.manifest
"
                )
        endif()
