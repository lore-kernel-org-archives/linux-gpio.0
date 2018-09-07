From: =?UTF-8?q?Daniel=20D=C3=ADaz?= <daniel.diaz@linaro.org>
Subject: [PATCH v3 1/2] selftests: gpio: restructure Makefile
Date: Fri,  7 Sep 2018 09:34:54 -0500
Message-ID: <1536330895-8391-1-git-send-email-daniel.diaz@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: shuahkh@osg.samsung.com, linux-kselftest@vger.kernel.org
Cc: linus.walleij@linaro.org, Fathi Boudra <fathi.boudra@linaro.org>, =?UTF-8?q?Daniel=20D=C3=ADaz?= <daniel.diaz@linaro.org>, Bamvor Jian Zhang <bamv2005@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>, Shuah Khan <shuah@kernel.org>, "open list:GPIO MOCKUP DRIVER" <linux-gpio@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

From: Fathi Boudra <fathi.boudra@linaro.org>

This patch cleans up the Makefile by restructuring a couple of
things, namely:
1) change explicit paths in targets for variables
2) substitute a variable (BINARIES) for another, part of the
   selftests build system (TEST_PROGS_EXTENDED)
3) proper cleaning up of the EXTRA objects

The resulting Makefile is much more readable and manageable.

Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
Signed-off-by: Daniel Díaz <daniel.diaz@linaro.org>
---
 tools/testing/selftests/gpio/Makefile | 32 +++++++++++++++-----------------
 1 file changed, 15 insertions(+), 17 deletions(-)

diff --git a/tools/testing/selftests/gpio/Makefile b/tools/testing/selftests/gpio/Makefile
index 4665cdb..a4a01ec8 100644
--- a/tools/testing/selftests/gpio/Makefile
+++ b/tools/testing/selftests/gpio/Makefile
@@ -1,28 +1,26 @@
 # SPDX-License-Identifier: GPL-2.0
 
+CFLAGS += -O2 -g -std=gnu99 -Wall -I../../../../usr/include/
+LDLIBS += -lmount -I/usr/include/libmount
+
 TEST_PROGS := gpio-mockup.sh
-TEST_FILES := gpio-mockup-sysfs.sh $(BINARIES)
-BINARIES := gpio-mockup-chardev
-EXTRA_PROGS := ../gpiogpio-event-mon ../gpiogpio-hammer ../gpiolsgpio
-EXTRA_DIRS := ../gpioinclude/
-EXTRA_OBJS := ../gpiogpio-event-mon-in.o ../gpiogpio-event-mon.o
-EXTRA_OBJS += ../gpiogpio-hammer-in.o ../gpiogpio-utils.o ../gpiolsgpio-in.o
-EXTRA_OBJS += ../gpiolsgpio.o
+TEST_FILES := gpio-mockup-sysfs.sh
+TEST_PROGS_EXTENDED := gpio-mockup-chardev
+
+GPIODIR := ../../../gpio
+GPIOOBJ := gpio-utils.o
 
 include ../lib.mk
 
-all: $(BINARIES)
+all: $(TEST_PROGS_EXTENDED)
 
 override define CLEAN
-	$(RM) $(BINARIES) $(EXTRA_PROGS) $(EXTRA_OBJS)
-	$(RM) -r $(EXTRA_DIRS)
+	$(RM) $(TEST_PROGS_EXTENDED)
+	$(MAKE) -C $(GPIODIR) clean
 endef
 
-CFLAGS += -O2 -g -std=gnu99 -Wall -I../../../../usr/include/
-LDLIBS += -lmount -I/usr/include/libmount
-
-$(BINARIES):| khdr
-$(BINARIES): ../../../gpio/gpio-utils.o
+$(TEST_PROGS_EXTENDED):| khdr
+$(TEST_PROGS_EXTENDED): $(GPIODIR)/$(GPIOOBJ)
 
-../../../gpio/gpio-utils.o:
-	make ARCH=$(ARCH) CROSS_COMPILE=$(CROSS_COMPILE) -C ../../../gpio
+$(GPIODIR)/$(GPIOOBJ):
+	$(MAKE) -C $(GPIODIR)
-- 
2.7.4
