
        file(APPEND "D:/QT/qtopcua/build/Desktop_Qt_6_9_1_MinGW_64_bit-Debug/qt_sbom/staging-qtopcua.spdx.in"
"
PackageName: QOpen62541Plugin
SPDXID: SPDXRef-Package-qtopcua-qt-plugin-QOpen62541Plugin
PackageDownloadLocation: git://code.qt.io/qt/qtopcua.git@f86f8572102fc4fd0aaccd296d69c0248e2a66ac
PackageVersion: 6.9.1
PackageSupplier: Organization: TheQtCompany
PackageLicenseConcluded: LicenseRef-Qt-Commercial OR LGPL-3.0-only OR GPL-2.0-only OR GPL-3.0-only
PackageLicenseDeclared: LicenseRef-Qt-Commercial OR LGPL-3.0-only OR GPL-2.0-only OR GPL-3.0-only
ExternalRef: PACKAGE-MANAGER purl pkg:github/qt/qtopcua@f86f857?library_name=QOpen62541Plugin#src/plugins/opcua/open62541
ExternalRef: PACKAGE-MANAGER purl pkg:generic/TheQtCompany/qtopcua-QOpen62541Plugin@f86f857?vcs_url=https://code.qt.io/qt/qtopcua.git@f86f857&library_name=QOpen62541Plugin#src/plugins/opcua/open62541
FilesAnalyzed: true
PackageCopyrightText: <text>Copyright (C) The Qt Company Ltd. and other contributors.</text>
PrimaryPackagePurpose: LIBRARY
PackageComment: <text>
CMake target name: QOpen62541Plugin
</text>
ExternalRef: SECURITY cpe23Type cpe:2.3:a:qt:qtopcua:6.9.1:*:*:*:*:*:*:*
ExternalRef: SECURITY cpe23Type cpe:2.3:a:qt:qt:6.9.1:*:*:*:*:*:*:*
Relationship: SPDXRef-Package-qtopcua-qt-plugin-QOpen62541Plugin DEPENDS_ON DocumentRef-qtbase:SPDXRef-Package-qtbase-qt-module-Core
Relationship: SPDXRef-Package-qtopcua-qt-plugin-QOpen62541Plugin DEPENDS_ON DocumentRef-qtbase:SPDXRef-Package-qtbase-qt-module-Network
Relationship: SPDXRef-Package-qtopcua-qt-plugin-QOpen62541Plugin DEPENDS_ON DocumentRef-qtbase:SPDXRef-Package-qtbase-qt-module-PlatformPluginInternal
Relationship: SPDXRef-Package-qtopcua-qt-plugin-QOpen62541Plugin DEPENDS_ON SPDXRef-Package-qtopcua-qt-module-OpcUa
Relationship: SPDXRef-Package-qtopcua-qt-plugin-QOpen62541Plugin DEPENDS_ON SPDXRef-Package-qtopcua-qt-3rdparty-sources-QOpen62541Plugin-Attribution-open62541
Relationship: SPDXRef-Package-qtopcua CONTAINS SPDXRef-Package-qtopcua-qt-plugin-QOpen62541Plugin
"
        )
