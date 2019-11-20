#ifndef QUAZIP_GLOBAL_H
#define QUAZIP_GLOBAL_H

/*
Copyright (C) 2005-2014 Sergey A. Tachenov

This file is part of QuaZIP.

QuaZIP is free software: you can redistribute it and/or modify
it under the terms of the GNU Lesser General Public License as published by
the Free Software Foundation, either version 2.1 of the License, or
(at your option) any later version.

QuaZIP is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public License
along with QuaZIP.  If not, see <http://www.gnu.org/licenses/>.

See COPYING file for the full LGPL text.

Original ZIP package is copyrighted by Gilles Vollant and contributors,
see quazip/(un)zip.h files for details. Basically it's the zlib license.
*/

#include <QtCore/qglobal.h>

/**
  This is automatically defined when building a static library, but when
  including QuaZip sources directly into a project, QUAZIP_STATIC should
  be defined explicitly to avoid possible troubles with unnecessary
  importing/exporting.
  */
//#ifdef QUAZIP_STATIC
//#define QUAZIP_EXPORT
//#else
/**
 * When building a DLL with MSVC, QUAZIP_BUILD must be defined.
 * qglobal.h takes care of defining Q_DECL_* correctly for msvc/gcc.
 */
//#if defined(QUAZIP_BUILD)
//	#define QUAZIP_EXPORT Q_DECL_EXPORT
//#else
//	#define QUAZIP_EXPORT Q_DECL_IMPORT
//#endif
//#endif // QUAZIP_STATIC

#if defined(Q_OS_WIN)
#  if !defined(QUAZIP_EXPORT) && !defined(QUAZIP_IMPORT)
#    define QUAZIP_EXPORT
#  elif defined(QUAZIP_IMPORT)
#    if defined(QUAZIP_EXPORT)
#      undef QUAZIP_EXPORT
#    endif
#    define QUAZIP_EXPORT __declspec(dllimport)
#  elif defined(QUAZIP_EXPORT)
#    undef QUAZIP_EXPORT
#    define QUAZIP_EXPORT __declspec(dllexport)
#  endif
#else
#  define QUAZIP_EXPORT
#endif

#ifdef __GNUC__
#define QUAZIP_UNUSED __attribute__((__unused__))
#else
#define QUAZIP_UNUSED
#endif

#define QUAZIP_EXTRA_NTFS_MAGIC 0x000Au
#define QUAZIP_EXTRA_NTFS_TIME_MAGIC 0x0001u
#define QUAZIP_EXTRA_EXT_TIME_MAGIC 0x5455u
#define QUAZIP_EXTRA_EXT_MOD_TIME_FLAG 1
#define QUAZIP_EXTRA_EXT_AC_TIME_FLAG 2
#define QUAZIP_EXTRA_EXT_CR_TIME_FLAG 4

#endif // QUAZIP_GLOBAL_H
