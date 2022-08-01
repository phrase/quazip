exists(config.pri):infile(config.pri, SOLUTIONS_LIBRARY, yes): CONFIG += quazip-uselib
exists(config.pri):infile(config.pri, USE_TEXTCODEC, yes): {
 DEFINES += USE_TEXTCODEC
 CONFIG += use-textcodec
}
TEMPLATE += fakelib
QUAZIP_LIBNAME = $$qtLibraryTarget(quazip-head)
TEMPLATE -= fakelib
QUAZIP_LIBDIR = $$PWD/lib
unix:quazip-uselib:!quazip-buildlib:QMAKE_RPATHDIR += $$QUAZIP_LIBDIR
