
        if(NOT EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libQt6OpcUa.a"
                AND NOT QT_SBOM_BUILD_TIME AND NOT QT_SBOM_FAKE_CHECKSUM)
            if(NOT TRUE)
                message(FATAL_ERROR "Cannot find 'lib/libQt6OpcUa.a' to compute its checksum. "
                    "Expected to find it at '$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libQt6OpcUa.a' ")
            endif()
        else()
            if(NOT QT_SBOM_BUILD_TIME)
                if(QT_SBOM_FAKE_CHECKSUM)
                    set(sha1 "158942a783ee1095eafacaffd93de73edeadbeef")
                else()
                    file(SHA1 "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libQt6OpcUa.a" sha1)
                endif()
                list(APPEND QT_SBOM_VERIFICATION_CODES ${sha1})
            endif()
            file(APPEND "D:/QT/qtopcua/build/Desktop_Qt_6_9_1_MinGW_64_bit-Debug/qt_sbom/staging-qtopcua.spdx.in"
"
FileName: ./lib/libQt6OpcUa.a
SPDXID: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary
FileType: BINARY
FileChecksum: SHA1: ${sha1}
LicenseConcluded: LicenseRef-Qt-Commercial OR LGPL-3.0-only OR GPL-2.0-only OR GPL-3.0-only
FileCopyrightText: <text>Copyright (C) The Qt Company Ltd. and other contributors.</text>
LicenseInfoInFile: NOASSERTION
Relationship: SPDXRef-Package-qtopcua-qt-module-OpcUa CONTAINS SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/opcua//src_dir/qtopcua/build/Desktop_Qt_6_9_1_MinGW_64_bit-Debug/src/opcua/OpcUa_resource.rc
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/build/Desktop_Qt_6_9_1_MinGW_64_bit-Debug/include/QtOpcUa/qtopcuaexports.h
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/opcua/client/qopcuaaddnodeitem.cpp
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/opcua/client/qopcuaaddnodeitem.h
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/opcua/client/qopcuaaddreferenceitem.cpp
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/opcua/client/qopcuaaddreferenceitem.h
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/opcua/client/qopcuaapplicationdescription.cpp
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/opcua/client/qopcuaapplicationdescription.h
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/opcua/client/qopcuaapplicationidentity.cpp
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/opcua/client/qopcuaapplicationidentity.h
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/opcua/client/qopcuaapplicationrecorddatatype.cpp
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/opcua/client/qopcuaapplicationrecorddatatype.h
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/opcua/client/qopcuaargument.cpp
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/opcua/client/qopcuaargument.h
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/opcua/client/qopcuaattributeoperand.cpp
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/opcua/client/qopcuaattributeoperand.h
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/opcua/client/qopcuaauthenticationinformation.cpp
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/opcua/client/qopcuaauthenticationinformation.h
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/opcua/client/qopcuaaxisinformation.cpp
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/opcua/client/qopcuaaxisinformation.h
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/opcua/client/qopcuabackend.cpp
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/opcua/client/qopcuabackend_p.h
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/opcua/client/qopcuabinarydataencoding.cpp
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/opcua/client/qopcuabinarydataencoding.h
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/opcua/client/qopcuabrowsepathtarget.cpp
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/opcua/client/qopcuabrowsepathtarget.h
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/opcua/client/qopcuabrowserequest.cpp
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/opcua/client/qopcuabrowserequest.h
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/opcua/client/qopcuaclient.cpp
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/opcua/client/qopcuaclient.h
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/opcua/client/qopcuaclient_p.h
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/opcua/client/qopcuaclientimpl.cpp
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/opcua/client/qopcuaclientimpl_p.h
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/opcua/client/qopcuaclientprivate.cpp
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/opcua/client/qopcuacomplexnumber.cpp
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/opcua/client/qopcuacomplexnumber.h
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/opcua/client/qopcuaconnectionsettings.cpp
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/opcua/client/qopcuaconnectionsettings.h
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/opcua/client/qopcuacontentfilterelement.cpp
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/opcua/client/qopcuacontentfilterelement.h
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/opcua/client/qopcuacontentfilterelementresult.cpp
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/opcua/client/qopcuacontentfilterelementresult.h
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/opcua/client/qopcuadatavalue.cpp
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/opcua/client/qopcuadatavalue.h
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/opcua/client/qopcuadeletereferenceitem.cpp
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/opcua/client/qopcuadeletereferenceitem.h
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/opcua/client/qopcuadoublecomplexnumber.cpp
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/opcua/client/qopcuadoublecomplexnumber.h
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/opcua/client/qopcuaelementoperand.cpp
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/opcua/client/qopcuaelementoperand.h
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/opcua/client/qopcuaendpointdescription.cpp
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/opcua/client/qopcuaendpointdescription.h
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/opcua/client/qopcuaenumdefinition.cpp
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/opcua/client/qopcuaenumdefinition.h
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/opcua/client/qopcuaenumfield.cpp
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/opcua/client/qopcuaenumfield.h
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/opcua/client/qopcuaerrorstate.cpp
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/opcua/client/qopcuaerrorstate.h
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/opcua/client/qopcuaeuinformation.cpp
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/opcua/client/qopcuaeuinformation.h
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/opcua/client/qopcuaeventfilterresult.cpp
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/opcua/client/qopcuaeventfilterresult.h
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/opcua/client/qopcuaexpandednodeid.cpp
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/opcua/client/qopcuaexpandednodeid.h
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/opcua/client/qopcuaextensionobject.cpp
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/opcua/client/qopcuaextensionobject.h
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/opcua/client/qopcuahistorydata.cpp
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/opcua/client/qopcuahistorydata.h
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/opcua/client/qopcuahistoryevent.cpp
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/opcua/client/qopcuahistoryevent.h
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/opcua/client/qopcuahistoryreadrawrequest.cpp
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/opcua/client/qopcuahistoryreadrawrequest.h
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/opcua/client/qopcuahistoryreadeventrequest.cpp
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/opcua/client/qopcuahistoryreadeventrequest.h
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/opcua/client/qopcuahistoryreadresponse.cpp
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/opcua/client/qopcuahistoryreadresponse.h
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/opcua/client/qopcuahistoryreadresponseimpl.cpp
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/opcua/client/qopcuahistoryreadresponseimpl_p.h
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/opcua/client/qopcuahistoryreadresponse_p.h
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/opcua/client/qopcuainternaldatatypenode.cpp
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/opcua/client/qopcuainternaldatatypenode_p.h
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/opcua/client/qopcuagenericstructvalue.cpp
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/opcua/client/qopcuagenericstructvalue.h
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/opcua/client/qopcuagenericstructhandler.cpp
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/opcua/client/qopcuagenericstructhandler.h
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/opcua/client/qopcuagenericstructhandlerprivate.cpp
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/opcua/client/qopcuagenericstructhandler_p.h
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/opcua/client/qopcualiteraloperand.cpp
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/opcua/client/qopcualiteraloperand.h
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/opcua/client/qopcualocalizedtext.cpp
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/opcua/client/qopcualocalizedtext.h
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/opcua/client/qopcuamonitoringparameters.cpp
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/opcua/client/qopcuamonitoringparameters.h
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/opcua/client/qopcuamonitoringparameters_p.h
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/opcua/client/qopcuamultidimensionalarray.cpp
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/opcua/client/qopcuamultidimensionalarray.h
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/opcua/client/qopcuanode.cpp
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/opcua/client/qopcuanode.h
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/opcua/client/qopcuanode_p.h
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/opcua/client/qopcuanodecreationattributes.cpp
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/opcua/client/qopcuanodecreationattributes.h
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/opcua/client/qopcuanodecreationattributes_p.h
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/opcua/client/qopcuanodeids.cpp
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/opcua/client/qopcuanodeids.h
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/opcua/client/qopcuanodeimpl.cpp
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/opcua/client/qopcuanodeimpl_p.h
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/opcua/client/qopcuapkiconfiguration.cpp
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/opcua/client/qopcuapkiconfiguration.h
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/opcua/client/qopcuaqualifiedname.cpp
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/opcua/client/qopcuaqualifiedname.h
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/opcua/client/qopcuarange.cpp
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/opcua/client/qopcuarange.h
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/opcua/client/qopcuareaditem.cpp
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/opcua/client/qopcuareaditem.h
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/opcua/client/qopcuareadresult.cpp
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/opcua/client/qopcuareadresult.h
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/opcua/client/qopcuareferencedescription.cpp
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/opcua/client/qopcuareferencedescription.h
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/opcua/client/qopcuarelativepathelement.cpp
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/opcua/client/qopcuarelativepathelement.h
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/opcua/client/qopcuasimpleattributeoperand.cpp
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/opcua/client/qopcuasimpleattributeoperand.h
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/opcua/client/qopcuastructuredefinition.cpp
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/opcua/client/qopcuastructuredefinition.h
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/opcua/client/qopcuastructurefield.cpp
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/opcua/client/qopcuastructurefield.h
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/opcua/client/qopcuatype.cpp
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/opcua/client/qopcuatype.h
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/opcua/client/qopcuausertokenpolicy.cpp
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/opcua/client/qopcuausertokenpolicy.h
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/opcua/client/qopcuawriteitem.cpp
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/opcua/client/qopcuawriteitem.h
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/opcua/client/qopcuawriteresult.cpp
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/opcua/client/qopcuawriteresult.h
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/opcua/client/qopcuaxvalue.cpp
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/opcua/client/qopcuaxvalue.h
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/opcua/client/qopcuadiagnosticinfo.cpp
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/opcua/client/qopcuadiagnosticinfo.h
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/opcua/client/qopcuavariant.cpp
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/opcua/client/qopcuavariant.h
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/opcua/compat/removed_api.cpp
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/opcua/core/qopcuaplugin.cpp
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/opcua/core/qopcuaplugin.h
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/opcua/core/qopcuaprovider.cpp
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/opcua/core/qopcuaprovider.h
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/src/opcua/qopcuaglobal.h
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/build/Desktop_Qt_6_9_1_MinGW_64_bit-Debug/src/opcua/qtopcua-config.h
Relationship: SPDXRef-PackagedFile-qt-module-OpcUa-ImportLibrary GENERATED_FROM NOASSERTION
RelationshipComment: /src_dir/qtopcua/build/Desktop_Qt_6_9_1_MinGW_64_bit-Debug/src/opcua/qtopcua-config_p.h
"
                )
        endif()
