TEMPLATE=lib
CONFIG += qt dll quazip-buildlib
mac:CONFIG += absolute_library_soname
win32|mac:!wince*:!win32-msvc:!macx-xcode:CONFIG += debug_and_release build_all
include(../quazip/quazip.pri)
TARGET = $$QUAZIP_LIBNAME
DESTDIR = $$QUAZIP_LIBDIR
win32 {
    DLLDESTDIR = $$[QT_INSTALL_BINS]
    QMAKE_DISTCLEAN += $$[QT_INSTALL_BINS]\\$${QUAZIP_LIBNAME}.dll
}
target.path = $$DESTDIR
INSTALLS += target
