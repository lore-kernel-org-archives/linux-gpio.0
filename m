From: =?UTF-8?q?Daniel=20D=C3=ADaz?= <daniel.diaz@linaro.org>
Subject: [PATCH] selftests: gpio: Find libmount with pkg-config if available
Date: Tue, 16 Oct 2018 16:46:59 -0500
Message-ID: <20181016214659.22362-1-daniel.diaz@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: shuah@kernel.org, linux-kselftest@vger.kernel.org
Cc: =?UTF-8?q?Daniel=20D=C3=ADaz?= <daniel.diaz@linaro.org>, Bamvor Jian Zhang <bamv2005@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>, "open list:GPIO MOCKUP DRIVER" <linux-gpio@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

If pkg-config is available, use it to define the CFLAGS and
LDLIBS needed for libmount; else, use the current hard-coded
paths and options.

Using pkg-config is very helpful for cross-compilation
environments, and is sometimes readily available on developer
boxes to ensure we get the right compiler/linker options for
the given package.

Signed-off-by: Daniel Díaz <daniel.diaz@linaro.org>
---
 tools/testing/selftests/gpio/Makefile | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/gpio/Makefile b/tools/testing/selftests/gpio/Makefile
index 46648427d537..f22b22aef7bf 100644
--- a/tools/testing/selftests/gpio/Makefile
+++ b/tools/testing/selftests/gpio/Makefile
@@ -1,7 +1,13 @@
 # SPDX-License-Identifier: GPL-2.0
 
-CFLAGS += -O2 -g -std=gnu99 -Wall -I../../../../usr/include/
-LDLIBS += -lmount -I/usr/include/libmount
+MOUNT_CFLAGS := $(shell pkg-config --cflags mount 2>/dev/null)
+MOUNT_LDLIBS := $(shell pkg-config --libs mount 2>/dev/null)
+ifeq ($(MOUNT_LDLIBS),)
+MOUNT_LDLIBS := -lmount -I/usr/include/libmount
+endif
+
+CFLAGS += -O2 -g -std=gnu99 -Wall -I../../../../usr/include/ $(MOUNT_CFLAGS)
+LDLIBS += $(MOUNT_LDLIBS)
 
 TEST_PROGS := gpio-mockup.sh
 TEST_FILES := gpio-mockup-sysfs.sh
-- 
2.17.1
