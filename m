From: Shuah Khan <shuahkh@osg.samsung.com>
Subject: [PATCH 2/2] selftests: gpio: fix clean target to remove all generated files and dirs
Date: Fri, 21 Apr 2017 18:13:01 -0600
Message-ID: <f6b7e8bffbbf2ce909320dd797dc00ec7c6b8846.1492819732.git.shuahkh@osg.samsung.com>
References: <cover.1492819732.git.shuahkh@osg.samsung.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com ([52.27.115.49]:42822
        "EHLO osg.samsung.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1426738AbdDVANJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 21 Apr 2017 20:13:09 -0400
In-Reply-To: <cover.1492819732.git.shuahkh@osg.samsung.com>
In-Reply-To: <cover.1492819732.git.shuahkh@osg.samsung.com>
References: <cover.1492819732.git.shuahkh@osg.samsung.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: shuah@kernel.org, bamvor.zhangjian@linaro.org
Cc: Shuah Khan <shuahkh@osg.samsung.com>, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org

gpio test creates executables, object files, and include directory
under selftests directory. Enhance clean target to remove all files
it generates.

Signed-off-by: Shuah Khan <shuahkh@osg.samsung.com>
---
 tools/testing/selftests/gpio/Makefile | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/gpio/Makefile b/tools/testing/selftests/gpio/Makefile
index 4f6d9e0..298929d 100644
--- a/tools/testing/selftests/gpio/Makefile
+++ b/tools/testing/selftests/gpio/Makefile
@@ -2,13 +2,19 @@
 TEST_PROGS := gpio-mockup.sh
 TEST_FILES := gpio-mockup-sysfs.sh $(BINARIES)
 BINARIES := gpio-mockup-chardev
+EXTRA_PROGS := ../gpiogpio-event-mon ../gpiogpio-hammer ../gpiolsgpio
+EXTRA_DIRS := ../gpioinclude/
+EXTRA_OBJS := ../gpiogpio-event-mon-in.o ../gpiogpio-event-mon.o
+EXTRA_OBJS += ../gpiogpio-hammer-in.o ../gpiogpio-utils.o ../gpiolsgpio-in.o
+EXTRA_OBJS += ../gpiolsgpio.o
 
 include ../lib.mk
 
 all: $(BINARIES)
 
 override define CLEAN
-	$(RM) $(BINARIES)
+	$(RM) $(BINARIES) $(EXTRA_PROGS) $(EXTRA_OBJS)
+	$(RM) -r $(EXTRA_DIRS)
 endef
 
 CFLAGS += -O2 -g -std=gnu99 -Wall -I../../../../usr/include/
-- 
2.9.3

