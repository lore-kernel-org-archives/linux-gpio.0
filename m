From: Joel Stanley <joel@jms.id.au>
Subject: [PATCH] tools/gpio: Fix build error with musl libc
Date: Thu, 21 Dec 2017 11:11:31 +1030
Message-ID: <20171221004131.23691-1-joel@jms.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <stable-owner@vger.kernel.org>
Sender: stable-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

The GPIO tools build fails when using a buildroot toolchain that uses musl
as it's C library:

arm-broomstick-linux-musleabi-gcc -Wp,-MD,./.gpio-event-mon.o.d \
 -Wp,-MT,gpio-event-mon.o -O2 -Wall -g -D_GNU_SOURCE \
 -Iinclude -D"BUILD_STR(s)=#s" -c -o gpio-event-mon.o gpio-event-mon.c
gpio-event-mon.c:30:6: error: unknown type name ‘u_int32_t’; did you mean ‘uint32_t’?
      u_int32_t handleflags,
      ^~~~~~~~~
      uint32_t

The glibc headers installed on my laptop include sys/types.h in
unistd.h, but it appears that musl does not.

Fixes: 97f69747d8b1 ("tools/gpio: add the gpio-event-mon tool")
Cc: stable@vger.kernel.org
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 tools/gpio/gpio-event-mon.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/gpio/gpio-event-mon.c b/tools/gpio/gpio-event-mon.c
index 1c14c2595158..4b36323ea64b 100644
--- a/tools/gpio/gpio-event-mon.c
+++ b/tools/gpio/gpio-event-mon.c
@@ -23,6 +23,7 @@
 #include <getopt.h>
 #include <inttypes.h>
 #include <sys/ioctl.h>
+#include <sys/types.h>
 #include <linux/gpio.h>
 
 int monitor_device(const char *device_name,
-- 
2.15.1
