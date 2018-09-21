From: Li Zhijian <lizhijian@cn.fujitsu.com>
Subject: [PATCH] selftests/gpio: fix compiling errors
Date: Fri, 21 Sep 2018 18:00:21 +0800
Message-ID: <1537524021-3371-1-git-send-email-lizhijian@cn.fujitsu.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: shuah@kernel.org, linux-kselftest@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Li Zhijian <lizhijian@cn.fujitsu.com>, Bamvor Jian Zhang <bamv2005@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

lizhijian@haswell-OptiPlex-9020:/home/lizj/linux/tools/testing/selftests$ make
[...snip...]
make ARCH=x86 CROSS_COMPILE= -C ../../../gpio
make[2]: Entering directory '/home/lizj/linux/tools/gpio'
[...snip...]
make[3]: Leaving directory '/home/lizj/linux/tools/gpio'
  LINK     /home/lizj/linux/tools/testing/selftests/gpiogpio-event-mon
make[2]: Leaving directory '/home/lizj/linux/tools/gpio'
gcc -O2 -g -std=gnu99 -Wall -I../../../../usr/include/ gpio-mockup-chardev.c ../../../gpio/gpio-utils.o  -lmount -I/usr/include/libmount -o gpio-mockup-chardev
gcc: error: ../../../gpio/gpio-utils.o: No such file or directory
<builtin>: recipe for target 'gpio-mockup-chardev' failed
make[1]: *** [gpio-mockup-chardev] Error 1
make[1]: Leaving directory
'/home/lizj/linux/tools/testing/selftests/gpio'
Makefile:85: recipe for target 'all' failed
make: *** [all] Error 2

in this patch
- correct target name to $OUTPUTgpio-utils.o
- pass OUTPUT to tools/gpio/Makefile
- support cleanup ../gpiogpio-hammer.o

CC: Bamvor Jian Zhang <bamv2005@gmail.com>
CC: Bartosz Golaszewski <brgl@bgdev.pl>
CC: Shuah Khan <shuah@kernel.org>
CC: linux-gpio@vger.kernel.org
Signed-off-by: Li Zhijian <lizhijian@cn.fujitsu.com>
---
 tools/testing/selftests/gpio/Makefile | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/gpio/Makefile b/tools/testing/selftests/gpio/Makefile
index 4665cdb..7f9354a 100644
--- a/tools/testing/selftests/gpio/Makefile
+++ b/tools/testing/selftests/gpio/Makefile
@@ -7,7 +7,7 @@ EXTRA_PROGS := ../gpiogpio-event-mon ../gpiogpio-hammer ../gpiolsgpio
 EXTRA_DIRS := ../gpioinclude/
 EXTRA_OBJS := ../gpiogpio-event-mon-in.o ../gpiogpio-event-mon.o
 EXTRA_OBJS += ../gpiogpio-hammer-in.o ../gpiogpio-utils.o ../gpiolsgpio-in.o
-EXTRA_OBJS += ../gpiolsgpio.o
+EXTRA_OBJS += ../gpiolsgpio.o ../gpiogpio-hammer.o
 
 include ../lib.mk
 
@@ -22,7 +22,7 @@ CFLAGS += -O2 -g -std=gnu99 -Wall -I../../../../usr/include/
 LDLIBS += -lmount -I/usr/include/libmount
 
 $(BINARIES):| khdr
-$(BINARIES): ../../../gpio/gpio-utils.o
+$(BINARIES): ../gpiogpio-utils.o
 
-../../../gpio/gpio-utils.o:
-	make ARCH=$(ARCH) CROSS_COMPILE=$(CROSS_COMPILE) -C ../../../gpio
+../gpiogpio-utils.o:
+	make OUTPUT=$(OUTPUT) ARCH=$(ARCH) CROSS_COMPILE=$(CROSS_COMPILE) -C ../../../gpio
-- 
2.7.4
