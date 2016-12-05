exists(config.pri):infile(config.pri, SOLUTIONS_LIBRARY, yes): CONFIG += quazip-uselib
TEMPLATE += fakelib
QUAZIP_LIBNAME = $$qtLibraryTarget(quazip-head)
TEMPLATE -= fakelib
QUAZIP_LIBDIR = $$PWD/lib
unix:quazip-uselib:!quazip-buildlib:QMAKE_RPATHDIR += $$QUAZIP_LIBDIR
