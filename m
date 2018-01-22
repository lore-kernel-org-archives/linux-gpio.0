From: Clemens Gruber <clemens.gruber@pqgruber.com>
Subject: [PATCH] [libgpiod] Add pkg-config support
Date: Mon, 22 Jan 2018 17:12:12 +0100
Message-ID: <20180122161213.3076-1-clemens.gruber@pqgruber.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.pqgruber.com ([178.189.19.235]:37229 "EHLO
        mail.pqgruber.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751007AbeAVQPV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Jan 2018 11:15:21 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Clemens Gruber <clemens.gruber@pqgruber.com>

Create a libgpiod.pc file for pkg-config. Allows to use
PKG_CHECK_MODULES([gpiod], [libgpiod >= 1.0],,) in other
autoconf-based projects.

Signed-off-by: Clemens Gruber <clemens.gruber@pqgruber.com>
---
 Makefile.am    |  3 +++
 configure.ac   |  3 ++-
 libgpiod.pc.in | 11 +++++++++++
 3 files changed, 16 insertions(+), 1 deletion(-)
 create mode 100644 libgpiod.pc.in

diff --git a/Makefile.am b/Makefile.am
index af7aecb..dfa6d47 100644
--- a/Makefile.am
+++ b/Makefile.am
@@ -11,6 +11,9 @@ ACLOCAL_AMFLAGS = -I m4
 AUTOMAKE_OPTIONS = foreign
 SUBDIRS = include src
 
+pkgconfigdir = $(libdir)/pkgconfig
+pkgconfig_DATA = libgpiod.pc
+
 if WITH_TESTS
 
 SUBDIRS += tests
diff --git a/configure.ac b/configure.ac
index b4bf214..bb18868 100644
--- a/configure.ac
+++ b/configure.ac
@@ -120,7 +120,8 @@ then
 	AC_MSG_NOTICE([doxygen not found - documentation cannot be generated])
 fi
 
-AC_CONFIG_FILES([Makefile
+AC_CONFIG_FILES([libgpiod.pc
+		 Makefile
 		 include/Makefile
 		 src/Makefile
 		 src/lib/Makefile
diff --git a/libgpiod.pc.in b/libgpiod.pc.in
new file mode 100644
index 0000000..48ff113
--- /dev/null
+++ b/libgpiod.pc.in
@@ -0,0 +1,11 @@
+prefix=@prefix@
+exec_prefix=@exec_prefix@
+libdir=@libdir@
+includedir=@includedir@
+
+Name: libgpiod
+Description: Library and tools for the Linux GPIO chardev
+URL: @PACKAGE_URL@
+Version: @PACKAGE_VERSION@
+Libs: -L${libdir} -lgpiod
+Cflags: -I${includedir}
-- 
2.16.0

