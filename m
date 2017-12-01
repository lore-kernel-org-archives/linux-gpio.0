From: SZ Lin <sz.lin@moxa.com>
Subject: [libgpiod v0.3.x][PATCH] Make license type consistent between source files and COPYING file
Date: Fri,  1 Dec 2017 22:18:28 +0800
Message-ID: <20171201141828.20092-1-sz.lin@moxa.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pg0-f66.google.com ([74.125.83.66]:46904 "EHLO
        mail-pg0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752604AbdLAOSk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 1 Dec 2017 09:18:40 -0500
Received: by mail-pg0-f66.google.com with SMTP id b11so4535868pgu.13
        for <linux-gpio@vger.kernel.org>; Fri, 01 Dec 2017 06:18:39 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: bartekgola@gmail.com
Cc: linux-gpio@vger.kernel.org, SZ Lin <sz.lin@moxa.com>

The license type of COPYING file is "LGPL-2.1+", but it declared
with "LGPL-2.1" in the beginning of source files

This patch fixes license type inconsistent issue in each source file
(cherry picked from commit 423c8c3c5255d8324435c902de6c51ad4f294c21)
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
 32 files changed, 128 insertions(+), 96 deletions(-)

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
index b9967dd..66919cd 100644
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
index 2750f49..73b63f1 100644
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
 
 /**
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
index 622687a..f21dbea 100644
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
index a5a7f2f..5c66036 100644
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
 
 #include <gpiod.h>
diff --git a/src/tools/Makefile.am b/src/tools/Makefile.am
index 7795548..74c257c 100644
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
index 10d16a2..97f441e 100644
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
index 9fbea7a..7c72f7a 100644
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
index 7d2849c..72b56c4 100644
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
index 3862a61..263b09c 100644
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
index f16679c..988cbef 100644
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
index 7ac1f4d..6bbbfc1 100644
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
index 5c2df53..ee4a838 100644
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
 
 #include <gpiod.h>
diff --git a/src/tools/tools-common.h b/src/tools/tools-common.h
index 7adabf2..47dd003 100644
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
index 0cdf336..00d8c3c 100644
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
index b6d5602..5923f29 100644
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
index d72b7d3..741bec8 100644
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
 
 #ifndef __GPIOD_TEST_H__
diff --git a/tests/tests-chip.c b/tests/tests-chip.c
index 941fb3b..751335a 100644
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
 
 #include "gpiod-test.h"
diff --git a/tests/tests-event.c b/tests/tests-event.c
index 532b00e..59f28f5 100644
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
 
 #include "gpiod-test.h"
diff --git a/tests/tests-gpiodetect.c b/tests/tests-gpiodetect.c
index dc91777..b4ca115 100644
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
 
 #include "gpiod-test.h"
diff --git a/tests/tests-gpiofind.c b/tests/tests-gpiofind.c
index 2ac3e9c..758923f 100644
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
 
 #include "gpiod-test.h"
diff --git a/tests/tests-gpioget.c b/tests/tests-gpioget.c
index e5ebc70..f0675ca 100644
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
 
 #include "gpiod-test.h"
diff --git a/tests/tests-gpioinfo.c b/tests/tests-gpioinfo.c
index 9a83e56..6146937 100644
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
 
 #include "gpiod-test.h"
diff --git a/tests/tests-gpiomon.c b/tests/tests-gpiomon.c
index 437de8b..31400c8 100644
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
 
 #include "gpiod-test.h"
diff --git a/tests/tests-gpioset.c b/tests/tests-gpioset.c
index 1001d8c..1daa6c8 100644
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
 
 #include "gpiod-test.h"
diff --git a/tests/tests-iter.c b/tests/tests-iter.c
index daee771..1147fac 100644
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
 
 #include "gpiod-test.h"
diff --git a/tests/tests-line.c b/tests/tests-line.c
index be031b5..423dbfb 100644
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
 
 #include "gpiod-test.h"
diff --git a/tests/tests-misc.c b/tests/tests-misc.c
index 178c277..1db13e2 100644
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
 
 #include "gpiod-test.h"
diff --git a/tests/tests-simple-api.c b/tests/tests-simple-api.c
index 24f5a8a..7470b9b 100644
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
 
 #include "gpiod-test.h"
-- 
2.15.1

