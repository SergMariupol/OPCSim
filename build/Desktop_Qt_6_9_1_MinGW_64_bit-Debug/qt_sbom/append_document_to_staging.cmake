
        cmake_minimum_required(VERSION 3.16)
        message(STATUS "Starting SBOM generation in build dir: D:/QT/qtopcua/build/Desktop_Qt_6_9_1_MinGW_64_bit-Debug/qt_sbom/staging-qtopcua.spdx.in")
        set(QT_SBOM_EXTERNAL_DOC_REFS "")
        file(READ "D:/QT/qtopcua/build/Desktop_Qt_6_9_1_MinGW_64_bit-Debug/qt_sbom/SPDXRef-DOCUMENT-qtopcua.spdx.in" content)
        # Override any previous file because we're starting from scratch.
        file(WRITE "D:/QT/qtopcua/build/Desktop_Qt_6_9_1_MinGW_64_bit-Debug/qt_sbom/staging-qtopcua.spdx.in" "${content}")
