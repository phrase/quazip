include(../common.pri)
QT -= gui
INCLUDEPATH += $$PWD
DEPENDPATH += $$PWD

# ZLib dependency
greaterThan(QT_MAJOR_VERSION, 4){
win32:INCLUDEPATH += $$[QT_INSTALL_HEADERS]/QtZlib
} else {
win32:INCLUDEPATH += $(MEMSOURCE_LIB)/qt/src/3rdparty/zlib
}

greaterThan( QT_MAJOR_VERSION, 5 ) {
    QT += core5compat
}

unix:LIBS += -lz

quazip-uselib:!quazip-buildlib {
    LIBS += -L$$QUAZIP_LIBDIR -l$$QUAZIP_LIBNAME
} else {
  HEADERS += \
        $$PWD/minizip_crypt.h \
        $$PWD/ioapi.h \
        $$PWD/JlCompress.h \
        $$PWD/quaadler32.h \
        $$PWD/quachecksum32.h \
        $$PWD/quacrc32.h \
        $$PWD/quagzipfile.h \
        $$PWD/quaziodevice.h \
        $$PWD/quazipdir.h \
        $$PWD/quazipfile.h \
        $$PWD/quazipfileinfo.h \
        $$PWD/quazip_global.h \
        $$PWD/quazip.h \
        $$PWD/quazipnewinfo.h \
        $$PWD/unzip.h \
        $$PWD/zip.h

  SOURCES += $$PWD/qioapi.cpp \
           $$PWD/JlCompress.cpp \
           $$PWD/quaadler32.cpp \
           $$PWD/quacrc32.cpp \
           $$PWD/quagzipfile.cpp \
           $$PWD/quaziodevice.cpp \
           $$PWD/quazip.cpp \
           $$PWD/quazipdir.cpp \
           $$PWD/quazipfile.cpp \
           $$PWD/quazipfileinfo.cpp \
           $$PWD/quazipnewinfo.cpp \
           $$PWD/unzip.c \
           $$PWD/zip.c 
}

win32 {
    contains(TEMPLATE, lib):contains(CONFIG, shared):DEFINES += QUAZIP_EXPORT
    else:quazip-uselib:DEFINES += QUAZIP_IMPORT
}