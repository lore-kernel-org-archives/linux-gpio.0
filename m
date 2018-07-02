From: Li Zhijian <lizhijian@cn.fujitsu.com>
Subject: [PATCH 3/3] selftests/gpio: unset OUTPUT for build tools/gpio
Date: Mon,  2 Jul 2018 11:53:54 +0800
Message-ID: <1530503634-32241-4-git-send-email-lizhijian@cn.fujitsu.com>
References: <1530503634-32241-1-git-send-email-lizhijian@cn.fujitsu.com>
 <1530503634-32241-2-git-send-email-lizhijian@cn.fujitsu.com>
 <1530503634-32241-3-git-send-email-lizhijian@cn.fujitsu.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1530503634-32241-3-git-send-email-lizhijian@cn.fujitsu.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, shuah@kernel.org
Cc: Li Zhijian <lizhijian@cn.fujitsu.com>, Bamvor Jian Zhang <bamv2005@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

when we execute 'make' to build selftests, the TOP Makefile build gpio like:
selftests$ make ARCH= CROSS_COMPILE= OUTPUT=/home/lizj/linux/tools/testing/selftests/gpio -C gpio
...
make[2]: Leaving directory '/home/lizj/linux/tools/gpio'
gcc -O2 -g -std=gnu99 -Wall -I../../../../usr/include/gpio-mockup-chardev.c ../../../gpio/gpio-utils.o ../../../../usr/include/linux/gpio.h  -I/usr/include/libmount -I/usr/include/blkid -I/usr/include/uuid -lmount -o gpio-mockup-chardev
gcc: error: ../../../gpio/gpio-utils.o: No such file or directory
<builtin>: recipe for target 'gpio-mockup-chardev' failed
make[1]: *** [gpio-mockup-chardev] Error 1
make[1]: Leaving directory
'/home/lizj/linux/tools/testing/selftests/gpio'
Makefile:84: recipe for target 'all' failed
make: *** [all] Error 2

CC: Bamvor Jian Zhang <bamv2005@gmail.com>
CC: Bartosz Golaszewski <brgl@bgdev.pl>
CC: Shuah Khan <shuah@kernel.org>
CC: linux-gpio@vger.kernel.org
Signed-off-by: Li Zhijian <lizhijian@cn.fujitsu.com>
---
 tools/testing/selftests/gpio/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/gpio/Makefile b/tools/testing/selftests/gpio/Makefile
index 1bbb475..e64a11c 100644
--- a/tools/testing/selftests/gpio/Makefile
+++ b/tools/testing/selftests/gpio/Makefile
@@ -24,7 +24,7 @@ LDLIBS += -lmount -I/usr/include/libmount
 $(BINARIES): ../../../gpio/gpio-utils.o ../../../../usr/include/linux/gpio.h
 
 ../../../gpio/gpio-utils.o:
-	make ARCH=$(ARCH) CROSS_COMPILE=$(CROSS_COMPILE) -C ../../../gpio
+	make OUTPUT= ARCH=$(ARCH) CROSS_COMPILE=$(CROSS_COMPILE) -C ../../../gpio
 
 ../../../../usr/include/linux/gpio.h:
 	make -C ../../../.. headers_install INSTALL_HDR_PATH=$(shell pwd)/../../../../usr/
-- 
2.7.4
