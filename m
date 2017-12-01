From: SZ Lin <sz.lin@moxa.com>
Subject: [libgpiod][PATCH] Make license type consistent between source files and COPYING file
Date: Fri,  1 Dec 2017 22:17:40 +0800
Message-ID: <20171201141740.20033-1-sz.lin@moxa.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pl0-f67.google.com ([209.85.160.67]:34206 "EHLO
        mail-pl0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753109AbdLAOSO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 1 Dec 2017 09:18:14 -0500
Received: by mail-pl0-f67.google.com with SMTP id d21so6342410pll.1
        for <linux-gpio@vger.kernel.org>; Fri, 01 Dec 2017 06:18:13 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: bartekgola@gmail.com
Cc: linux-gpio@vger.kernel.org, SZ Lin <sz.lin@moxa.com>

The license type of COPYING file is "LGPL-2.1+", but it declared
with "LGPL-2.1" in the beginning of source files

This patch fixes license type inconsistent issue in each source file

Signed-off-by: SZ Lin <sz.lin@moxa.com>
---
 Doxyfile                 | 7 ++++---
 Makefile.am              | 7 ++++---
 configure.ac             | 7 ++++---
 include/Makefile.am      | 7 ++++---
 include/gpiod.h          | 7 ++++---
 src/Makefile.am          | 7 ++++---
 src/lib/Makefile.am      | 7 ++++---
 src/lib/core.c           | 7 ++++---
 src/lib/helpers.c        | 7 ++++---
 src/lib/iter.c           | 7 ++++---
 src/lib/misc.c           | 7 ++++---
 src/lib/simple.c         | 7 ++++---
 src/tools/Makefile.am    | 7 ++++---
 src/tools/gpiodetect.c   | 7 ++++---
 src/tools/gpiofind.c     | 7 ++++---
 src/tools/gpioget.c      | 7 ++++---
 src/tools/gpioinfo.c     | 7 ++++---
 src/tools/gpiomon.c      | 7 ++++---
 src/tools/gpioset.c      | 7 ++++---
 src/tools/tools-common.c | 7 ++++---
 src/tools/tools-common.h | 7 ++++---
 tests/Makefile.am        | 7 ++++---
 tests/gpiod-test.c       | 7 ++++---
 tests/gpiod-test.h       | 7 ++++---
 tests/tests-chip.c       | 7 ++++---
 tests/tests-event.c      | 7 ++++---
 tests/tests-gpiodetect.c | 7 ++++---
 tests/tests-gpiofind.c   | 7 ++++---
 tests/tests-gpioget.c    | 7 ++++---
 tests/tests-gpioinfo.c   | 7 ++++---
 tests/tests-gpiomon.c    | 7 ++++---
 tests/tests-gpioset.c    | 7 ++++---
 tests/tests-iter.c       | 7 ++++---
 tests/tests-line.c       | 7 ++++---
 tests/tests-misc.c       | 7 ++++---
 tests/tests-simple-api.c | 7 ++++---
 36 files changed, 144 insertions(+), 108 deletions(-)

diff --git a/Doxyfile b/Doxyfile
index c9e2738..851e82a 100644
--- a/Doxyfile
+++ b/Doxyfile
@@ -1,9 +1,10 @@
 #
 # Copyright (C) 2017 Bartosz Golaszewski <bartekgola@gmail.com>
 #
-# This program is free software; you can redistribute it and/or modify it
-# under the terms of version 2.1 of the GNU Lesser General Public License
-# as published by the Free Software Foundation.
+# This library is free software; you can redistribute it and/or modify it
+# under the terms of the GNU Lesser General Public License as published by
+# the Free Software Foundation; either version 2.1 of the License, or (at
+# your option) any later version.
 #
 
 # libgpiod doxygen configuration
diff --git a/Makefile.am b/Makefile.am
index 07ced30..136bac0 100644
--- a/Makefile.am
+++ b/Makefile.am
@@ -1,9 +1,10 @@
 #
 # Copyright (C) 2017 Bartosz Golaszewski <bartekgola@gmail.com>
 #
-# This program is free software; you can redistribute it and/or modify it
-# under the terms of version 2.1 of the GNU Lesser General Public License
-# as published by the Free Software Foundation.
+# This library is free software; you can redistribute it and/or modify it
+# under the terms of the GNU Lesser General Public License as published by
+# the Free Software Foundation; either version 2.1 of the License, or (at
+# your option) any later version.
 #
 
 ACLOCAL_AMFLAGS = -I m4
diff --git a/configure.ac b/configure.ac
index be30b31..3fe0334 100644
--- a/configure.ac
+++ b/configure.ac
@@ -1,9 +1,10 @@
 #
 # Copyright (C) 2017 Bartosz Golaszewski <bartekgola@gmail.com>
 #
-# This program is free software; you can redistribute it and/or modify it
-# under the terms of version 2.1 of the GNU Lesser General Public License
-# as published by the Free Software Foundation.
+# This library is free software; you can redistribute it and/or modify it
+# under the terms of the GNU Lesser General Public License as published by
+# the Free Software Foundation; either version 2.1 of the License, or (at
+# your option) any later version.
 #
 
 AC_PREREQ(2.61)
diff --git a/include/Makefile.am b/include/Makefile.am
index 38df67b..1a64459 100644
--- a/include/Makefile.am
+++ b/include/Makefile.am
@@ -1,9 +1,10 @@
 #
 # Copyright (C) 2017 Bartosz Golaszewski <bartekgola@gmail.com>
 #
-# This program is free software; you can redistribute it and/or modify it
-# under the terms of version 2.1 of the GNU Lesser General Public License
-# as published by the Free Software Foundation.
+# This library is free software; you can redistribute it and/or modify it
+# under the terms of the GNU Lesser General Public License as published by
+# the Free Software Foundation; either version 2.1 of the License, or (at
+# your option) any later version.
 #
 
 include_HEADERS = gpiod.h
diff --git a/include/gpiod.h b/include/gpiod.h
index bef018f..bc64850 100644
--- a/include/gpiod.h
+++ b/include/gpiod.h
@@ -3,9 +3,10 @@
  *
  * Copyright (C) 2017 Bartosz Golaszewski <bartekgola@gmail.com>
  *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms of version 2.1 of the GNU Lesser General Public License
- * as published by the Free Software Foundation.
+ * This library is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU Lesser General Public License as published by
+ * the Free Software Foundation; either version 2.1 of the License, or (at
+ * your option) any later version.
  */
 
 #ifndef __LIBGPIOD_GPIOD_H__
diff --git a/src/Makefile.am b/src/Makefile.am
index e7b0a86..50b5215 100644
--- a/src/Makefile.am
+++ b/src/Makefile.am
@@ -1,9 +1,10 @@
 #
 # Copyright (C) 2017 Bartosz Golaszewski <bartekgola@gmail.com>
 #
-# This program is free software; you can redistribute it and/or modify it
-# under the terms of version 2.1 of the GNU Lesser General Public License
-# as published by the Free Software Foundation.
+# This library is free software; you can redistribute it and/or modify it
+# under the terms of the GNU Lesser General Public License as published by
+# the Free Software Foundation; either version 2.1 of the License, or (at
+# your option) any later version.
 #
 
 SUBDIRS = lib
diff --git a/src/lib/Makefile.am b/src/lib/Makefile.am
index e9bf007..93fef36 100644
--- a/src/lib/Makefile.am
+++ b/src/lib/Makefile.am
@@ -1,9 +1,10 @@
 #
 # Copyright (C) 2017 Bartosz Golaszewski <bartekgola@gmail.com>
 #
-# This program is free software; you can redistribute it and/or modify it
-# under the terms of version 2.1 of the GNU Lesser General Public License
-# as published by the Free Software Foundation.
+# This library is free software; you can redistribute it and/or modify it
+# under the terms of the GNU Lesser General Public License as published by
+# the Free Software Foundation; either version 2.1 of the License, or (at
+# your option) any later version.
 #
 
 lib_LTLIBRARIES = libgpiod.la
diff --git a/src/lib/core.c b/src/lib/core.c
index a1d6e0e..1279ec1 100644
--- a/src/lib/core.c
+++ b/src/lib/core.c
@@ -3,9 +3,10 @@
  *
  * Copyright (C) 2017 Bartosz Golaszewski <bartekgola@gmail.com>
  *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms of version 2.1 of the GNU Lesser General Public License
- * as published by the Free Software Foundation.
+ * This library is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU Lesser General Public License as published by
+ * the Free Software Foundation; either version 2.1 of the License, or (at
+ * your option) any later version.
  */
 
 /* Low-level, core library code. */
diff --git a/src/lib/helpers.c b/src/lib/helpers.c
index 3b0bcf9..8718386 100644
--- a/src/lib/helpers.c
+++ b/src/lib/helpers.c
@@ -3,9 +3,10 @@
  *
  * Copyright (C) 2017 Bartosz Golaszewski <bartekgola@gmail.com>
  *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms of version 2.1 of the GNU Lesser General Public License
- * as published by the Free Software Foundation.
+ * This library is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU Lesser General Public License as published by
+ * the Free Software Foundation; either version 2.1 of the License, or (at
+ * your option) any later version.
  */
 
 /*
diff --git a/src/lib/iter.c b/src/lib/iter.c
index b9ae310..133634e 100644
--- a/src/lib/iter.c
+++ b/src/lib/iter.c
@@ -3,9 +3,10 @@
  *
  * Copyright (C) 2017 Bartosz Golaszewski <bartekgola@gmail.com>
  *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms of version 2.1 of the GNU Lesser General Public License
- * as published by the Free Software Foundation.
+ * This library is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU Lesser General Public License as published by
+ * the Free Software Foundation; either version 2.1 of the License, or (at
+ * your option) any later version.
  */
 
 /* GPIO chip and line iterators. */
diff --git a/src/lib/misc.c b/src/lib/misc.c
index 4aebbb0..08e2a33 100644
--- a/src/lib/misc.c
+++ b/src/lib/misc.c
@@ -3,9 +3,10 @@
  *
  * Copyright (C) 2017 Bartosz Golaszewski <bartekgola@gmail.com>
  *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms of version 2.1 of the GNU Lesser General Public License
- * as published by the Free Software Foundation.
+ * This library is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU Lesser General Public License as published by
+ * the Free Software Foundation; either version 2.1 of the License, or (at
+ * your option) any later version.
  */
 
 /* Misc code that didn't fit anywhere else. */
diff --git a/src/lib/simple.c b/src/lib/simple.c
index 866bcd5..4876312 100644
--- a/src/lib/simple.c
+++ b/src/lib/simple.c
@@ -3,9 +3,10 @@
  *
  * Copyright (C) 2017 Bartosz Golaszewski <bartekgola@gmail.com>
  *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms of version 2.1 of the GNU Lesser General Public License
- * as published by the Free Software Foundation.
+ * This library is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU Lesser General Public License as published by
+ * the Free Software Foundation; either version 2.1 of the License, or (at
+ * your option) any later version.
  */
 
 /* Implementation of the high-level API. */
diff --git a/src/tools/Makefile.am b/src/tools/Makefile.am
index 41043e2..8099ba4 100644
--- a/src/tools/Makefile.am
+++ b/src/tools/Makefile.am
@@ -1,9 +1,10 @@
 #
 # Copyright (C) 2017 Bartosz Golaszewski <bartekgola@gmail.com>
 #
-# This program is free software; you can redistribute it and/or modify it
-# under the terms of version 2.1 of the GNU Lesser General Public License
-# as published by the Free Software Foundation.
+# This library is free software; you can redistribute it and/or modify it
+# under the terms of the GNU Lesser General Public License as published by
+# the Free Software Foundation; either version 2.1 of the License, or (at
+# your option) any later version.
 #
 
 AM_CFLAGS = -I$(top_srcdir)/include/ -include $(top_builddir)/config.h
diff --git a/src/tools/gpiodetect.c b/src/tools/gpiodetect.c
index 3ba5f7f..a1f8631 100644
--- a/src/tools/gpiodetect.c
+++ b/src/tools/gpiodetect.c
@@ -3,9 +3,10 @@
  *
  * Copyright (C) 2017 Bartosz Golaszewski <bartekgola@gmail.com>
  *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms of version 2.1 of the GNU Lesser General Public License
- * as published by the Free Software Foundation.
+ * This library is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU Lesser General Public License as published by
+ * the Free Software Foundation; either version 2.1 of the License, or (at
+ * your option) any later version.
  */
 
 #include <gpiod.h>
diff --git a/src/tools/gpiofind.c b/src/tools/gpiofind.c
index da756db..3c4ba98 100644
--- a/src/tools/gpiofind.c
+++ b/src/tools/gpiofind.c
@@ -3,9 +3,10 @@
  *
  * Copyright (C) 2017 Bartosz Golaszewski <bartekgola@gmail.com>
  *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms of version 2.1 of the GNU Lesser General Public License
- * as published by the Free Software Foundation.
+ * This library is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU Lesser General Public License as published by
+ * the Free Software Foundation; either version 2.1 of the License, or (at
+ * your option) any later version.
  */
 
 #include <gpiod.h>
diff --git a/src/tools/gpioget.c b/src/tools/gpioget.c
index 37fd7cc..86b1799 100644
--- a/src/tools/gpioget.c
+++ b/src/tools/gpioget.c
@@ -3,9 +3,10 @@
  *
  * Copyright (C) 2017 Bartosz Golaszewski <bartekgola@gmail.com>
  *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms of version 2.1 of the GNU Lesser General Public License
- * as published by the Free Software Foundation.
+ * This library is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU Lesser General Public License as published by
+ * the Free Software Foundation; either version 2.1 of the License, or (at
+ * your option) any later version.
  */
 
 #include <gpiod.h>
diff --git a/src/tools/gpioinfo.c b/src/tools/gpioinfo.c
index 4a13ec1..2a2ffac 100644
--- a/src/tools/gpioinfo.c
+++ b/src/tools/gpioinfo.c
@@ -3,9 +3,10 @@
  *
  * Copyright (C) 2017 Bartosz Golaszewski <bartekgola@gmail.com>
  *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms of version 2.1 of the GNU Lesser General Public License
- * as published by the Free Software Foundation.
+ * This library is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU Lesser General Public License as published by
+ * the Free Software Foundation; either version 2.1 of the License, or (at
+ * your option) any later version.
  */
 
 #include <gpiod.h>
diff --git a/src/tools/gpiomon.c b/src/tools/gpiomon.c
index 9652f29..6101312 100644
--- a/src/tools/gpiomon.c
+++ b/src/tools/gpiomon.c
@@ -3,9 +3,10 @@
  *
  * Copyright (C) 2017 Bartosz Golaszewski <bartekgola@gmail.com>
  *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms of version 2.1 of the GNU Lesser General Public License
- * as published by the Free Software Foundation.
+ * This library is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU Lesser General Public License as published by
+ * the Free Software Foundation; either version 2.1 of the License, or (at
+ * your option) any later version.
  */
 
 #include <gpiod.h>
diff --git a/src/tools/gpioset.c b/src/tools/gpioset.c
index 1a21530..a51a3d5 100644
--- a/src/tools/gpioset.c
+++ b/src/tools/gpioset.c
@@ -3,9 +3,10 @@
  *
  * Copyright (C) 2017 Bartosz Golaszewski <bartekgola@gmail.com>
  *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms of version 2.1 of the GNU Lesser General Public License
- * as published by the Free Software Foundation.
+ * This library is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU Lesser General Public License as published by
+ * the Free Software Foundation; either version 2.1 of the License, or (at
+ * your option) any later version.
  */
 
 #include <gpiod.h>
diff --git a/src/tools/tools-common.c b/src/tools/tools-common.c
index 6e3ce65..5d650a6 100644
--- a/src/tools/tools-common.c
+++ b/src/tools/tools-common.c
@@ -3,9 +3,10 @@
  *
  * Copyright (C) 2017 Bartosz Golaszewski <bartekgola@gmail.com>
  *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms of version 2.1 of the GNU Lesser General Public License
- * as published by the Free Software Foundation.
+ * This library is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU Lesser General Public License as published by
+ * the Free Software Foundation; either version 2.1 of the License, or (at
+ * your option) any later version.
  */
 
 /* Common code for GPIO tools. */
diff --git a/src/tools/tools-common.h b/src/tools/tools-common.h
index 2a0dd66..4ba2e3d 100644
--- a/src/tools/tools-common.h
+++ b/src/tools/tools-common.h
@@ -3,9 +3,10 @@
  *
  * Copyright (C) 2017 Bartosz Golaszewski <bartekgola@gmail.com>
  *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms of version 2.1 of the GNU Lesser General Public License
- * as published by the Free Software Foundation.
+ * This library is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU Lesser General Public License as published by
+ * the Free Software Foundation; either version 2.1 of the License, or (at
+ * your option) any later version.
  */
 
 #ifndef __GPIOD_TOOLS_COMMON_H__
diff --git a/tests/Makefile.am b/tests/Makefile.am
index 5e4ec30..9eee96b 100644
--- a/tests/Makefile.am
+++ b/tests/Makefile.am
@@ -1,9 +1,10 @@
 #
 # Copyright (C) 2017 Bartosz Golaszewski <bartekgola@gmail.com>
 #
-# This program is free software; you can redistribute it and/or modify it
-# under the terms of version 2.1 of the GNU Lesser General Public License
-# as published by the Free Software Foundation.
+# This library is free software; you can redistribute it and/or modify it
+# under the terms of the GNU Lesser General Public License as published by
+# the Free Software Foundation; either version 2.1 of the License, or (at
+# your option) any later version.
 #
 
 AM_CFLAGS = -I$(top_srcdir)/include/ -include $(top_builddir)/config.h
diff --git a/tests/gpiod-test.c b/tests/gpiod-test.c
index 918bbcb..e398240 100644
--- a/tests/gpiod-test.c
+++ b/tests/gpiod-test.c
@@ -3,9 +3,10 @@
  *
  * Copyright (C) 2017 Bartosz Golaszewski <bartekgola@gmail.com>
  *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms of version 2.1 of the GNU Lesser General Public License
- * as published by the Free Software Foundation.
+ * This library is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU Lesser General Public License as published by
+ * the Free Software Foundation; either version 2.1 of the License, or (at
+ * your option) any later version.
  */
 
 #include "gpiod-test.h"
diff --git a/tests/gpiod-test.h b/tests/gpiod-test.h
index 44cabff..63cb37d 100644
--- a/tests/gpiod-test.h
+++ b/tests/gpiod-test.h
@@ -3,9 +3,10 @@
  *
  * Copyright (C) 2017 Bartosz Golaszewski <bartekgola@gmail.com>
  *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms of version 2.1 of the GNU Lesser General Public License
- * as published by the Free Software Foundation.
+ * This library is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU Lesser General Public License as published by
+ * the Free Software Foundation; either version 2.1 of the License, or (at
+ * your option) any later version.
  */
 
 /* Testing framework - functions and definitions used by test cases. */
diff --git a/tests/tests-chip.c b/tests/tests-chip.c
index 4f58218..c199a28 100644
--- a/tests/tests-chip.c
+++ b/tests/tests-chip.c
@@ -3,9 +3,10 @@
  *
  * Copyright (C) 2017 Bartosz Golaszewski <bartekgola@gmail.com>
  *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms of version 2.1 of the GNU Lesser General Public License
- * as published by the Free Software Foundation.
+ * This library is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU Lesser General Public License as published by
+ * the Free Software Foundation; either version 2.1 of the License, or (at
+ * your option) any later version.
  */
 
 /* Test cases for GPIO chip handling. */
diff --git a/tests/tests-event.c b/tests/tests-event.c
index 4c0be5c..1fa44f0 100644
--- a/tests/tests-event.c
+++ b/tests/tests-event.c
@@ -3,9 +3,10 @@
  *
  * Copyright (C) 2017 Bartosz Golaszewski <bartekgola@gmail.com>
  *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms of version 2.1 of the GNU Lesser General Public License
- * as published by the Free Software Foundation.
+ * This library is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU Lesser General Public License as published by
+ * the Free Software Foundation; either version 2.1 of the License, or (at
+ * your option) any later version.
  */
 
 /* Test cases for GPIO line events. */
diff --git a/tests/tests-gpiodetect.c b/tests/tests-gpiodetect.c
index b56db2a..3d19911 100644
--- a/tests/tests-gpiodetect.c
+++ b/tests/tests-gpiodetect.c
@@ -3,9 +3,10 @@
  *
  * Copyright (C) 2017 Bartosz Golaszewski <bartekgola@gmail.com>
  *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms of version 2.1 of the GNU Lesser General Public License
- * as published by the Free Software Foundation.
+ * This library is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU Lesser General Public License as published by
+ * the Free Software Foundation; either version 2.1 of the License, or (at
+ * your option) any later version.
  */
 
 /* Test cases for the gpiodetect program. */
diff --git a/tests/tests-gpiofind.c b/tests/tests-gpiofind.c
index c825c00..2b8db6d 100644
--- a/tests/tests-gpiofind.c
+++ b/tests/tests-gpiofind.c
@@ -3,9 +3,10 @@
  *
  * Copyright (C) 2017 Bartosz Golaszewski <bartekgola@gmail.com>
  *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms of version 2.1 of the GNU Lesser General Public License
- * as published by the Free Software Foundation.
+ * This library is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU Lesser General Public License as published by
+ * the Free Software Foundation; either version 2.1 of the License, or (at
+ * your option) any later version.
  */
 
 /* Test cases for the gpiofind program. */
diff --git a/tests/tests-gpioget.c b/tests/tests-gpioget.c
index db56991..0441a98 100644
--- a/tests/tests-gpioget.c
+++ b/tests/tests-gpioget.c
@@ -3,9 +3,10 @@
  *
  * Copyright (C) 2017 Bartosz Golaszewski <bartekgola@gmail.com>
  *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms of version 2.1 of the GNU Lesser General Public License
- * as published by the Free Software Foundation.
+ * This library is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU Lesser General Public License as published by
+ * the Free Software Foundation; either version 2.1 of the License, or (at
+ * your option) any later version.
  */
 
 /* Test cases for the gpioget program. */
diff --git a/tests/tests-gpioinfo.c b/tests/tests-gpioinfo.c
index 7212ed7..164f14c 100644
--- a/tests/tests-gpioinfo.c
+++ b/tests/tests-gpioinfo.c
@@ -3,9 +3,10 @@
  *
  * Copyright (C) 2017 Bartosz Golaszewski <bartekgola@gmail.com>
  *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms of version 2.1 of the GNU Lesser General Public License
- * as published by the Free Software Foundation.
+ * This library is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU Lesser General Public License as published by
+ * the Free Software Foundation; either version 2.1 of the License, or (at
+ * your option) any later version.
  */
 
 /* Test cases for the gpioinfo program. */
diff --git a/tests/tests-gpiomon.c b/tests/tests-gpiomon.c
index cb40b29..74fe9b7 100644
--- a/tests/tests-gpiomon.c
+++ b/tests/tests-gpiomon.c
@@ -3,9 +3,10 @@
  *
  * Copyright (C) 2017 Bartosz Golaszewski <bartekgola@gmail.com>
  *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms of version 2.1 of the GNU Lesser General Public License
- * as published by the Free Software Foundation.
+ * This library is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU Lesser General Public License as published by
+ * the Free Software Foundation; either version 2.1 of the License, or (at
+ * your option) any later version.
  */
 
 /* Test cases for the gpiomon program. */
diff --git a/tests/tests-gpioset.c b/tests/tests-gpioset.c
index 3d10023..8ad7530 100644
--- a/tests/tests-gpioset.c
+++ b/tests/tests-gpioset.c
@@ -3,9 +3,10 @@
  *
  * Copyright (C) 2017 Bartosz Golaszewski <bartekgola@gmail.com>
  *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms of version 2.1 of the GNU Lesser General Public License
- * as published by the Free Software Foundation.
+ * This library is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU Lesser General Public License as published by
+ * the Free Software Foundation; either version 2.1 of the License, or (at
+ * your option) any later version.
  */
 
 /* Test cases for the gpioset program. */
diff --git a/tests/tests-iter.c b/tests/tests-iter.c
index 3b7039c..e618edb 100644
--- a/tests/tests-iter.c
+++ b/tests/tests-iter.c
@@ -3,9 +3,10 @@
  *
  * Copyright (C) 2017 Bartosz Golaszewski <bartekgola@gmail.com>
  *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms of version 2.1 of the GNU Lesser General Public License
- * as published by the Free Software Foundation.
+ * This library is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU Lesser General Public License as published by
+ * the Free Software Foundation; either version 2.1 of the License, or (at
+ * your option) any later version.
  */
 
 /* Iterator test cases. */
diff --git a/tests/tests-line.c b/tests/tests-line.c
index bc15170..3ad246a 100644
--- a/tests/tests-line.c
+++ b/tests/tests-line.c
@@ -3,9 +3,10 @@
  *
  * Copyright (C) 2017 Bartosz Golaszewski <bartekgola@gmail.com>
  *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms of version 2.1 of the GNU Lesser General Public License
- * as published by the Free Software Foundation.
+ * This library is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU Lesser General Public License as published by
+ * the Free Software Foundation; either version 2.1 of the License, or (at
+ * your option) any later version.
  */
 
 /* GPIO line test cases. */
diff --git a/tests/tests-misc.c b/tests/tests-misc.c
index 949f58a..2d19334 100644
--- a/tests/tests-misc.c
+++ b/tests/tests-misc.c
@@ -3,9 +3,10 @@
  *
  * Copyright (C) 2017 Bartosz Golaszewski <bartekgola@gmail.com>
  *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms of version 2.1 of the GNU Lesser General Public License
- * as published by the Free Software Foundation.
+ * This library is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU Lesser General Public License as published by
+ * the Free Software Foundation; either version 2.1 of the License, or (at
+ * your option) any later version.
  */
 
 /* Misc test cases. */
diff --git a/tests/tests-simple-api.c b/tests/tests-simple-api.c
index 6006203..dbbad3d 100644
--- a/tests/tests-simple-api.c
+++ b/tests/tests-simple-api.c
@@ -3,9 +3,10 @@
  *
  * Copyright (C) 2017 Bartosz Golaszewski <bartekgola@gmail.com>
  *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms of version 2.1 of the GNU Lesser General Public License
- * as published by the Free Software Foundation.
+ * This library is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU Lesser General Public License as published by
+ * the Free Software Foundation; either version 2.1 of the License, or (at
+ * your option) any later version.
  */
 
 /* Test cases for the simple API. */
-- 
2.15.1

